package 
{
	import flash.display.*;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	[SWF(width=800,height=600,backgroundColor=0x000000)]
	public class AsExam8_8 extends Sprite 
	{
		private var spaceShip:AsExam8_8_SpaceShip = new AsExam8_8_SpaceShip();
		public function AsExam8_8()
		{
		    displayMain();
		    addEventHandlers();
		}
        // 화면에 spaceShip 추가후 좌표 설정		
		private function displayMain():void
		{
			this.addChild(spaceShip);
			spaceShip.x = spaceShip.y = 200;
		}
		// 마우스 클릭, 키다운 이벤트 핸들러 등록
		private function addEventHandlers():void
		{
			stage.addEventListener(MouseEvent.CLICK, clickHandler);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyboardHandler);	
		}
		// 키보드 이벤트가 작동하려면 화면을 클릭하였을 때 포커스를 주어야 함
		private function clickHandler(event:MouseEvent):void 
		{
            stage.focus = this;
        }
		// 상하좌우 키를 눌렀을 때 spaceShip을 그 방향으로 회전시키고 움직임 
		private function keyboardHandler(evt:KeyboardEvent):void 
		{
			// 키를 눌렀을 때 이동할 양 (값을 늘리면 속도가 증가함)
			var v:Number = 10;
			switch(evt.keyCode) 
			{
				case 37: //좌 
					spaceShip.rotation = 270;
					spaceShip.x -=v;
					break;
				case 38: //상
					spaceShip.rotation = 0;
					spaceShip.y -=v;
					break;
				case 39: //우
					spaceShip.rotation = 90;
					spaceShip.x +=v;
					break;
				case 40: //하 
					spaceShip.rotation = 180;
					spaceShip.y +=v;
					break;
			}
		}
	}
}
