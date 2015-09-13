package
{
    import flash.display.Sprite;
    import flash.events.DataEvent;
    import flash.events.Event;
    import flash.events.SecurityErrorEvent;
    import flash.events.IOErrorEvent;
    import flash.events.MouseEvent;
    import flash.events.ProgressEvent;
    import flash.net.FileReference;
    import flash.net.URLRequest;
    import flash.net.URLVariables;
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;
    import flash.text.TextFormat;    
    
    public class AsExam12_16 extends Sprite
    {
        private var fr:FileReference;
        private var btn:AsExam8_SimpleButton = new AsExam8_SimpleButton("FILE DOWNLOAD", 100);
        private var loadProgressTF:TextField = new TextField();
        private var loadAmountTF:TextField = new TextField();        
        public function AsExam12_16()
        {
            displayMain();
            drawProgress();
            btn.addEventListener(MouseEvent.CLICK, clickHandler);
        }
        
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
            var downloadURL:URLRequest = new URLRequest();
            // 파일 다운로드 경로
            downloadURL.url = "http://okgosu.net/upload/okjaemin.jpg";
            fr = new FileReference();
            fr.addEventListener(Event.CANCEL, fileCancelHandler);
            fr.addEventListener(Event.COMPLETE, completeHandler);
            fr.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
            fr.addEventListener(Event.OPEN, openHandler);
            fr.addEventListener(ProgressEvent.PROGRESS, progressEventHandler);
            fr.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
            fr.addEventListener(Event.SELECT, fileSelectHandler);
            // 파일을 다운로드 받는다.
            fr.download(downloadURL);        	
        }

        private function openHandler(event:Event):void 
        {
            trace("openHandler: " + event);
        }

        private function securityErrorHandler(event:SecurityErrorEvent):void
        {
            trace("securityErrorHandler: " + event);
        }
        // 저장할 파일명 지정 
        private function fileSelectHandler(event:Event):void
        {
            var file:FileReference = FileReference(event.target);
            trace("selectHandler: name=" + file.name); 
        }
        
        private function progressEventHandler(event:ProgressEvent):void
        {
            var loadedPct:Number = Math.round(1000 * (event.bytesLoaded / event.bytesTotal))/10; 
            drawProgress(event.bytesLoaded, event.bytesTotal);
        }        
        
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
                loadAmountTF.text = '' + AsExam_UTIL.getNumberFormat(cur) + ' / ' +  AsExam_UTIL.getNumberFormat(total) + ' 바이트';
            }
        }           
        
        private function fileCancelHandler(e:Event):void
        {
            trace("선택 취소");
            fr = null;
        }

        private function completeHandler(e:Event):void
        {
            trace('download 끝!' + e);
            fr = null;
        }

        private function ioErrorHandler(e:IOErrorEvent):void
        {
            trace("Error : " + e.text);
        }
    }
}