package {
    import flash.display.Sprite;
    import flash.events.TextEvent;
    import flash.text.TextField;
    
    [SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
    public class AsExam4_9 extends Sprite 
    {
    	// 검색어를 입력받을 TextField
        private var textInputTxt:TextField;
        // 컨텐츠를 표시할 TextField
        private var textArea:TextField;
        private var msg:String = ' 코드의 로직은 머리에서 코드의 입력은 타이핑에서 완성된다.' +
            ' 코드의 결과는 항상 정직하다. '+
            ' 사용자에게 코드는 트릭이다.'+
            ' 사소한 속성이나 함수의 존재 이유는 분명 어딘가에 쓰이기 때문이다.'+
            ' 코딩의 지름길은 단축키다.'+
            ' 고기를 잡는 법을 배워야 하듯이 코딩 결과보다는 코딩하는 과정을 배워라.'+
            ' 조각은 불필요한 부분을 제거하는 것. 코딩최적화는 불필요한 로직을 제거하는 것.'+
            ' 매트릭스의 네오의 눈으로 실세계를 코드화해서 보는 눈을 만들라.'+
            ' 물체의 회전후 모양을 예상하는 것은 3D의 기본이다.';   
        
        public function AsExam4_9() 
        {
        	displayMain();
        	addEventHandlers();
        }
        private function displayMain():void
        {
            textInputTxt = new TextField();
            textInputTxt.type = "input";
            textInputTxt.background = true;
            textInputTxt.border = true;
            textInputTxt.height = 20;    
            textInputTxt.width = 300;
            textInputTxt.backgroundColor = 0xEFAE63;
            textInputTxt.x = textInputTxt.y = 30; 
            this.addChild(textInputTxt);
            textInputTxt.text = "검색할 키워드를 입력하세요.";            
            
            textArea = new TextField();
            textArea.height = 200;
            textArea.width = 300;
            textArea.multiline = true;
            textArea.x = 30;
            textArea.y = 60;
            textArea.type = "input";
            textArea.backgroundColor = 0xC6DB94;
            textArea.background = true;
            textArea.border = true;       
            textArea.wordWrap = true;
            textArea.htmlText = msg;     
            this.addChild(textArea);            
        }
        // 검색어 창에 텍스트를 입력할 때 실행할 함수 지정
        private function addEventHandlers():void
        {
        	textInputTxt.addEventListener(TextEvent.TEXT_INPUT, textInputHandler);
        }
        // 텍스트가 입력되면 검색어를 마킹하는 함수 호출
        private function textInputHandler(event:TextEvent):void 
        {
        	var key:String = textInputTxt.text + event.text;
           	markString(key);
        }
        // 정규표현식을 이용하여 모든 일치하는 문자열을 검색한 다음 html로 마킹함
		private function markString(key:String):void
		{
			var reg:RegExp = new RegExp(key, "gi"); 
			var res:String = msg.replace(reg, "<b><u><font color='#FF0000'>" + key + "</font></u></b>");
			textArea.htmlText = res;
		}
    }
}
