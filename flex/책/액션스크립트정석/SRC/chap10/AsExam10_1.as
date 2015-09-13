package 
{
	import flash.display.Sprite;
	import flash.events.Event;
    [SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
	public class AsExam10_1 extends Sprite
	{
		// 공을 하나 추가한다.
		private var sp:Sprite = new Sprite();
		public function AsExam10_1()
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
		// 엔터프레임 이벤트 핸들러 함수를 추가한다.
		private function addEventHandlers():void
		{
			stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
		// 엔터프레임 이벤트마다 x축 좌표값을 3씩 증가시킨다.
		private function enterFrameHandler(event:Event):void
		{
            sp.x += 3;
            sp.y += 3;
        }			
	}
}
