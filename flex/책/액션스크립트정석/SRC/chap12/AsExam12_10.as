package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.net.FileFilter;
	import flash.net.FileReference;
	import flash.text.TextField;
	import flash.utils.ByteArray;

	public class AsExam12_10 extends Sprite
	{
        private var fr:FileReference;
        // 로드한 텍스트파일을 보여줄 텍스트필드
        private var tfContents:TextField = new TextField();
        // 로드할 파일 타입
        private static const FILE_TYPES:Array = [new FileFilter("Text, AS File", "*.txt;*.text;*.as")];
        private var btn:AsExam8_SimpleButton = new AsExam8_SimpleButton("OPEN", 40);
        public function AsExam12_10()
        {
            displayMain();
            btn.addEventListener(MouseEvent.CLICK, clickHandler);  
        }
        // 텍스트필드와 버튼을 화면에 추가
        private function displayMain():void
        {
        	this.addChild(tfContents);
        	tfContents.background = true;
            tfContents.border = true;
            tfContents.width = 400;
            tfContents.height = 300;         
            btn.x = 180;
            btn.y = 310;
            this.addChild(btn);                     
        }
        
        private function clickHandler(event:MouseEvent):void
        {
        	displayFileSelector();
        }
        // 버튼을 클릭하면 파일 선택 대화창을 보여줌
        private function displayFileSelector():void
        {
            fr = new FileReference();
            fr.addEventListener(Event.SELECT, fileSelectHandler);
            fr.addEventListener(Event.CANCEL, fileCancelHandler);
            fr.browse(FILE_TYPES);
        }
        // 파일을 선택하면 파일을 로드함
        private function fileSelectHandler(e:Event):void
        {
            fr.addEventListener(Event.COMPLETE, completeHandler);
            fr.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
            fr.load();
        }

        private function fileCancelHandler(e:Event):void
        {
            trace("File Browse Canceled");
            fr = null;
        }
        // 파일 로드가 완료되면 UTF로 파일을 읽어들여 텍스트에 추가한다.
        private function completeHandler(e:Event):void
        {
            var data:ByteArray = fr.data;
            tfContents.text = data.readUTFBytes(data.bytesAvailable);
            fr = null;
        }

        private function ioErrorHandler(e:IOErrorEvent):void
        {
            trace("Error loading file : " + e.text);
        }
	}
}