package
{
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldType;
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;
	
	public class AsExam8_PromptTextField extends TextField
	{
		// 기본적으로 표시될 문자열
		public var promptText:String;
		// 입력시 패스워드 형태로 할 지를 설정
		private var passwdEnabled:Boolean;
		private var texFormat:TextFormat = new TextFormat();
        // 기본 표시 문자열과 패스워드 표시 여부를 입력받는 생성자 함수  
		public function AsExam8_PromptTextField(promptText:String, passwdEnabled:Boolean)
		{
			this.promptText = promptText;
            this.passwdEnabled = passwdEnabled;
			displayMain();
            displayDefaultText();
            addEventHandlers();
        }
        // 텍스트필드의 크기와 형태를 설정한다.
		private function displayMain():void
		{
			this.height = 20;
            this.width = 150;
			this.type = TextFieldType.INPUT;
			this.background = true;
            this.border = true;
		}
        // 클릭, 포커스인, 포커스 아웃에 대한 이벤트 핸들러 등록
        private function addEventHandlers():void
        {
            this.addEventListener(MouseEvent.CLICK, clickHandler);
            this.addEventListener(FocusEvent.FOCUS_IN, focusInHandler);
            this.addEventListener(FocusEvent.FOCUS_OUT, focusOutHandler);
        }
        // 클래스 외부에서도 사용할 함수이므로 public 으로 선언
        // 텍스트필드를 프롬프트 텍스트를 보이는 초기 상태로 만들어 준다
		public function displayDefaultText():void 
		{
            texFormat.color = 0xCCCCCC;
            texFormat.size = 14;
            texFormat.italic = true;
            this.defaultTextFormat = texFormat;            
			this.text = promptText;
			if(passwdEnabled) this.displayAsPassword = false;
		}
        // 텍스트필드를 클릭했을 때 displayTextInput을 호출한다.
        private function clickHandler(event:MouseEvent):void 
        {
            displayTextInput();
        }   
		// 텍스트필드에 포커스가 왔을 때 displayTextInput을 호출한다.
		private function focusInHandler(event:FocusEvent):void 
		{
			displayTextInput();
		}
        // 포커스 아웃 되었을 때는 displayDefaultText를 호출한다.
		private function focusOutHandler(event:FocusEvent):void 
		{
			if(this.text.length == 0) displayDefaultText();
		}
        // 입력된 텍스트필드의 텍스트값이 promptText와 같다면 텍스트값을 지운다.
        // 즉 텍스트가 아직 입력이 안되었다면 클릭하거나 포커스를 받았을 때 텍스트값을 지워 입력할 수 있도록 한다.  
        private function displayTextInput():void
        {
            texFormat.size = 14;
            texFormat.color = 0xFF0000;
            texFormat.italic = false;
            this.defaultTextFormat = texFormat;
            if(this.text == promptText) this.text = "";
            if(passwdEnabled) this.displayAsPassword = true;
        }
	}
}