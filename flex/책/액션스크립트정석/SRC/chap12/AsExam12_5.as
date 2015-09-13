package
{
    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.StatusEvent;
    import flash.events.MouseEvent;
    import flash.media.Camera;
    import flash.media.Video;
    import flash.system.Security;
    import flash.system.SecurityPanel;

    public class AsExam12_5 extends Sprite
    {
        private var video:Video = new Video(); 
        private var cam:Camera; 
        
        public function AsExam12_5()
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
        // 웹캠에 연결
        private function useCam():void
        {
            cam = Camera.getCamera(); 
            if (cam != null) 
            { 
            	// bandwidth, quality
	            cam.setQuality(0, 1);
	            // width, heigth, 프레임레이트 설정 
	            cam.setMode(640, 480, 15);
                video.attachCamera(cam);
                video.width = cam.width; 
                video.height = cam.height;                 
            }
            else 
            {
                trace('No installed webcam');
            }
        }
        
        private function addEventHandlers():void
        {
            stage.addEventListener(MouseEvent.CLICK, clickHandler);
            cam.addEventListener(StatusEvent.STATUS, statusHandler); 
        }
        // 화면을 클릭하면 플래시플레이어 보안 설정
        private function clickHandler(event:MouseEvent):void
        {
            Security.showSettings(SecurityPanel.PRIVACY);
        }
        // 웹캠 연결 상태 이벤트 체크        
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
    }
}