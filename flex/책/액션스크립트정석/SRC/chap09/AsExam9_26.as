package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
    [SWF(backgroundColor=0xFFFFFF)]
	public class AsExam9_26 extends Sprite
	{
		// 비트맵 스크롤을 위한 비트맵
		private var bm:Bitmap;
		// 비트맵 스크롤 방향
		private var posX:int;
		private var posY:int;
		// 비트맵의 크기
		private var size:Number = 400
		public function AsExam9_26()
		{
			displayMain();
			addEventHandlers();
		}
		// size*size의 비트맵을 생성하고, 펄린 노이즈를 발생시킨 다음 화면에 추가한다.
		private function displayMain():void
		{
			var bmd:BitmapData = new BitmapData(size, size, false, 0xFFFFFF);
			bmd.perlinNoise(100, 80, 6, 10, false, true, 7, false, null);
			bm = new Bitmap(bmd);
			this.addChild(bm);
		}
		// 마우스 클릭, 엔터프레임 이벤트 핸들러를 추가한다.
		private function addEventHandlers():void
		{
			stage.addEventListener(MouseEvent.CLICK, clickHandler);
			stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
		// 마우스를 클릭하는 방향으로 비트맵 스크롤 값을 변화시킨다.
		private function clickHandler(event:MouseEvent):void
		{
			// 왼쪽이면 + 
			if(event.stageX > size/2) 
			{
				posX = 1;
			}
			else // 오른쪽이면 -
			{
				posX = -1;
			}
			// 아래쪽이면 + 
			if(event.stageY > size/2)
			{
				posY = 1;
			}
			else // 위쪽이면 - 
			{
				posY = -1;	
			}
		}
		// posX, posY만큼 계속 움직인다.
		private function enterFrameHandler(event:Event):void
		{
			bm.bitmapData.scroll(posX, posY);
		}
	}
}