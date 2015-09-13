package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	[SWF(backgroundColor=0xFFFFFF)]
	public class AsExam9_17 extends Sprite
	{
		public function AsExam9_17()
		{ 
			// 이미지를 로드한다.
			var request:URLRequest = new URLRequest("assets/candy.png");
			var loader:Loader = new Loader();
			// 이미지 로드가 완료되었을 때 화면에 추가하도록 한다.
            loader.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
            loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			loader.load(request);
		}
        private function completeHandler(event:Event):void 
        {
            var loader:Loader = Loader(event.target.loader);
            // 로드한 이미지를 비트맵에 추가한다.
            var image:Bitmap = Bitmap(loader.content);
			addChild(image);
            
            // image의 비트맵데이터를 복사해서 비트맵을 하나 더 만든다.			
			var image2:Bitmap = new Bitmap(image.bitmapData.clone());
            // smoothing을 true로 설정한다.
            image2.smoothing = true;
			addChild(image2);
			image2.x = 50;
        }
        
        private function ioErrorHandler(event:IOErrorEvent):void 
        {
            trace("Unable to load image: " + event.text);
        }
	}
}