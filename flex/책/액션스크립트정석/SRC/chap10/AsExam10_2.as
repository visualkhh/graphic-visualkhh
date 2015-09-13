package 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
    [SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
	public class AsExam10_2 extends Sprite
	{
		// 공을 하나 추가한다.
		private var sp:Sprite = new Sprite();
		public function AsExam10_2()
		{
			displayMain();
			addEventHandlers();
		}
		// 공을 화면 중앙에 추가한다.
		private function displayMain():void
		{
			sp.graphics.beginFill(Math.random()*0x100000);
			sp.graphics.drawCircle(0, 0, 20);
			this.addChild(sp);
		}
		// 마우스무브 이벤트 핸들러 함수를 추가한다.
		private function addEventHandlers():void
		{
			stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
		}
		// 마우스가 움직이는 곳으로 공을 이동 시킨다. 
		private function mouseMoveHandler(event:MouseEvent):void
		{
            sp.x = event.stageX;
            sp.y = event.stageY;
        }			
	}
}
