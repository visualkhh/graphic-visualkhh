package 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	public class AsExam6_16 extends Sprite 
	{
		public function AsExam6_16() 
		{
			var circleSpr:Sprite = new Sprite();  
			this.addChild(circleSpr);
			circleSpr.graphics.beginFill(0xFF0000);
			circleSpr.graphics.drawCircle(100, 100, 100);
			// circleSpr에 대해 마우스 클릭 이벤트 핸들러 함수를 등록한다.
			circleSpr.addEventListener(MouseEvent.CLICK, clickHandler);
		}
		
		private function clickHandler(event:MouseEvent):void 
		{
			trace(event.type);
			trace(event.target);
			trace(event.stageX);
		}
	}
}