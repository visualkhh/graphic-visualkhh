package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	[SWF(backgroundColor=0xFFFFFF)]
	public class AsExam9_16 extends Sprite
	{
		public function AsExam9_16()
		{
			loadBitmapImage();
			loadBitmapData();
			stage.addEventListener(MouseEvent.CLICK, clickHandler);
		}
		// Loader를 이용하여 이미지를 로드하여 화면에 추가한다.
		private function loadBitmapImage():void
		{
			var request:URLRequest = new URLRequest("assets/little-prince.png");
			var loader:Loader = new Loader();
			// 로드가 완료되면 completeHandler에서 화면에 추가
            loader.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
            loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			loader.load(request);
		}
		// 노란색의 비트맵데이터를 생성하여 화면에 추가한다. 
		private function loadBitmapData():void
		{
			var bmd:BitmapData = new BitmapData(240, 240, false, 0xFFFF00);
			var bm:Bitmap = new Bitmap(bmd);
			this.addChild(bm);	
		}
		// 화면을 클릭하면 비트맵을 하나씩 제거한다.
		private function clickHandler(event:MouseEvent):void
		{
			if(this.numChildren>0) this.removeChildAt(0);
		}
		// 외부 이미지 로드가 완료되면 화면에 추가한다. 
        private function completeHandler(event:Event):void 
        {
            var loader:Loader = Loader(event.target.loader);
            var image:Bitmap = Bitmap(loader.content);
			this.addChild(image);
        }
        // 로드할 이미지가 없을 경우 에러 처리
        private function ioErrorHandler(event:IOErrorEvent):void 
        {
            trace("Unable to load image: " + event.text);
        }
	}
}