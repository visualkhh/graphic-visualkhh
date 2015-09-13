package 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;    
	[SWF(backgroundColor=0xFFFFFF)]
	public class AsExam9_3 extends Sprite	
	{
		// sq1_rect를 그려주기 위한 Sprite
		private var square1:Sprite = new Sprite();
		// sq2_rect를 그려주기 위한 Sprite
		private var square2:Sprite = new Sprite();
		// sq1_rect와 sq2_rect가 겹치는 영역을 표시하기 위한 Sprite
		private var squareX:Sprite = new Sprite();
		private var sq1_rect:Rectangle;
		private var sq2_rect:Rectangle;
		
		public function AsExam9_3()
		{
			displayMain();
			addEventHandlers();
		}
		// square1과 square2를 화면에 그리고 동일한 크기의 Rectangle객체를 생성한다.
		private function displayMain():void
		{
			square1.graphics.beginFill(0xFFCC00);
			square1.graphics.drawRect(0, 0, 80, 80);
			square2.graphics.beginFill(0xCCFF00);
			square2.graphics.drawRect(0, 0, 80, 80);
			square2.buttonMode = true;
			square2.x = 100;
			sq1_rect = new Rectangle(0, 0, 80, 80);
			sq2_rect = new Rectangle(0, 0, 80, 80);
			addChild(square2);
			addChild(square1);
			addChild(squareX);
		}
		// square2를 드래그앤드랍할 수 있도록 이벤트 핸들러 함수를 등록함
		private function addEventHandlers():void
		{
			square2.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler) 
			square2.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);		
		}
		// square2를 마우스로 누르면 드래그를 시작한다.
		private function mouseDownHandler(event:MouseEvent):void 
		{
		    square2.startDrag();
		    square2.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
		}
        // square2를 마우스를 놓으면 드래그를 멈춘다.
        private function mouseUpHandler(event:MouseEvent):void 
        {
        	square2.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
		    square2.stopDrag();
        }		
		// square2를 드래그하는 동안 두 사각형이 겹치는 Rectangle를 표시한다.
        private function mouseMoveHandler(event:MouseEvent):void
        {		
		    sq2_rect.x = square2.x;
		    sq2_rect.y = square2.y;
			squareX.graphics.clear();
			// sq1_rect와 sq2_rect간의 교집합에 해당하는 Rectangle을 구해 squareX를 통해 화면에 표시한다.
			if(sq1_rect.intersects(sq2_rect)) 
			{
				var rect_inter:Rectangle = sq2_rect.intersection(sq1_rect);
				squareX.graphics.lineStyle(2, 0xFF0000);
				squareX.graphics.beginFill(0x0000FF);
				squareX.graphics.drawRect(rect_inter.x, rect_inter.y, rect_inter.width, rect_inter.height);
			}
		}			
	}
}