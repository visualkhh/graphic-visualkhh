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
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
		
    [SWF(backgroundColor=0xFFFFFF)]
	public class AsExam9_31 extends Sprite
	{
		// threshold 값을 조절하기 위한 슬라이더 컨트롤
		private var slider:AsExam8_Slider = new AsExam8_Slider(450, 0xFFFFFFFF, 0xFF000000);
		// 이미지를 로드하여 보여주기 위한 비트맵
		private var bitmapImg:Bitmap;
		// threshold를 적용하기 위한 비트맵
		private var bitmapTsh:Bitmap;
		public function AsExam9_31()
		{
			displayMain();
			addEventHandlers();
		}
		// 비트맵 이미지를 로드하고 화면에 슬라이더를 추가한다.
		private function displayMain():void
		{
			// 이미지가 확대되지 않도록 하여 제일 위쪽으로 정렬시킨다.
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP;
			// 비트맵 이미지 로드
			loadBitmapImage();
			this.addChild(slider);
			slider.y = 400;
		}
		// 슬라이더의 값이 바뀔 때 마다 sliderChangedHandler 함수가 실행되도록 한다.
		private function addEventHandlers():void
		{
			slider.addEventListener("sliderChanged", sliderChangedHandler);
		}
		// 슬라이더의 값이 바뀌면 비트맵 데이터의 threshold 함수를 다시 호출하여 이펙트를 발생시킨다.
		private function sliderChangedHandler(event:MouseEvent):void
		{
			var th:uint = slider.scrollAmount;
			trace('th: 0x' + th.toString(16));
			bitmapTsh.bitmapData.threshold(bitmapImg.bitmapData, bitmapImg.bitmapData.rect, new Point(0, 0), ">=",  th, 0xFF00FF00, 0xFFFFFFFF, true);
		}
		// 비트맵 이미지를 로드한다.
		private function loadBitmapImage():void
		{
			var request:URLRequest = new URLRequest("assets/jaemin-at-park.jpg");
			var loader:Loader = new Loader();
            loader.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
			loader.load(request);
		}
		// 비트맵 이미지 로드가 완료되면 화면에 추가하고, threshold를 적용할 투명한 비트맵을 하나더 추가한다. 
        private function completeHandler(event:Event):void 
        {
            var loader:Loader = Loader(event.target.loader);
            bitmapImg = Bitmap(loader.content);
			this.addChild(bitmapImg);
			// threshold를 적용할 비트맵은 bitmapImg 보다 뒤에 추가해야 화면 위에 나타날 수 있다.
			var bmd:BitmapData = new BitmapData(bitmapImg.width, bitmapImg.height, true, 0x00000000);
			bitmapTsh =  new Bitmap(bmd);
			this.addChild(bitmapTsh);			
        }		
	}
}