package 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	[SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
	public class AsExam9_1 extends Sprite 
	{
		private var sp:Sprite = new Sprite();
		
		public function AsExam9_1()	
		{
			this.addChild(sp);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
		}
		// 마우스가 움직일 때 마다 중심(200, 200)에서 마우스 위치까지 원을 그리고 중심부터의 거리를 계산한다.
		private function mouseMoveHandler(event:MouseEvent):void 
		{
			sp.graphics.clear();
			// stage크기로부터 중심을 계산
			sp.graphics.moveTo(stage.stageWidth/2, stage.stageHeight/2);
			sp.graphics.lineStyle(2, Math.random() * 0x1000000);
			sp.graphics.lineTo(event.stageX, event.stageY);
			// 중심 
			var pt0:Point = new Point(stage.stageWidth/2, stage.stageHeight/2);
			// 마우스 위치
			var pt1:Point = new Point(event.stageX, event.stageY);
			// 중심으로부터 거리 계산
			var distance:Number = Point.distance(pt0, pt1);     
			trace('중심에서 거리:' + distance);
			sp.graphics.drawCircle(pt0.x, pt0.y, distance);
		}
	}
}
