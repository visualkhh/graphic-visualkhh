package
{
	import flash.events.MouseEvent;
	// MyBall을 확장하여 드래그가 가능하도록 함
	public class MyDraggableBall extends MyBall
	{
		public var isDragging:Boolean;
		public function MyDraggableBall(r:Number=20, color:uint=0x1BE955, draggable:Boolean=true)
		{
			super(r, color, false);
			// 드래그가 가능하도록 이벤트핸들러 함수를 추가함
			if(draggable) 
			{
	            this.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
	            this.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
	            this.addEventListener(MouseEvent.MOUSE_OUT, mouseUpHandler);
	        }			
		}
        // 마우스를 누르면 드래그 시작
        private function mouseDownHandler(event:MouseEvent):void
        {
        	isDragging = true;
            event.target.startDrag();
        }
        // 마우스를 놓으면 드래그 종료 
        private function mouseUpHandler(event:MouseEvent):void
        {
        	isDragging = false;
            event.target.stopDrag();
        }   		
	}
}
