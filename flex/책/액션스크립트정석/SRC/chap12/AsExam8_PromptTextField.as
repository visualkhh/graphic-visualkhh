package
{
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldType;
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;
	
	public class AsExam8_PromptTextField extends TextField
	{
		public var promptText:String;
		private var passwdEnabled:Boolean;
		private var texFormat:TextFormat = new TextFormat();
		
		public function AsExam8_PromptTextField(dt:String, passwd:Boolean)
		{
			super();
			this.promptText = dt;
            this.passwdEnabled = passwd;
			layoutTextField();
            displayDefaultText();
           	this.addEventListener(MouseEvent.CLICK, clickHandler);
           	this.addEventListener(FocusEvent.FOCUS_IN, focusInHandler);
           	this.addEventListener(FocusEvent.FOCUS_OUT, focusOutHandler);
            
		}
		private function layoutTextField():void
		{
			this.height = 20;
            this.width = 150;
			this.type = TextFieldType.INPUT;
			this.background = true;
            this.border = true;
		}
		public function displayTextInput():void
		{
            texFormat.color = 0xFF0000;
            texFormat.size = 14;
            texFormat.italic = false;
            this.defaultTextFormat = texFormat;
			if(this.text == promptText) this.text = "";
			if(passwdEnabled) this.displayAsPassword = true;
		}
		public function displayDefaultText():void 
		{
            texFormat.color = 0xCCCCCC;
            texFormat.size = 14;
            texFormat.italic = true;
            this.defaultTextFormat = texFormat;            
			this.text = promptText;
			if(passwdEnabled) this.displayAsPassword = false;
		}
		private function focusInHandler(event:FocusEvent):void 
		{
			var tf:AsExam8_PromptTextField = event.target as AsExam8_PromptTextField;
			tf.displayTextInput();
		}

		private function focusOutHandler(event:FocusEvent):void 
		{
			var tf:AsExam8_PromptTextField = event.target as AsExam8_PromptTextField;
			if(tf.text.length == 0) tf.displayDefaultText();
		}
		
		private function clickHandler(event:MouseEvent):void 
		{
			var tf:AsExam8_PromptTextField = event.target as AsExam8_PromptTextField;
			tf.displayTextInput();
		}		
	}
}