package 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	public class AsExam7_13 extends Sprite	
	{
		private var circle:Sprite = new Sprite();
		private var square:Sprite = new Sprite();

		public function AsExam7_13()
		{
			displayMain();
			addEventHandlers();
		}
		
		private function displayMain():void
		{
			// circle 화면에 원을 그린다.
			circle.graphics.beginFill(0xFFCC00);
			circle.graphics.drawCircle(40, 40, 40);
			// square 화면에 사각형을 그린다.
			square.graphics.beginFill(0xCCFF00);
			square.graphics.drawRect(0, 0, 80, 80);
			square.buttonMode = true;
			// square의 hitArea는 circle로 설정하고
			square.hitArea = circle;
			// circle을 hitArea로 작동하도록 하기 위해 circle의 마우스는 비활성화함
			circle.mouseEnabled = false;
			square.x = square.y = circle.x = circle.y = 50;
			addChild(square);
			addChild(circle);
		}
		
		private function addEventHandlers():void
		{
			square.addEventListener(MouseEvent.CLICK, clickHandler);
		}
		
		private function clickHandler(event:MouseEvent):void
		{
			// 마우스를 클릭하면 hitArea를 square로 변경한다.
		    square.hitArea = square;
		    square.removeEventListener(MouseEvent.CLICK, clickHandler);
			// 드래그앤 드랍이 가능하도록 이벤트 핸들러 함수를 추가함
			square.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown); 
			square.addEventListener(MouseEvent.MOUSE_UP, mouseReleased);			
		}		
		
		private function mouseDown(event:MouseEvent):void 
		{
		    square.startDrag();
		}
		// 드래그앤 드랍이 끝나면 실행되는 함수
		private function mouseReleased(event:MouseEvent):void 
		{
		    square.stopDrag();
		    // 드랍한 곳이 circle이면 square 좌표를 circle에 맞추고 드래그앤드랍 이벤트핸들러를 제거함 
		    if(square.dropTarget == circle) 
		    {
		    	square.x = circle.x;
		    	square.y = circle.y;
				square.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDown) 
				square.removeEventListener(MouseEvent.MOUSE_UP, mouseReleased);
		    } 
		    else 
		    {
		        trace('wrong drop target!');
		    }
		}			
	}
}