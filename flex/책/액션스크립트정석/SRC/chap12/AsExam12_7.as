package
{
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.MouseEvent;
    import flash.geom.Matrix;
    import flash.geom.Rectangle;
    import flash.net.FileReference;
    import flash.utils.ByteArray;
    import flash.system.Security;
    import flash.system.SecurityPanel;
    import flash.media.Camera;
    import flash.media.Video;
    import mx.graphics.codec.JPEGEncoder;
    
    public class AsExam12_7 extends Sprite
    {
        // 저장할 파일이름 
        private static const DEFAULT_FILE_NAME:String = "okgosu-asbook-capture.jpg";
        // 저장 버튼
        private var btn:AsExam8_SimpleButton = new AsExam8_SimpleButton("SAVE", 40);
        private var video:Video = new Video(); 

        public function AsExam12_7()
        {
            displayMain();
            useCam();
            btn.addEventListener(MouseEvent.CLICK, clickHandler);
            Security.showSettings(SecurityPanel.PRIVACY);    
        }
        // 버튼과 비디오를 화면에 추가
        private function displayMain():void
        {
            btn.x = 150;
            btn.y = 250;
            this.addChild(btn);     
            stage.align = StageAlign.TOP;
            stage.scaleMode = StageScaleMode.NO_SCALE;
            this.addChild(video);         
        }
        // 웹캠에 연결
        private function useCam():void
        {
            var cam:Camera = Camera.getCamera(); 
            if (cam != null) 
            { 
                cam.setQuality(0, 1);
                cam.setMode(320, 240, 15);
                video.attachCamera(cam);
                video.width = cam.width; 
                video.height = cam.height;          
            }
            else 
            {
                trace('설치된 웹캠이 없습니다.');
            }
        }        

        // 버튼을 클릭하면 웹캠 이미지를 파일로 저장
        private function clickHandler(event:MouseEvent):void
        {
            // 웹캠 영역만큼 비트맵 데이터 생성
            var bitmapData:BitmapData = new BitmapData(320, 240, true, 0xFFFFFF);
            // 비트맵 데이터의 사각영역 설정
            var drawingRectangle:Rectangle =  new Rectangle(0, 0, 320, 240);
            // 비트맵 데이터 그리기
            bitmapData.draw(this, new Matrix(), null, null, drawingRectangle, false);
            // 비트맵 데이터를 바이트 배열로 변환
            var byteArray:ByteArray = new JPEGEncoder().encode(bitmapData);
            var fr:FileReference = new FileReference();
            // 바이트 배열을 파일로 저장
            fr.save(byteArray, DEFAULT_FILE_NAME);
        }       
    }
}