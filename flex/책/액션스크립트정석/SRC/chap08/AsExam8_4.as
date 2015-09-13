package 
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	
	[SWF(backgroundColor=0xFFFFFF)]
	public class AsExam8_4 extends Sprite	
	{
		public function AsExam8_4()	
		{
			displayMain();
			addEventHandlers();
		}
		private function displayMain():void
		{
			stage.align = StageAlign.TOP_LEFT;
			// Loader에서 이미지를 화면에 추가 
			var ld:Loader = new Loader();
			ld.load(new URLRequest("assets/okjaemin2.jpg"));
			this.addChild(ld);
			// Sprite의 scrollRect 구역 설정 
			this.scrollRect = new Rectangle(0, 0, 800, 600);
		}
		
		private function addEventHandlers():void
		{	
			stage.addEventListener(MouseEvent.MOUSE_WHEEL, wheelHandler);
		}
		
		private function wheelHandler(event:MouseEvent):void 
		{
			// rect 영역을 마우스 휠의 움직인 양 만큼 움직인다.
			var rect:Rectangle = this.scrollRect;
			rect.y += event.delta*10;
			this.scrollRect = rect;			
		}
	}
}