package
{
    import flash.display.Loader;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.MouseEvent;
    import flash.net.FileFilter;
    import flash.net.FileReference;
    import flash.utils.ByteArray;
    [SWF(width=800, height=600, backgroundColor = 0xffffff)]
    public class AsExam12_11 extends Sprite
    {
        private var fr:FileReference;
        private var loader:Loader;
        private static const FILE_TYPES:Array = [new FileFilter("Image File", "*.jpg;*.png;*.gif")];
        public function AsExam12_11()
        {
            displayMain();
            stage.addEventListener(MouseEvent.CLICK, clickHandler);
        }
        // 이미지를 보여주기 위한 로더 추가
        private function displayMain():void
        {
        	loader = new Loader();
            this.addChild(loader);
        }
        // 화면을 클릭하면 파일 선택창이 뜬다.        
        private function clickHandler(event:MouseEvent):void
        {
            displayFileSelector();
        }

        private function displayFileSelector():void
        {
            fr = new FileReference();
            fr.addEventListener(Event.SELECT, fileSelectHandler);
            fr.addEventListener(Event.CANCEL, fileCancelHandler);
            fr.browse(FILE_TYPES);
        }

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
        // 파일 로드가 완료되면 파일데이터를 Loader로 읽어들인다.
        private function completeHandler(e:Event):void
        {
           loader.loadBytes(fr.data);
           fr = null;
        }

        private function ioErrorHandler(e:IOErrorEvent):void
        {
            trace("Error loading file : " + e.text);
        }
    }
}