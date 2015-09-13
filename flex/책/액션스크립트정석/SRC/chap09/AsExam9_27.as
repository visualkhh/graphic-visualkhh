package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.filters.BlurFilter;
	import flash.geom.Point;
	import flash.geom.Rectangle;	
	[SWF(backgroundColor=0xFFFFFF)]
	public class AsExam9_27 extends Sprite
	{
		// Blur 필터를 적용하기 위한 비트맵
		private var bm:Bitmap;
		// 필터 적용 영역을 드로잉하기 위한 Shape
		private var sh:Shape = new Shape();
		public function AsExam9_27()
		{
			displayMain();
			addEventHandlers();
		}
        // 300 * 300 사이즈로 비트맵 생성		
		private function displayMain():void
		{
			var bmd:BitmapData = new BitmapData(300, 300, false, 0xCCCCCC);
			bm = new Bitmap(bmd);
			this.addChild(bm);
			this.addChild(sh);			
		}
		// 마우스 무브 핸들러 추가
		private function addEventHandlers():void
		{
			stage.addEventListener(MouseEvent.MOUSE_MOVE, moveHandler);
		}
		// 마우스가 위치한 곳에 Blur필터를 적용하고 필터 적용 영역을 화면에 표시함
		private function moveHandler(event:MouseEvent):void
		{
			var pt:Point = new Point(event.stageX, event.stageY);
			// Blur 필터 생성
			var filter:BlurFilter = new BlurFilter();
			// 마우스 위치로부터 50*50 사이즈의 사각 영역에 필터 적용
			var filterRect:Rectangle = new Rectangle(event.stageX, event.stageY, 50, 50);
			// 필터를 적용하려는 곳의 색상을 랜덤하게 변경함 
			bm.bitmapData.fillRect(filterRect, Math.random()*0x1000000);
			// 비트맵에 필터 적용
			bm.bitmapData.applyFilter(bm.bitmapData, filterRect, pt, filter);
            // 필터가 적용되는 사각영역값을 알아내어 빨간색의 사각형으로 표시한다.			
			var rect:Rectangle = bm.bitmapData.generateFilterRect(filterRect, filter);
			sh.graphics.clear();
			sh.graphics.lineStyle(2, 0xFF0000);
			sh.graphics.drawRect(rect.x, rect.y, rect.width, rect.height);
		}		
	}
}