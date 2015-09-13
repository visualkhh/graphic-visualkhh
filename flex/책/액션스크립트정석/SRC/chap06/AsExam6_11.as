package 
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.net.URLLoader;
    import flash.net.URLRequest;

    public class AsExam6_11 extends Sprite 
    {
        public function AsExam6_11() 
        {
            var loader:URLLoader = new URLLoader();
            // IOErrorEvent에 대한 이벤트 핸들러를 등록한다. 
            loader.addEventListener(IOErrorEvent.IO_ERROR, errorEventHandler);
            loader.addEventListener(Event.COMPLETE, completeEventHandler);
            // 존재하지 않는 파일을 로드하려고 하면 에러가 발생한다.
            var request:URLRequest = new URLRequest("http://okgosu.net/아무거나");
            loader.load(request);
        }
        // Complete 이벤트 핸들러
        private function completeEventHandler(event:Event):void 
        {
            trace("Load success!");
        }
		// ErrorEvent핸들러 
        private function errorEventHandler(event:IOErrorEvent):void 
        {
            trace("Error Event type: " + event.type);
            trace("Error Event message: " + event.text);
        }
    }
}