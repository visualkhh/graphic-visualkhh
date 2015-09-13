package
{
    import flash.display.Sprite;
    import flash.events.DataEvent;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.MouseEvent;
    import flash.net.FileReference;
    import flash.net.URLRequest;
    import flash.net.URLVariables;

    public class AsExam12_14 extends Sprite
    {
        private var fr:FileReference;
        private var btn:AsExam8_SimpleButton = new AsExam8_SimpleButton("FILE UPLOAD", 80);
        public function AsExam12_14()
        {
            displayMain();
            btn.addEventListener(MouseEvent.CLICK, clickHandler);  
        }
        
        private function displayMain():void
        {
            this.addChild(btn);                     
            btn.x = 200;
            btn.y = 160;
        }
        
        private function clickHandler(event:MouseEvent):void
        {
            displayFileSelector();
        }
        // 버튼을 클릭하면 업로드할 파일을 선택한다. 
        private function displayFileSelector():void
        {
            fr = new FileReference();
            fr.addEventListener(Event.SELECT, fileSelectHandler);
            fr.addEventListener(Event.CANCEL, fileCancelHandler);
            fr.browse();
        }

        private function fileSelectHandler(e:Event):void
        {
            fr.addEventListener(Event.COMPLETE, completeHandler);
            fr.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
            fr.addEventListener(DataEvent.UPLOAD_COMPLETE_DATA, uploadCompleteDataHandler);
            
            // 서버 업로드
            var url:String = "http://localhost/file_upload.php";
            //var url:String = "http://localhost:8400/lcds/file_upload.jsp";
            var req:URLRequest = new URLRequest(url); 
            var param:URLVariables = new URLVariables();
            param.user = "okgosu";
            req.data = param;
            fr.upload(req, "fileform");
        }
        // 업로드한 파일명을 받아오는 함수
        private function uploadCompleteDataHandler(event:DataEvent):void
        {
        	trace('업로드한 파일명:', event.target.name);
        }

        private function fileCancelHandler(e:Event):void
        {
            trace("업로드 취소");
            fr = null;
        }
        // 업로드가 완료되면 실행되는 함수
        private function completeHandler(e:Event):void
        {
            trace('upload 끝!' + e);
            fr = null;
        }

        private function ioErrorHandler(e:IOErrorEvent):void
        {
            trace("Error : " + e.text);
        }
    }
} 