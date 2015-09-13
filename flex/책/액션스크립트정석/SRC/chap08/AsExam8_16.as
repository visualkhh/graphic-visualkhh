package 
{
    import flash.display.Sprite;
    import flash.events.KeyboardEvent;
    import flash.events.MouseEvent;
    import flash.events.TextEvent;
    import flash.text.TextField;
    import flash.text.TextFieldType;
    
    [SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
    public class AsExam8_16 extends Sprite 
    {
        private var textInputTxt:TextField = new TextField();
        private var textArea:TextField = new TextField();
        
        public function AsExam8_16() 
        {
            createTextInput();
            createTextArea();
            addEventHandlers();
        }
        
        private function createTextInput():void
        {
            textInputTxt.type = TextFieldType.INPUT;
            textInputTxt.background = true;
            textInputTxt.border = true;
            textInputTxt.height = 20;    
            textInputTxt.width = 300;
            textInputTxt.x = textInputTxt.y = 30; 
            addChild(textInputTxt);
            textInputTxt.text = "문장 입력후 엔터키를 치세요.";
        }
        
        private function createTextArea():void
        {            
            textArea.height = 200;
            textArea.width = 300;
            textArea.multiline = true;
            textArea.x = 30;
            textArea.y = 60;
            textArea.type = TextFieldType.INPUT;
            textArea.backgroundColor = 0x0FF0FF;
            textArea.background = true;
            textArea.border = true;       
            addChild(textArea);            
        }
        
        private function addEventHandlers():void
        {
            textInputTxt.addEventListener(KeyboardEvent.KEY_DOWN, keyboardHandler);
            textInputTxt.addEventListener(TextEvent.TEXT_INPUT, textInputHandler);        	
        }
        // 키보드가 눌러지면 입력된 텍스트값을 출력한다.
        private function textInputHandler(event:TextEvent):void 
        {
        	trace(event.text);
        }
        // 엔터키를 누르면 textInput의 텍스트값을 하단의 textArea값에 추가한다. 
		private function keyboardHandler(evt:KeyboardEvent):void 
		{
			if(evt.keyCode == 13) 
			{
            	textArea.appendText(textInputTxt.text + "\n");
            	textInputTxt.text = "";
			}
		}        
    }
}
