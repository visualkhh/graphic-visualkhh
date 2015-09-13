package
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.net.URLLoader;
    import flash.net.URLRequest;    
    import flash.net.navigateToURL;
    [SWF(backgroundColor=0xFFFFFF)]
    public class AsExam12_26 extends Sprite
    {
    	// RSS를 읽을 경로 
        private var comboArr:Array = ["http://okgosu.net/widget/OkGosu.Net.DevEng.xml", "http://okgosu.tistory.com/rss"];
        private var comboBox:AsExam8_ComboBox = new AsExam8_ComboBox(comboArr, 300, 15, "");
        public function AsExam12_26()
        {
            this.addChild(comboBox);
            comboBox.y = 10;
            comboBox.addEventListener("comboChanged", comboChangedHandler);
        }
        // 콤보박스 값을 바꾸면 RSS를 읽어 온다.
        private function comboChangedHandler(event:MouseEvent):void
        {
            loadXML(comboBox.selectedData);
        }       
        // 콤보박스 경로의 RSS를 읽어 온다.
        private function loadXML(site:String):void
        {
            var loader:URLLoader = new URLLoader(); 
            loader.load(new URLRequest(site)); 
            loader.addEventListener(Event.COMPLETE, completeHandler);       
        }
        // RSS 로드가 완료되면 XML을 파싱하고 화면에 그려준다.
        private function completeHandler(event:Event):void 
        { 
            var loader:URLLoader = event.target as URLLoader; 
            if (loader != null) 
            { 
            	// XML 파싱
                var rssXML:XML = new XML(loader.data); 
                var idx:int=0;
                for each(var p:XML in rssXML.channel.item)
                {
                    // RSS의 타이틀, 링크를 화면에 보여준다. 
                    drawData(idx, p.title, p.link);
                    idx++;
                }
                // 콤보박스가 가리지 않도록 뎁쓰를 조정한다
                this.addChild(comboBox);
            } 
            else 
            { 
                trace("Loading 실패"); 
            } 
        }
        // RSS제목을 가지는 버튼을 생성하여 순서대로 배치하고 클릭핸들러 함수를 등록한다.
        private function drawData(idx:int, title:String, link:String):void
        {
        	var btn:AsExam8_SimpleButton = new AsExam8_SimpleButton(title, 400, link);
        	btn.height = 30;
        	btn.y = idx * btn.height + 30;
        	btn.addEventListener(MouseEvent.CLICK, clickHandler);
        	this.addChild(btn);
        }        
        // RSS항목을 클릭하면 그 링크로 이동한다.
        private function clickHandler(event:MouseEvent):void
        {
            var req:URLRequest = new URLRequest(event.target.link);
            navigateToURL(req);
        }    
    }
} 
