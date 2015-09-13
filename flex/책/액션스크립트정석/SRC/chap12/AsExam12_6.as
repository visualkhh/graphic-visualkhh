package
{
    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.ActivityEvent;
    import flash.events.MouseEvent;
    import flash.events.StatusEvent;
    import flash.events.TimerEvent;
    import flash.filters.BlurFilter;
    import flash.media.Camera;
    import flash.media.Video;
    import flash.system.Security;
    import flash.system.SecurityPanel;
    import flash.utils.Timer;    

    public class AsExam12_6 extends Sprite
    {
        private var cam:Camera; 
        private var video:Video = new Video(); 
        // 웹캠 움직임이 발생하면 타이머를 작동하여 블러 효과를 적용함 
        private var t:Timer = new Timer(1000);
        
        public function AsExam12_6()
        {
            displayMain();
            useCam();
            addEventHandlers();          
        }
        
        private function displayMain():void
        {
            stage.align = StageAlign.TOP;
            stage.scaleMode = StageScaleMode.NO_SCALE;
            this.addChild(video); 
        }
        
        private function useCam():void
        {
            cam = Camera.getCamera(); 
            if (cam != null) 
            { 
                cam.setQuality(0, 1);
                cam.setMode(640, 480, 15);
                video.attachCamera(cam);
                video.width = cam.width; 
                video.height = cam.height;          
            }
            else 
            {
                trace('설치된 웹캠이 없습니다.');
            }
        }
                
        private function addEventHandlers():void
        {
            stage.addEventListener(MouseEvent.CLICK, clickHandler);
            // 타이머 이벤트 핸들러 추가
            t.addEventListener(TimerEvent.TIMER, timerHandler);
            cam.addEventListener(StatusEvent.STATUS, statusHandler);
            // 웹캠 액티비티 핸들러 추가 
            cam.addEventListener(ActivityEvent.ACTIVITY, activityHandler);   
        }
                
        private function clickHandler(event:MouseEvent):void
        {
            Security.showSettings(SecurityPanel.PRIVACY);
        }
        
        private function statusHandler(event:StatusEvent):void 
        { 
            if (cam.muted) 
            { 
                trace("Webcam connection fail"); 
            } 
            else 
            {
                trace("Webcam connection success");
            } 
        }
        // 웹캠에서 움직임을 포착하면 타이머 이벤트 시작
        private function activityHandler(event:ActivityEvent):void 
        {
            if (event.activating == true) 
            {
                t.start();    
            } else {
                trace("움직임 없음");
                video.filters = null;
                t.stop();
            }    
        }
        // cam.activityLevel값 만큼 화면을 흐리게한다. 
        private function timerHandler(event:TimerEvent):void 
        {
             trace("cam.activityLevel: " + cam.activityLevel);
             video.filters = [new BlurFilter(cam.activityLevel, cam.activityLevel)];
             
        }               
    }
}