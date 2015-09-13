package 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	[SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
	public class AsExam9_2 extends Sprite 
	{
		// 시작좌표, 마우스를 클릭한 지점  
		private var startPt:Point;
		// 종료좌표, 마우스를 놓은 지점
		private var endPt:Point;
		// 마우스 다운, 업 이벤트 핸들러 함수를 등록한다. 
		public function AsExam9_2()	
		{
			stage.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			stage.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
		}
        // 마우스를 누르면 startPt에 좌표값을 할당하고
        // 마우스무브 핸들러 함수를 등록한다.		
		private function mouseDownHandler(event:MouseEvent):void
		{
			startPt = new Point(event.stageX, event.stageY);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
		}
		// 마우스를 놓으면 마우스 무브핸들러 함수를 제거한다.
		private function mouseUpHandler(event:MouseEvent):void
		{
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
		}		
		// 마우스가 움직이면 그 좌표까지 아우르는 Rectangle을 만든 다음 Rectangle 영역 만큼 화면에 사각형을 그린다.
		private function mouseMoveHandler(event:MouseEvent):void
		{
			endPt = new Point(event.stageX, event.stageY);
			var rect:Rectangle = new Rectangle(startPt.x, startPt.y, endPt.x - startPt.x, endPt.y - startPt.y);
			trace(rect);
			this.graphics.clear();
			this.graphics.lineStyle(2, Math.random() * 0x1000000);
			this.graphics.drawRect(startPt.x, startPt.y, endPt.x - startPt.x, endPt.y - startPt.y);
			this.graphics.endFill();
		}
	}
}