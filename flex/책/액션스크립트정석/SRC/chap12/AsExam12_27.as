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
    [SWF(backgroundColor = 0xffffff)]  
    public class AsExam12_27 extends Sprite
    {
        private var textArea:TextField = new TextField();
        private var comboArr:Array = ["red", "yellow", "green"];
        private var comboBox:AsExam8_ComboBox = new AsExam8_ComboBox(comboArr, 100, 15, "");
        private var loader:URLLoader = new URLLoader(); 
        
        public function AsExam12_27()
        {
        	displayMain();
        	addEventHandlers();
        }
        // 텍스트필드와 콤보박스를 추가한다.
        private function displayMain():void
        {
            textArea = new TextField();
            textArea.height = 150;
            textArea.width = 200;
            textArea.multiline = true;
            textArea.y = 30;
            textArea.x = 25;
            textArea.type = "input";
            textArea.backgroundColor = 0xCCCCCC;
            textArea.background = true;
            textArea.border = true;       
            this.addChild(textArea);     
            comboBox.x = 25;
            comboBox.y = 10;
            // 콤보박스가 텍스트필드에 가리지 않도록 텍스트필드보다 뒤에 추가한다.
            this.addChild(comboBox);
        }
        
        private function addEventHandlers():void
        {
            comboBox.addEventListener("comboChanged", comboChangedHandler);
            loader.addEventListener(Event.COMPLETE, completeHandler);       
        }
        // 콤보박스 값을 바꾸면 파라미터를 바꿔서 okgosu.net으로 요청을 전송한다.
        private function comboChangedHandler(event:MouseEvent):void
        {
            var request:URLRequest = new URLRequest("http://okgosu.net/book/get_xml_data.php"); 
            var variables:URLVariables = new URLVariables();
            // 콤보박스의 선택값을 request에 넘겨준다.
            variables.kind = comboBox.selectedData;
            request.data = variables;            
            loader.load(request); 
        }               
        // 로드가 완료되면 결과 XML을 파싱하여 텍스트필드에 추가한다.
        private function completeHandler(event:Event):void 
        { 
            if (loader != null) 
            { 
            	textArea.text = '';
                var resXML:XML = new XML(loader.data); 
                for each(var p:XML in resXML.item)
                {
                    textArea.appendText(p + "\n");
                }
                // XML확인을 위한 값 출력
                textArea.appendText("\n" + resXML);                
            } 
            else 
            { 
                trace("Loading 실패"); 
            } 
        }
    }
} 
