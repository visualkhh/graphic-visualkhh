package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.net.URLRequest;
		
[SWF(backgroundColor=0xFFFFFF)]
	public class AsExam8_SliderApp extends Sprite
	{
		private var sp:Sprite = new Sprite();
		private var slider:AsExam8_Slider;
		private var image:Bitmap;
		private var bitmap:Bitmap;
		public function AsExam8_SliderApp()
		{
			loadBitmapURL();
			var fromC:uint = 0xFFFFFFFF;
			var toC:uint = 0xFF000000;
			slider = new AsExam8_Slider(400, fromC, toC);
			this.addChild(slider);
			slider.y = 350;
			slider.addEventListener("sliderChanged", changeDisp);
		}
		
		private function changeDisp(event:MouseEvent):void
		{
			var th:uint = slider.scrollAmount;
			trace('th: 0x' + th.toString(16));
			bitmap.bitmapData.threshold(image.bitmapData, image.bitmapData.rect, new Point(0, 0), ">=",  th, 0xFF00FF00, 0xFFFFFFFF, true);
		}
		
		private function loadBitmapURL():void
		{
			var request:URLRequest = new URLRequest("test.jpg");
			var loader:Loader = new Loader();
            loader.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
			loader.load(request);
		}
		
        private function completeHandler(event:Event):void {
            var loader:Loader = Loader(event.target.loader);
            image = Bitmap(loader.content);
			addChild(image);
			var bmd:BitmapData = new BitmapData(image.width, image.height, true, 0x00000000);
			bitmap =  new Bitmap(bmd);
			this.addChild(bitmap);			
        }		
	}
}