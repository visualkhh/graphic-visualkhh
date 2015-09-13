package 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BitmapDataChannel;
	import flash.display.Sprite;
	import flash.events.MouseEvent;	
	
	[SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
	public class AsExam7_8 extends Sprite 
	{
		private var bp:Bitmap;
		private var bitmapData:BitmapData
		public function AsExam7_8()	
		{
			displayMain();
			addEventHandlers();
		}
		// 비트맵데이터 객체를 생성하여 비트맵에 추가
		private function displayMain():void
		{
			bitmapData = new BitmapData(400, 400, false, 0x00FF0000);
			bp = new Bitmap(bitmapData);
			this.addChild(bp);				
			// 펄린 노이즈를 생성한다.
			noiseMaker(100, 100);
		}
		
		private function addEventHandlers():void
		{
			stage.addEventListener(MouseEvent.CLICK, clickHandler);
		}
		
        private function clickHandler(event:MouseEvent):void 
        {
		    noiseMaker(event.localX, event.localY);
        }		
        // 마우스를 클릭하는 위치에 따라 펄린 노이즈를 생성한다.
		private function noiseMaker(nX:Number, nY:Number):void 
		{
			var seed:Number = Math.floor(Math.random() * 1);
			var channels:uint = BitmapDataChannel.GREEN | BitmapDataChannel.BLUE | BitmapDataChannel.RED 
			bitmapData.perlinNoise(nX, nY, 6, seed, false, true, channels, false, null);
		}
	}
}