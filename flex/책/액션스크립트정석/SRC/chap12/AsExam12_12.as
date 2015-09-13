package
{
	import flash.display.Sprite;
    import flash.text.TextField;
    import flash.events.MouseEvent;
    import flash.net.FileReference;
    import flash.events.IOErrorEvent;    
    import flash.events.Event;
    
	public class AsExam12_12 extends Sprite
	{
		private var tfContents:TextField = new TextField();
        private static const DEFAULT_FILE_NAME:String = "okgosu.txt";
        private var fr:FileReference;		
        private var btn:AsExam8_SimpleButton = new AsExam8_SimpleButton("SAVE", 40);

		public function AsExam12_12()
		{
			displayMain();
			addEventHandlers();
		}
		// 텍스트필드와 버튼을 추가한다.
        private function displayMain():void
        {
            this.addChild(tfContents);
            tfContents.background = true;
            tfContents.border = true;
            tfContents.type = 'input';
            tfContents.width = 400;
            tfContents.height = 300;            

            btn.x = 180;
            btn.y = 310;
            this.addChild(btn);            
        }

        private function addEventHandlers():void
        {
            btn.addEventListener(MouseEvent.CLICK, clickHandler);  
        }
        // 버튼을 클릭하면 텍스트필드의 내용을 파일로 저장한다.
        private function clickHandler(event:MouseEvent):void
        {
        	saveFile();
        }        		
        // 파일을 저장
        private function saveFile():void
        {
            fr = new FileReference();
            fr.addEventListener(Event.COMPLETE, completeHandler);
            fr.addEventListener(Event.CANCEL,cancelHandler);
            fr.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
            // 텍스트필드의 내용을 DEFAULT_FILE_NAME으로 저장한다.
            fr.save(tfContents.text, DEFAULT_FILE_NAME);
        }       
        // 저장 완료시 실행됨
        private function completeHandler(e:Event):void
        {
            trace("File Saved");
            fr = null;
        }

        private function cancelHandler(e:Event):void
        {
            trace("File save select canceled.");
            fr = null;
        }

        private function ioErrorHandler(e:IOErrorEvent):void
        {
            trace("Error Saving File : " + e.text);
            fr = null;
        }         
	}
}