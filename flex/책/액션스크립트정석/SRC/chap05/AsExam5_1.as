package {
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	[SWF(backgroundColor=0x000000)]
	public class AsExam5_1 extends Sprite 
	{
		// 이미지를 로드하는 클래스 
		private var ld:Loader = new Loader();
		public function AsExam5_1()	
		{ 
			displayMain();
			addEventHandlers();
		}
		
		private function displayMain():void
		{
			this.addChild(ld);
			ld.x = ld.y = 100;
            // assets/2.jpg를 로드한다.			
			ld.load(new URLRequest("assets/2.jpg"));
		}
		
		// 화면을 클릭하면 clickHandler 함수가 실행된다.
		private function addEventHandlers():void
		{
			stage.addEventListener(MouseEvent.CLICK, clickHanlder);
		}
		
		private function clickHanlder(event:MouseEvent):void 
		{
            // 1 ~ 3 까지의 숫자를 랜덤으로 생성
            var hand:uint = Math.random() * 3 + 1;  
            if(hand == 1) 
            {
				ld.load(new URLRequest("assets/" + hand + ".jpg"));//1이면 가위
            }
            else if(hand == 2) 
            {
            	ld.load(new URLRequest("assets/" + hand + ".jpg"));//2면 바위
            } 
            else if(hand == 3) 
            {
            	ld.load(new URLRequest("assets/" + hand + ".jpg"));//3이면 보
            }
            else 
            {
            	trace('error');
            }
        }
	}
}
