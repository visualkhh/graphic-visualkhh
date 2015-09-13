package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
    [SWF(backgroundColor=0xFFFFFF)]
	public class AsExam9_20 extends Sprite
	{
		// 히트테스트 목표물이 되는 비트맵
		private var targetBitmap:Bitmap;
		// 히트테스트를 위해 목표물로 발사되는 총알을 나타내는 비트맵 
		private var bulletBitmap:Bitmap;
		// 탱크모양을 그려주는 Sprite 
		private var tankSp:Sprite=new Sprite();
		
		public function AsExam9_20()
		{
			displayMain();
			addEventHandlers();
		}
		// 탱크, 목표물, 총알을 그린다.
		private function displayMain():void
		{
            drawTank();
            drawTarget();
            drawBullet();
		}
		// drawRect함수를 이용하여 사각형을 그린다음 화면 하단에 추가한다.
		private function drawTank():void
		{
			tankSp.graphics.lineStyle(1, 0x0000FF);
			tankSp.graphics.beginFill(Math.random()*0x1000000);
			tankSp.graphics.drawRect(20, 0, 10, 20);
			tankSp.graphics.drawRect(0, 20, 50, 30);
			this.addChild(tankSp);
            tankSp.x = this.stage.stageWidth/2;
            tankSp.y = this.stage.stageHeight-50;			
		}
		// 목표물: 50*50의 빨간색 사각형을 화면에 그린다. 
		private function drawTarget():void
		{
			var bd:BitmapData = new BitmapData(50, 50, true, 0xFFFF0000);
			targetBitmap = new Bitmap(bd);
			targetBitmap.x = 100;
			targetBitmap.y = 100;
			addChild(targetBitmap);
		}
        // 총알: 10*10의 노란색 사각형을 화면에 추가하나 visible은 false로 한다.
        private function drawBullet():void
        {
            var bd:BitmapData= new BitmapData(10, 10, true, 0xFFFFFF00);
            bulletBitmap = new Bitmap(bd);
            addChild(bulletBitmap);
            bulletBitmap.visible = false;        	
        }
        // 키보드 이벤트 핸들러 함수를 추가한다.
        private function addEventHandlers():void
        {
            stage.addEventListener(KeyboardEvent.KEY_DOWN,  keyboardHandler);           
        }
        // 스페이스바 또는 위쪽 화살표 키가 눌러지면 총알을 위쪽으로 움직인다.		
		private function shoot(posX:Number, posY:Number):void
		{
			bulletBitmap.x = posX;
			bulletBitmap.y = posY;
			bulletBitmap.visible = true;
			// 엔터프레임 이벤트 핸들러를 등록하여 계속 총알이 위쪽으로 움직이도록 한다.
			stage.addEventListener(Event.ENTER_FRAME, moveBullet);			
		}
		// 총알을 위쪽으로 움직이도록 그려주는 엔터프레임 이벤트 핸들러 함수
		private function moveBullet(event:Event):void
		{
			// 총알을 10씩 위족으로 움직인다.
			bulletBitmap.y -=10;
			// 총알이 화면의 최상단에 도달하면 엔터프레임 이벤트 핸들러를 제거한다.
			if(bulletBitmap.y < -10) stage.removeEventListener(Event.ENTER_FRAME, moveBullet);
            // 목표물 비트맵데이터와 총알의 비트맵 데이터간에 히트테스트를 수행한다.			
			if(targetBitmap.bitmapData.hitTest(new Point(targetBitmap.x, targetBitmap.y), 255, bulletBitmap.bitmapData, 
			   new Point(bulletBitmap.x, bulletBitmap.y), 255))
			{
				// 히트가 되고 있으면 목표물의 비트맵 색상을 랜덤으로 변경한다.
				targetBitmap.bitmapData =  new BitmapData(50, 50, false, Math.random()*0x1000000);
			}
		}
		// 키보드를 누를 때 이벤트 처리,
		private function keyboardHandler(evt:KeyboardEvent):void 
		{
			var v:Number = 10;
			switch(evt.keyCode) 
			{
				// 상, 스페이스바를 누르면 총알을 쏜다. (shoot함수 호출)
				case 32: // 상
				case 38: // 스페이스바
					shoot(tankSp.x+20, tankSp.y);
					break;
				case 37: // 좌 
					tankSp.x -=v;
					break;
				case 39: // 우
					tankSp.x +=v;
					break;
				case 40: // 하 
					break;
			}					
		}		
	}
}