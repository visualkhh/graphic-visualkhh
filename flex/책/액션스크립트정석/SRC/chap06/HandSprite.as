package 
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.*;
	import flash.net.URLRequest;
	// 가위바위보 이미지를 로드하여 보여주는 클래스
	public class HandSprite extends Sprite 
	{
		// 선택한 가위바위보값을 저장
		public var hand:String;
		// 가위바위보 이미지를 로드하기 위한 Loader 
		private var ld:Loader;
		public function HandSprite(imgName:String)
		{
			this.hand = imgName;
			this.buttonMode = true;
			loadHand();
		}
		// assets폴더에 있는 가위바위보 이미지를 로드함 
		private function loadHand():void
		{
			ld = new Loader();
			this.addChild(ld);
			ld.load(new URLRequest("assets/" + hand + ".jpg"));
			ld.scaleX = 0.7;
			ld.scaleY = 0.7;
			this.addEventListener(MouseEvent.CLICK, clickHandler);
		}
        // 로드한 이미지를 0.7배로 축소함
        public function restore():void 
        {
            ld.scaleX = 0.7;
            ld.scaleY = 0.7;
        }
        // 가위바위보 이미지를 클릭하면 GosuEvent가 발생하면서 이미지를 1.1배 확대함 
		private function clickHandler(event:MouseEvent):void 
		{
			this.dispatchEvent(new GosuEvent("okgosu", hand));
			ld.scaleX = 1.1;
			ld.scaleY = 1.1;
		}
	}
}