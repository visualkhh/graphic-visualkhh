package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;	
	
	public class AsExam8_6_Sub extends Sprite
	{
		public var bgColor:int;
		public function AsExam8_6_Sub() 
		{
			displayMain();
			addEventHandlers();
		}
		// 랜덤한 색상으로 사각형을 그린다.
		private function displayMain():void
		{
			bgColor = Math.random() * 0x1000000;
			this.buttonMode = true;
			this.graphics.beginFill(bgColor);
			this.graphics.drawRect(0, 0, 50, 25);
		}
		// 마우스다운, 마우스업 이벤트 핸들러를 등록한다.
		private function addEventHandlers():void
		{
			this.addEventListener(MouseEvent.MOUSE_DOWN, startDragging);
			this.addEventListener(MouseEvent.MOUSE_UP, stopDragging);			
		}
		// 드래그 시작
		private function startDragging(event:MouseEvent):void 
		{
			 this.startDrag();
		}
        // 드랍시 실행할 함수
		private function stopDragging(event:MouseEvent):void 
		{
			//드랍한 객체의 이름이 sp일 경우 실행 
		    if(this.dropTarget != null && this.dropTarget.name == 'sp') 
		    {
				var sp:Sprite = this.dropTarget as Sprite;
				sp.graphics.clear();
				// sp를 bgColor 값으로 다시 색칠한다.
				sp.graphics.beginFill(bgColor);
				sp.graphics.drawRect(100, 100, 100, 100);
				// 드래그 종료
				this.stopDrag();
		    	this.visible = false;
		    	// 드래그앤 드랍 이벤트 핸들러 제거  
				this.removeEventListener(MouseEvent.MOUSE_DOWN, startDragging) 
				this.removeEventListener(MouseEvent.MOUSE_UP, stopDragging);
		    } else {
		        trace('wrong drop target!');
		    }			 
		}
	}
}