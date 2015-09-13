package 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	[SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
	public class AsExam9_23 extends Sprite 
	{
		// fillRect와 floodFill을 수행할 Bitmap객체
		private var bitmapImage:Bitmap;
		// 마우스 드래그 시작점
		private var startPt:Point;
		// 마우스 드래그 종료점
		private var endPt:Point;
		
		public function AsExam9_23()	
		{
			displayMain();
			addEventHandlers();
		}
		// 비트맵데이터를 생성하여 화면에 추가한다. 
		private function displayMain():void
		{
			var bmd:BitmapData = new BitmapData(1000, 1000, false, 0xFFFFFF);
			bmd.fillRect(new Rectangle(stage.stageWidth/2, stage.stageHeight/2, 50, 50), Math.random()*0x1000000);
			bitmapImage = new Bitmap(bmd);
			this.addChild(bitmapImage);
		}
		// 드래그작업을 위한 마우스다운, 마우스업 이벤트 핸들러 함수와 더블클릭 이벤트 핸들러를 등록
		private function addEventHandlers():void
		{
			stage.doubleClickEnabled = true;
			stage.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			stage.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			stage.addEventListener(MouseEvent.DOUBLE_CLICK, doubleClickHandler);
		}
		// 더블클릭을 하면 floodFill 수행 
		private function doubleClickHandler(event:MouseEvent):void
		{
			bitmapImage.bitmapData.floodFill(event.stageX, event.stageY, 0x000000FF);
		}
		// 마우스를 누르면 누른 포인트를 저장하고 드래그를 위해 마우스 무브핸들러 함수 등록
		private function mouseDownHandler(event:MouseEvent):void
		{
			startPt = new Point(event.stageX, event.stageY);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
		}
        // 마우스가 움직이면 그 지점을 저장하고, 드래그한 사각영역에 fillRect 수행	
		private function mouseMoveHandler(event:MouseEvent):void
		{
			endPt = new Point(event.stageX, event.stageY);
			// 드래그한 사각영역 객체 생성
			var rect:Rectangle = new Rectangle(startPt.x, startPt.y, endPt.x - startPt.x, endPt.y - startPt.y);
			// fillRect 함수를 호출하여 색상을 그린다.
			bitmapImage.bitmapData.fillRect(rect, Math.random() * 0x1000000);
		}
		// 마우스를 놓으면 마우스무브 핸들러 함수 제거
		private function mouseUpHandler(event:MouseEvent):void
		{
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
		}
	}
}