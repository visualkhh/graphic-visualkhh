package 
{
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
    [SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
	public class AsExam10_3 extends Sprite
	{
		// 공을 하나 추가한다.
		private var sp:Sprite = new Sprite();
		public function AsExam10_3()
		{
			displayMain();
			addEventHandlers();
		}
		// 공을 화면 중앙에 추가한다.
		private function displayMain():void
		{
			sp.graphics.beginFill(Math.random()*0x100000);
			sp.graphics.drawCircle(0, 0, 20);
			this.addChild(sp);
		}
		// 키보드 이벤트 핸들러 함수를 추가한다.
		private function addEventHandlers():void
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
		}
		// 키를 누르면 그 방향으로 좌표를 5씩 증가시킨다.
		private function keyDownHandler(event:KeyboardEvent):void
		{
            switch(event.keyCode) 
            {
                case 37: //좌 
                    sp.x -=5;
                    break;
                case 38: //상
                    sp.y -=5;
                    break;
                case 39: //우
                    sp.x +=5;
                    break;
                case 40: //하 
                    sp.y +=5;
                    break;
            }
        }			
	}
}
