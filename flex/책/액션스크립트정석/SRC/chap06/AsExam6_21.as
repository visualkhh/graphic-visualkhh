package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	[SWF(width=800,height=800,backgroundColor=0xFFFFFF)]
	public class AsExam6_21 extends Sprite 
	{
		private var sp:AsExam6_19_SubTriangle;
		public function AsExam6_21() 
		{
			sp = new AsExam6_19_SubTriangle(Math.random() * 0x1000000);
			sp.y = this.stage.stageHeight-sp.height;
			this.addChild(sp);
			this.addEventListener(Event.ENTER_FRAME, moveTriangle);
		}
		// 엔터프레임 이벤트가 발생할 때 마다, 1초에 24번 호출된다. 
		private function moveTriangle(event:Event):void 
		{
			// sp의 좌표값이 10씩감소하므로 화면 위족으로 이동한다. 
			sp.y -= 10;			
		}
	}
}
