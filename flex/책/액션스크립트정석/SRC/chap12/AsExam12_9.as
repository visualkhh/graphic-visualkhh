package
{
    import flash.display.Sprite;
    import flash.events.ActivityEvent;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.events.StatusEvent;
    import flash.media.Microphone;
    import flash.system.Security;
    import flash.system.SecurityPanel;
    [SWF(width=800, height=600, backgroundColor = 0xffffff)] 
    public class AsExam12_9 extends Sprite
    {
        private var mic:Microphone;
        private var sp:Sprite = new Sprite();
        private var speed:Number = 0;
        public function AsExam12_9()
        {
            useMicrophone();
            addEventHandlers();
        	displayMain();
        }
        // sp를 화면에 추가하고 drawWings를 호출
        private function displayMain():void
        {
            this.addChild(sp);
            sp.x = stage.stageWidth/2;
            sp.y = stage.stageHeight/2;
            drawWings();
        }
        // 회전중심이 (0,0)이 되도록 바람개비 날개를 그린다.
        private function drawWings():void
        {
        	var wingWidth:Number = 50;
        	var wingHeight:Number = 200;
        	sp.graphics.lineStyle(2, 0xFF0000);
        	sp.graphics.moveTo(-wingWidth,-wingHeight);
        	sp.graphics.lineTo(wingWidth, wingHeight);
        	sp.graphics.lineTo(-wingWidth, wingHeight);
        	sp.graphics.lineTo(wingWidth, -wingHeight);
        	sp.graphics.lineTo(-wingWidth,-wingHeight);
        }
        
        private function addEventHandlers():void
        {
            stage.addEventListener(MouseEvent.CLICK, clickHandler);
            mic.addEventListener(StatusEvent.STATUS, statusHandler); 
            mic.addEventListener(ActivityEvent.ACTIVITY, activityHandler); 
        }
        
        private function useMicrophone():void
        {
            mic = Microphone.getMicrophone();
            if (mic != null) 
            { 
	            mic.setLoopBack(true);                
	            mic.setUseEchoSuppression(true); 
            }
            else 
            {
                trace('설치된 마이크가 없습니다.');
            }
        }
        
        private function clickHandler(event:MouseEvent):void
        {
            Security.showSettings(SecurityPanel.PRIVACY);
        }
        
        private function statusHandler(event:StatusEvent):void 
        { 
            if (mic.muted) 
            { 
                trace("마이크에 연결할 수 없습니다."); 
            } 
            else 
            {
                trace("마이크 연결 성공");
                stage.removeEventListener(MouseEvent.CLICK, clickHandler);           
                mic.removeEventListener(StatusEvent.STATUS, statusHandler);  
            } 
        }
        // 마이크 소리의 유무에 따라 엔터프레임 핸들러 함수를 추가한다.
		private function activityHandler(event:ActivityEvent):void 
		{ 
		    trace("activating=" + event.activating + ", activityLevel=" +  mic.activityLevel); 
            if (event.activating) 
            {
                stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);   
            } else {
                trace("소리 없음");
                speed = 0;
                stage.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
            }    		        
		} 
        // 마이크 소리 강도에 따라 회전속도를 증가시킨다. 
        private function enterFrameHandler(event:Event):void 
        {
        	trace("activityLevel=" +  mic.activityLevel); 
            speed = mic.activityLevel;
            sp.rotation += speed;
        }   
    }
}