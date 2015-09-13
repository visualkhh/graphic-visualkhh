package
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    import flash.system.Security;
    import flash.text.TextField;
    [SWF(backgroundColor = 0xffffff)]
    public class AsExam12_23 extends Sprite
    {
        private var btn0:AsExam8_SimpleButton = new AsExam8_SimpleButton("crossdomain.xml 없음", 200, "http://swarchitect.org/pds");      
        private var btn1:AsExam8_SimpleButton = new AsExam8_SimpleButton("crossdomain.xml 있음,okgosu.net 차단", 200, "http://swexperts.org/private");
        private var btn2:AsExam8_SimpleButton = new AsExam8_SimpleButton("crossdomain.xml 있음,okgosu.net 허용", 200, "http://swexperts.org/public");
        // XML 파일을 로딩
        private var loader:URLLoader = new URLLoader(); 
        // 로드한 XML 내용을 보여줌
        private var textArea:TextField = new TextField();
        public function AsExam12_23()
        {
            displayMain();
            stage.addEventListener(MouseEvent.CLICK, clickHandler);
        } 
        
        private function displayMain():void
        {
            this.addChild(btn0);
            this.addChild(btn1);
            this.addChild(btn2);
            btn0.y = 10;
            btn1.y = 35;
            btn2.y = 60;
            this.addChild(textArea);
            textArea.height = 200;
            textArea.width = 385;
            textArea.multiline = true;
            textArea.y = 90;
            textArea.type = "input";
            textArea.backgroundColor = 0x0FF0FF;
            textArea.background = true;
            textArea.border = true;       
            this.addChild(textArea);                
        }
        
        private function clickHandler(event:MouseEvent):void
        {
            var btn:AsExam8_SimpleButton = event.target as AsExam8_SimpleButton;
            // 텍스트필드 내용 초기화
            textArea.text = "";
            // 클릭한 곳이 버튼일 경우에 이벤트 처리
            if(btn != null)
            {
                // 폴리시 파일 로드
                Security.loadPolicyFile(btn.link + "/crossdomain.xml");
                loader.addEventListener(Event.COMPLETE, completeHandler);
                // XML 파일 로딩
                loader.load(new URLRequest(btn.link + "/okgosu-rss.xml")); 
            }               
        }
        // 텍스트필드에 로드한 XML파일 내용 보여주기
        private function completeHandler(event:Event):void 
        { 
            textArea.text = loader.data;
        }           
    }
}