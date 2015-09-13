package
{
    import flash.display.Bitmap;
    import flash.display.Loader;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.geom.ColorTransform;
    import flash.net.URLRequest;
    import flash.system.LoaderContext;
    import flash.system.Security;
    import flash.system.SecurityDomain;
    [SWF(backgroundColor = 0xffffff)]
    public class AsExam12_24 extends Sprite
    {
        private var btn0:AsExam8_SimpleButton = new AsExam8_SimpleButton("crossdomain.xml 없음", 200, "http://swarchitect.org/pds");       
        private var btn1:AsExam8_SimpleButton = new AsExam8_SimpleButton("crossdomain.xml 있음,okgosu.net 차단", 200, "http://swexperts.org/private");
        private var btn2:AsExam8_SimpleButton = new AsExam8_SimpleButton("crossdomain.xml 있음,okgosu.net 허용", 200, "http://swexperts.org/public");
        private var loader:Loader = new Loader(); 

        public function AsExam12_24()
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
            loader.y = 85;
            this.addChild(loader);
        }
        
        private function clickHandler(event:MouseEvent):void
        {
            var btn:AsExam8_SimpleButton = event.target as AsExam8_SimpleButton;
            // 로드한 내용 초기화
            loader.unload();
            if(btn != null)
            {
                try
                {
                    // 폴리시 파일 로드
                    Security.loadPolicyFile(btn.link + "/crossdomain.xml");
                    // contentLoaderInfo에 컴플리트 핸들러 추가
                    loader.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
                    // 로더컨텍스트와 함께 로드
                    loader.load(new URLRequest(btn.link + "/jaemin.jpg"), new LoaderContext(true)); 
                } 
                catch(e:SecurityError)
                {
                    trace('SecurityError:', e);
                }
            }               
        }

        private function completeHandler(event:Event):void 
        { 
            if(loader.content != null)
            {
                // 로드한 jpg 파일을 비트맵으로 추가
                var bm:Bitmap = loader.content as Bitmap;
                // 컬러트랜스폼(파란색) 적용
                bm.transform.colorTransform = new ColorTransform(-1, -1, 1, 1, 255, 255, 255, 0);
            }
        }       
    }
}