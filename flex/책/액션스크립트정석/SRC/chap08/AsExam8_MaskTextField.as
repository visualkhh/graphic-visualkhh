package
{
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFieldType;
    // 숫자형태 마스크 텍스트
	public class AsExam8_MaskTextField extends TextField
	{
		private var maskText:String;
		public function AsExam8_MaskTextField(maskText:String)
		{
			// 마스크 텍스트값 설정
			this.maskText = maskText;
			// 화면에 마스크값 표시
			this.text = this.maskText;
			this.type = TextFieldType.INPUT;
			this.border = true;
			this.background = true;
			this.backgroundColor = 0xCCCCCC;
			this.height = 20;
			// 최대 입력 글자수는 마스크값보다 1크게 설정
			this.maxChars = maskText.length+1;
			// 숫자만 입력되도록 제한
			this.restrict = "0-9"; 
			// change 이벤트에 대한 핸들러 함수를 추가함 
			this.addEventListener(Event.CHANGE, maskingText);
		}
		
		private function maskingText(event:Event):void
		{
			var temp:String = this.text;
            // 텍스트가 입력되면 현재 입력되고 있는 위치(caretIndex)의 문자값이 "_"라면 
            // 여태 입력된 텍스트값과 마스크 텍스트 뒷부분을 보여준다. 
			if(maskText.charAt(this.caretIndex-1) == "_") 
			{
				this.text = temp.substring(0, this.caretIndex) + maskText.substring(this.caretIndex, maskText.length);   
			}
			else
			{
                // 만일 "-"라면 현재 입력된 값을 보여주지 않고 "-"기호와 함께 
                // 여태 입력된 텍스트 값과 마스크 텍스트 뒷부분을 보여준다.				
				this.text = temp.substring(0, this.caretIndex-1) + "-" +  maskText.substring(this.caretIndex, maskText.length);
			}
			// 입력한 값이 마스크값보다 크면 마스크 길이만큼 자른다.
			if(this.text.length > maskText.length)
			{
				this.text = temp.substr(0, maskText.length);
			}
			trace(getInputText());
		}
		// 마스크값을 제외한 순수 입력한 값만 리턴하는 정규표현식 적용
		public function getInputText():String
		{
			return this.text.replace(/-*_?-*/g, "");
		}
	}
}