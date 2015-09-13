package
{
    import flash.display.Loader;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    import flash.net.URLVariables;
    import flash.text.TextField;    
    [SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
    public class AsExam12_28 extends Sprite
    {
        private var tf:TextField=new TextField();
        private var btn:AsExam8_SimpleButton = new AsExam8_SimpleButton("LOAD", 40);
        private var loader:URLLoader = new URLLoader(); 
        
        public function AsExam12_28()
        {
            displayMain();
            addEventHandlers();
        }

        private function displayMain():void
        {
        	// Flickr 사이트 태그를 'okjaemin (옥재민)'으로 검색
            tf.text = 'okjaemin';
            tf.height = 20;
            tf.width = 100;
            tf.border = true;
            tf.background = true; 
            tf.type = "input";
            tf.x = 25;          
            this.addChild(tf);          
            this.addChild(btn);
            btn.x = 135;
        }
        
        private function addEventHandlers():void
        {
            btn.addEventListener(MouseEvent.CLICK, clickHandler);
            loader.addEventListener(Event.COMPLETE, completeHandler);       
        }
        // Flickr 사이트의 이미지를 태그로 검색하는 오픈 API를 호출        
        private function clickHandler(event:MouseEvent):void
        {
            var request:URLRequest = new URLRequest("http://api.flickr.com/services/feeds/photos_public.gne"); 
            var variables:URLVariables = new URLVariables();
            variables.format = "rss_200_enc";
            // 텍스트필드의 값을 파라미터로 넘긴다.
            variables.tags = tf.text;
            request.data = variables;            
            loader.load(request); 
        }
        // Flcikr 오픈 API 호출결과 XML에서 이미지 URL을 파싱하여 화면에 보여준다.
        private function completeHandler(event:Event):void 
        { 
            if (loader != null) 
            { 
                var rssXML:XML = new XML(loader.data); 
                // soapNS 네임스페이스의 thumnail의 url 속성 파싱
                var soapNS:Namespace = rssXML.namespace("media");
                trace("soapNS: " + soapNS);
                var idx:int=0;
                for each(var p:XML in rssXML.channel.item)
                {
                    drawData(idx,p.soapNS::thumbnail.@url); 
                    idx++;
                }
            } 
            else 
            { 
                trace("Loading 실패"); 
            } 
        }
        // 이미지 순서값과 링크값을 이용하여 이미지를 Loader로 로딩한다음 화면에 추가한다.
        private function drawData(idx:int, link:String):void
        {
        	// 각 이미지에 해당하는 Loader 객체 생성
            var imageLoader:Loader = new Loader();
            var req:URLRequest = new URLRequest(link);
            imageLoader.load(req);
            // 이미지의 위치 계산
            imageLoader.x = 25 + 80 * (idx % 4);
            imageLoader.y = 25 + 80 * (int(idx / 4));
            // 화면에 Loader 추가
            this.addChild(imageLoader);
        }               
    }
} 
