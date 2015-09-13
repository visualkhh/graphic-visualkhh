package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	[SWF(backgroundColor=0xFFFFFF)]
	public class AsExam9_18 extends Sprite
	{
		// 비트맵 이미지 추가를 위한 Sprite 클래스
		private var sp:Sprite=new Sprite();
		// 이미지에 대한 비트맵 
		private var bitmapImage:Bitmap;
		// 복사한 비트맵데이터를 보여줄 비트맵
		private var bitmapImageCopy:Bitmap;
		// 원본이미지에서 복사한 비트맵 데이터
		private var bmdCopy:BitmapData;
		// 마우스 클릭에 따라 포인트 복사 & 사각영역 복사 기능이 토글된다.
		private var clickFlag:Boolean;
		
		public function AsExam9_18()
		{
			displayMain();
			addEventHandlers();
		}
		// 비트맵 이미지를 로드하고, 비트맵을 하나 더 생성한다. 
		private function displayMain():void
		{
			loadBitmapImage();
			createEmptyBitmap();
			sp.buttonMode = true;
			this.addChild(sp);
		}
		// 마우스 클릭, 마우스 무브 이벤트 핸들러 함수 추가 
		private function addEventHandlers():void
		{
			sp.addEventListener(MouseEvent.CLICK, clickHandler);
			sp.addEventListener(MouseEvent.MOUSE_MOVE, pixelMoveHandler);
		}
	    // 마우스를 클릭하면 비트맵 포인트와 영역 복사가 토글된다.
		private function clickHandler(event:MouseEvent):void
		{
			// 클릭플래그에 따라 마우스 무브 이벤트 핸들러를 바꿔준다.
			if(!clickFlag) 
			{
				sp.removeEventListener(MouseEvent.MOUSE_MOVE, pixelMoveHandler);
				sp.addEventListener(MouseEvent.MOUSE_MOVE, rectMoveHandler);
			}	
			else
			{
				sp.removeEventListener(MouseEvent.MOUSE_MOVE, rectMoveHandler);
				sp.addEventListener(MouseEvent.MOUSE_MOVE, pixelMoveHandler);
			}
			// 비트맵을 새로 생성한다.
			createEmptyBitmap();
			clickFlag = !clickFlag;	
		}
        // 픽셀단위로 이미지상의 마우스 위치에 있는 색상정보를 읽어와 우측의 비트맵에 업데이트 한다.
		private function pixelMoveHandler(event:MouseEvent):void
		{
			// 마우스가 위치한 지점의 픽셀 정보를 읽어 온다.
			var pixelValue:uint  = bitmapImage.bitmapData.getPixel(event.stageX, event.stageY);
			trace(pixelValue.toString(16));
			// bmdCopy에 픽셀값을 업데이트 한다.
			bmdCopy.setPixel(event.stageX, event.stageY, pixelValue);
		}
        // 사각영역 단위로 이미지상의 마우스 위치에 있는 영역의 색상정보를 읽어와 우측의 비트맵에 업데이트 한다.
		private function rectMoveHandler(event:MouseEvent):void
		{
			// 마우스가 위치한 곳의 사각영역이 비트맵 내부 영역이어야 복사가 되므로 
			// containsRect 함수를 이용하여 영역을 체크해야함 
			var recCheck:Rectangle = new Rectangle(0, 0, bitmapImage.width, bitmapImage.height);
			// 마우스가 위치한 곳의 사각영역 객체 생성
			var rec:Rectangle = new Rectangle(event.stageX, event.stageY, 10, 10);
			// 비트맵이미지 내부일 경우에 픽셀값 복사 수행
			if(recCheck.containsRect(rec))
			{
				// 사각영역의 색상정보를 바이트배열로 가져옴
				var ba:ByteArray = bitmapImage.bitmapData.getPixels(rec);
				// 복사할 비트맵에 동잃한 크기의 사각영역 객체 생성
				var recTarget:Rectangle = new Rectangle(event.stageX, event.stageY, 10, 10);
				// 바이트 배열의 복사 시작점을 0부터 설정해준다.
				ba.position = 0;
				// 비트맵 이미지에 복사한 색상정보들을 업데이트한다.
				bmdCopy.setPixels(recTarget, ba);
			}
		}
        // 로드한 이미지 옆에 새로운 비트맵을 생성하여 화면에 추가한다.
		private function createEmptyBitmap():void
		{
			bmdCopy= new BitmapData(240, 240, false, Math.random()*0x1000000);
			bitmapImageCopy= new Bitmap(bmdCopy);
			sp.addChild(bitmapImageCopy);	
			bitmapImageCopy.x = 240;
		}
		// png 파일을 로드하여 비트맵으로 화면에 추가한다.
		private function loadBitmapImage():void
		{
			var request:URLRequest = new URLRequest("assets/little-prince.png");
			var loader:Loader = new Loader();
            loader.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
			loader.load(request);
		}
		// 이미지 로드가 완료되면 화면에 추가한다.
        private function completeHandler(event:Event):void 
        {
            var loader:Loader = Loader(event.target.loader);
            bitmapImage = Bitmap(loader.content);
			sp.addChild(bitmapImage);
        }
	}
}