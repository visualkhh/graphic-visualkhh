package 
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	[SWF(width=800,height=800,backgroundColor=0xFFFFFF)]	
	public class AsExam7_4 extends Sprite	
	{
		public function AsExam7_4()	
		{
			displayMain();
			addEventHandlers();
		}
		private function displayMain():void
		{
			var ld:Loader = new Loader();
			ld.load(new URLRequest("assets/okjaemin.jpg"));
			this.addChild(ld);
			// 패닝(스클롤링)을 위해 scrollRect 속성을 지정
			this.scrollRect = new Rectangle(0, 0, 800, 600);
			// 패닝(스클롤링)을 하려면 cacheAsBitmap 속성을 true로 설정 
			this.cacheAsBitmap = true;
		}
		private function addEventHandlers():void
		{
			// 키보드가 작동하기 위해서는 화면을 클릭했을 때 포커스를 주어야 함
			this.addEventListener(MouseEvent.CLICK, clickHandler);
			// 페이지업, 페이지다운키를 누르면 이미지가 상하로 스크롤 됨 
			this.addEventListener(KeyboardEvent.KEY_DOWN, keyboardHandler);	
		}
		
		private function keyboardHandler(evt:KeyboardEvent):void 
		{
			var rect:Rectangle = this.scrollRect;
			switch(evt.keyCode) 
			{
				case 33: //pageUp
					if(rect.y > 0) rect.y -= 20;
					break;
				case 34: //pageDown
					if(rect.y < 800) rect.y += 20;
					break;
			}
			this.scrollRect = rect;
		}		
		
		private function clickHandler(evt:MouseEvent):void 
		{
		    stage.focus = this;
		}
	}
}