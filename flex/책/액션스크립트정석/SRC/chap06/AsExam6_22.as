package 
{
	import flash.display.*;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.utils.Timer;
    
	[SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
	public class AsExam6_22 extends Sprite 
	{
		private var minuteTimer:Timer;
		private var msTimerTF:TextField;
		private var msCount:uint;
		private var flag:Boolean;

		public function AsExam6_22()
		{
			layoutMyTimer();
			// 1/100초에 한번씩 타이머 이벤트가 발생하며, 6000번 작동한다.
			minuteTimer = new Timer(10, 6000);
			// 타이머 이벤트마다 실행될 이벤트 핸들러를 지정함
            minuteTimer.addEventListener(TimerEvent.TIMER, timerPlay);
            // 타이머 이벤트가 종료될 때 실행될 이벤트 핸들러를 지정함 
            minuteTimer.addEventListener(TimerEvent.TIMER_COMPLETE, timesUpHandler);
            // 타이머 이벤트를 시작함 
            minuteTimer.start();		
		}
		
		private function layoutMyTimer():void 
		{
			// 화면에 텍스트 필드를 추가한다.
			msTimerTF = new TextField();
			msTimerTF.x = msTimerTF.y = 50;
			stage.addEventListener(MouseEvent.CLICK, cickHandler);	
			this.addChild(msTimerTF);	
		}
		
        public function timerPlay(event:TimerEvent):void 
        {
            msCount++;
           	msTimerTF.text = "" + msCount;
           	trace('msCount', msCount);
        }

        public function timesUpHandler(event:TimerEvent):void  
        {
            trace("Time's Up!");
        }		
		
		private function cickHandler(event:MouseEvent):void 
		{
			if(flag) {
				minuteTimer.start();
			} else {
				// 타이머 이벤트를 중지함 
				minuteTimer.stop();
			}
			flag = !flag;
		}
	}
}