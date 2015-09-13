package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class AsExam8_3 extends Sprite
	{
		private var circle1:AsExam8_3_Sub = new AsExam8_3_Sub(50);
		private var circle1_sub:AsExam8_3_Sub = new AsExam8_3_Sub(30);		
		private var circle2:AsExam8_3_Sub = new AsExam8_3_Sub(50);
		private var circle2_sub:AsExam8_3_Sub = new AsExam8_3_Sub(30);		
		
		public function AsExam8_3()
		{
			displayMain();
			addEventHandlers();
		}
		// circle1에 circle1_sub를 추가하고
		// circle2에 circle2_sub를 추가한다.
		private function displayMain():void
		{
            circle1.addChild(circle1_sub);
            circle2.addChild(circle2_sub);
            this.addChild(circle1);
            this.addChild(circle2);
            circle1.x = 50; 
            circle1.y = 50;
            circle2.x = 150;
            circle2.y = 50;
		}
        // circle1, circle1_sub에는 rollOverHandler함수를 추가하고
        // circle2, circle2_sub에는 mouseOverHandler함수를 추가한다.		
		private function addEventHandlers():void
		{
			circle1.addEventListener(MouseEvent.ROLL_OVER, rollOverHandler);
			circle1_sub.addEventListener(MouseEvent.ROLL_OVER, rollOverHandler);
			circle2.addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
			circle2_sub.addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
		}
		// 외부에서 circle1_sub로 들어올 때만 이벤트 발생
		private function rollOverHandler(event:MouseEvent):void 
		{
			circle1_sub.drawMyCircle()
			trace('[rollOverHandler] event.type:' + event.type + " event.target:" + event.target.name);
		}
		// circle2, circle2_sub 모두 그 위를 지나 갈때 마다 이벤트 발생 
		private function mouseOverHandler(event:MouseEvent):void 
		{
            circle2_sub.drawMyCircle()			
			trace('[mouseOverHandler] event.type:' + event.type + " event.target:" + event.target.name);
		}
	}
}