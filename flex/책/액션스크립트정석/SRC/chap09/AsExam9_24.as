package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	[SWF(backgroundColor=0xFFFFFF)]
	public class AsExam9_24 extends Sprite
	{
		// getColorBoundsRect 경계를 그려주기 위한 Sprite 
		private var sp:Sprite = new Sprite();
		// fillRect로 사각형을 그리기 위한 비트맵
		private var bm:Bitmap;
		public function AsExam9_24()
		{
			displayMain();
			addEventHandlers();
		}
		
		private function displayMain():void
		{
			// 비트맵데이터를 생성한다.
			var bmd:BitmapData = new BitmapData(80, 80, false, 0xCCCCCC);
			// 좌상단의 빨간색 정사각형
			var rect1:Rectangle = new Rectangle(0, 0, 20, 20);
			bmd.fillRect(rect1, 0xFF0000);
			// 우측의 파란색 직사각형
			var rect2:Rectangle = new Rectangle(40, 0, 40, 40);
			bmd.fillRect(rect2, 0x0000FF);
			// 우상단의 노란색 정사각형
			var rect3:Rectangle = new Rectangle(60, 0, 20, 20);
			bmd.fillRect(rect3, 0xFFFF00);
			// 우하단의 빨간색 정사각형
			var rect4:Rectangle = new Rectangle(60, 20, 20, 20);
			bmd.fillRect(rect4, 0xFF0000);
			bm = new Bitmap(bmd);    
			this.addChild(bm);		
			this.addChild(sp);
		}
		// 클릭 이벤트 핸들러 함수 등록
		private function addEventHandlers():void
		{
			stage.addEventListener(MouseEvent.CLICK, clickHandler);			
		}
        // 비트맵 색상영역을 클릭하면 일치하는 색상영역을 표시한다.
		private function clickHandler(event:MouseEvent):void
		{
			// 클릭한 지점의 색상 추출
			var pixelValue:uint = bm.bitmapData.getPixel(event.stageX, event.stageY);
			trace('클릭한 지점의 색상', pixelValue.toString(16));
			// 클릭한 지점의 색상을 필터링한다.(& 연산으로 마스킹) 
			// 예) 0xFFFFFF 모든 색에 대해 검사
			// 예) 0xFF0000 빨간색이 포함된 색상만 검사
			// 예) 0x00FF00 녹색이 포함된 색상만 검사
			var maskColor:uint = 0xFFFFFF; 
			// 클릭한 지점과 일치하는 색상이 포함된 사각영역을 리턴한다.
			var redBounds:Rectangle = bm.bitmapData.getColorBoundsRect(maskColor, pixelValue, true);
			// 사각영역의 경계를 화면에 그린다. 
			drawBorder(redBounds);
		}
		// 사각영역의 경계를 연두색 사각형으로 그린다.
		private function drawBorder(redBounds:Rectangle):void
		{
			sp.graphics.clear();
			sp.graphics.lineStyle(2, 0x00FF00);
			sp.graphics.drawRect(redBounds.x, redBounds.y, redBounds.width, redBounds.height);
			sp.graphics.endFill();
		}
	}
}