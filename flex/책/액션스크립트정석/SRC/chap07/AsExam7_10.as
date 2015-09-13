package 
{
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import flash.net.URLRequest;
	import flash.net.navigateToURL;
    [SWF(backgroundColor=0xFFFFFF)]    
    public class AsExam7_10 extends Sprite 
    {
        public function AsExam7_10() 
        {
        	// SimpleButton을 4개 생성한다.
            makeSimpleButton("okgosu.net", 100, 10, 10);
            makeSimpleButton("okgosu.tistory.com", 100, 10, 35);
            makeSimpleButton("twitter.com/okgosu", 100, 10, 60);
            makeSimpleButton("acornpub.co.kr", 100, 10, 85);
        }
        
        private function makeSimpleButton(lblStr:String, size:int, xPos:int, yPos:int):void 
        {
        	var btn:AsExam7_10_SimpleButton = new AsExam7_10_SimpleButton(lblStr, size);
        	btn.x = xPos;
        	btn.y = yPos;
        	// 각 버튼에 클릭핸들러 함수를 추가한다.
        	btn.addEventListener(MouseEvent.CLICK, clickHandler);
        	this.addChild(btn);
        }
		
		private function clickHandler(evt:MouseEvent):void 
		{
			trace(evt.target.lblStr);
			var req:URLRequest = new URLRequest("http://" + evt.target.lblStr);
            navigateToURL(req);
		}
    }
}