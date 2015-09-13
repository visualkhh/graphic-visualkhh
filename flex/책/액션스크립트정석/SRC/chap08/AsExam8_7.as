package
{
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	
	public class AsExam8_7 extends Sprite
	{
		// 마우스 위치와 드래그 객체간 좌표 간격 조절을 위한 변수
		private var offsetX:Number;
		private var offsetY:Number;
		// 드래그되고 있는 디스플레이 오브젝트
		private var draggedObject:DisplayObject;

		public function AsExam8_7()
		{
		    displayMain();
		}
		// 화면에 AsExam8_7_Sub 객체를 겹치도록 8개 추가한다.
		private function displayMain():void 
		{
			for(var i:int=0; i<8; i++) 
			{
				var drObj:AsExam8_7_Sub = new AsExam8_7_Sub();
				drObj.x = 100 + (i * 10);
				drObj.y = 100 + (i * 10);
				this.addChild(drObj);
				drObj.addEventListener(MouseEvent.MOUSE_DOWN, startDragging);
				drObj.addEventListener(MouseEvent.MOUSE_UP, stopDragging);
			}
		}
        // 마우스를 누르면 실행될 함수
		private function startDragging(event:MouseEvent):void
		{
		    draggedObject = DisplayObject(event.target);
		    offsetX = event.stageX - draggedObject.x;
		    offsetY = event.stageY - draggedObject.y;
		    // 드래그할 디스플레이오브젝트를 맨위로 오도록 한다.
		    stage.addChild(draggedObject);
		    // 마우스 무브 이벤트 핸들러를 추가하여 같이 움직이도록 한다.
		    stage.addEventListener(MouseEvent.MOUSE_MOVE, dragObject);
		}	
		
		private function stopDragging(event:MouseEvent):void
		{
			// 드래그가 끝나면 알파값을 1로 복원하고 마우스무브 이벤트 핸들러를 제거한다.
			draggedObject.alpha = 1;
		    stage.removeEventListener(MouseEvent.MOUSE_MOVE, dragObject);
		}
		
		private function dragObject(event:MouseEvent):void
		{
		    draggedObject.x = event.stageX - offsetX;
		    draggedObject.y = event.stageY - offsetY;
		    // 드래그 되는 동안 알파값을 0.5로 줄인다.
		    draggedObject.alpha = 0.5;
		    event.updateAfterEvent();
		}
	}
}