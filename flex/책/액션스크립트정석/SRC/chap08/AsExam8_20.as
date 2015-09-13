package 
{
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.filters.DropShadowFilter;
    [SWF(backgroundColor=0xFFFFFF)]
    public class AsExam8_20 extends Sprite 
    {
        public function AsExam8_20() 
        {
        	// 버튼 라벨, 핸드커서, 버튼활성화여부, 버튼크기, 좌표값을 지정한다.
            makeSimpleButton("okgosu.net", true, true, 60, 10, 10);
            makeSimpleButton("okgosu.tistory.com", false, true,  100, 10, 35);
            makeSimpleButton("acornpub.co.kr", true, false, 100, 10, 60);
            makeSimpleButton("adobe.com", false, false, 60, 10, 85);
        }
        // AsExam8_SimpleButton을 생성하여 화면에 추가한다.
        private function makeSimpleButton(lblStr:String, handFlag:Boolean, enabledFlag:Boolean, size:int, xPos:int, yPos:int):void 
        {
        	var btn:AsExam8_SimpleButton = new AsExam8_SimpleButton(lblStr, size, "",  handFlag, enabledFlag);
        	btn.x = xPos;
        	btn.y = yPos;
        	btn.addEventListener(MouseEvent.CLICK, clickHandler);  
        	this.addChild(btn);
        	// 버튼에 그림자 효과 필터 적용 
        	btn.filters = [new DropShadowFilter()];
        }
        // 버튼을 클릭하면 라벨에 적힌 웹사이트로 이동한다.		
		private function clickHandler(evt:MouseEvent):void 
		{
			trace(evt.target.lblStr);
			var req:URLRequest = new URLRequest("http://" + evt.target.lblStr);
            navigateToURL(req);
		}
    }
}