package
{
    import flash.display.Sprite;
    import flash.events.DataEvent;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.MouseEvent;
    import flash.events.ProgressEvent;
    import flash.net.FileReference;
    import flash.net.URLRequest;
    import flash.net.URLVariables;
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;
    import flash.text.TextFormat;    
    
    public class AsExam12_15 extends Sprite
    {
        private var fr:FileReference;
        private var btn:AsExam8_SimpleButton = new AsExam8_SimpleButton("FILE UPLOAD", 80);
        // 파일 업로드 진행현황
        private var loadProgressTF:TextField = new TextField();
        // 파일 업로드 데이터량 
        private var loadAmountTF:TextField = new TextField();        
        public function AsExam12_15()
        {
            displayMain();
            drawProgress();
            btn.addEventListener(MouseEvent.CLICK, clickHandler);  
        }
        // 파일 업로드 진행현황을 표시할 텍스트 필드 추가 
        private function displayMain():void
        {
            var text_format:TextFormat=new TextFormat("Arial", 20);
            loadAmountTF.autoSize=TextFieldAutoSize.LEFT;
            loadProgressTF.defaultTextFormat = text_format;
            loadAmountTF.defaultTextFormat = text_format;             
            this.addChild(loadProgressTF);
            this.addChild(loadAmountTF);
            loadProgressTF.x = 220;
            loadProgressTF.y = 110;
            loadAmountTF.x = 200;
            loadAmountTF.y = 155;
            this.addChild(btn);                     
            btn.x = 200;
            btn.y = 185;
        }
        
        private function clickHandler(event:MouseEvent):void
        {
            displayFileSelector();
        }

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
            // 프로그레스 이벤트 핸들러 추가
            fr.addEventListener(ProgressEvent.PROGRESS, progressEventHandler);
            // 서버 업로드
            var url:String = "http://localhost/file_upload.php";
            //var url:String = "http://localhost:8400/lcds/file_upload.jsp"; 
            var req:URLRequest = new URLRequest(url); 
            var param:URLVariables = new URLVariables();
            param.user = "okgosu";
            req.data = param;
            fr.upload(req, "fileform");
        }
        // 업로드 진행현황을 계산한다. 
        private function progressEventHandler(event:ProgressEvent):void
        {
            var loadedPct:Number = Math.round(1000 * (event.bytesLoaded / event.bytesTotal))/10; 
            drawProgress(event.bytesLoaded, event.bytesTotal);
        }        
        // 업로드 진행현황을 그려준다.
        private function drawProgress(cur:Number=0, total:Number=1):void
        {
            var cursor:Number = Math.round(1000 * (cur / total))/10; 
            var barWidth:Number = 300;
            var barHeight:Number = 50;
            this.graphics.clear();
            this.graphics.lineStyle(1, 0xFF0000);
            this.graphics.beginFill(0xFFFFFF);
            this.graphics.drawRoundRect(100, 100, barWidth, barHeight, 10, 10);          
            this.graphics.beginFill(0x0000FF);
            this.graphics.drawRoundRect(100, 100, barWidth*cursor/100, barHeight, 10, 10);
            loadProgressTF.text = '' + cursor + '%';
            if(cur > 0)
            {
            	// AsExam_UTIL의 getNumberFormat 함수 호출
                loadAmountTF.text = '' + AsExam_UTIL.getNumberFormat(cur) + ' / ' +  AsExam_UTIL.getNumberFormat(total) + ' 바이트';
            }
        }           
        
        private function uploadCompleteDataHandler(event:DataEvent):void
        {
            trace('업로드한 파일명:', event.target.name);
        }

        private function fileCancelHandler(e:Event):void
        {
            trace("업로드 취소");
            fr = null;
        }

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