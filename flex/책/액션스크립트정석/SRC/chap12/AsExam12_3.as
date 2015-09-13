package
{
	import flash.display.Sprite;
	import flash.events.FocusEvent;
	import flash.system.Capabilities;
	import flash.system.IME;
	import flash.system.IMEConversionMode;
	import flash.text.TextField;
	import flash.text.TextFieldType;
    [SWF(backgroundColor = 0xffffff)]	
	public class AsExam12_3 extends Sprite
	{
		private var koTF:TextField = new TextField();
		private var enTF:TextField = new TextField();
		public function AsExam12_3()
		{
			displayMain();
			addEventHandlers();
		}
        // 텍스트필드 2개를 추가함
        private function displayMain():void
        {
        	this.addChild(koTF);
        	koTF.type = TextFieldType.INPUT;
            koTF.background = true;
            koTF.border = true;
            koTF.height = 20;
            koTF.y = 10;
        	koTF.text = '한글 입력 모드';
        	koTF.name = 'koTF';
            
        	this.addChild(enTF);
            enTF.type = TextFieldType.INPUT;
            enTF.background = true;
            enTF.border = true;
            enTF.height = 20;
        	enTF.y = 40;
        	enTF.text = 'English Input Mode';
        	enTF.name = 'enTF';
        }
        // 텍스트필드에 포커스인 이벤트 핸들러 등록
        private function addEventHandlers():void
        {
        	koTF.addEventListener(FocusEvent.FOCUS_IN, focusInHandler);
        	enTF.addEventListener(FocusEvent.FOCUS_IN, focusInHandler);
        }
        // 텍스트필드에 포커스가 오면 IME 설정
        private function focusInHandler(event:FocusEvent):void
        {
            if (Capabilities.hasIME) 
            { 
            	// koTF에 대해서는 IME를 KOREAN으로 설정함
	        	if(event.target.name=='koTF') 
	        	{
		            IME.enabled = true; 
		            IME.conversionMode = IMEConversionMode.KOREAN;         		
	        	} else {
	                IME.enabled = false;
	        	}
            } 
            else 
            { 
                trace("IME가 설치 되지 않았습니다"); 
            }     	        	
        }
	}
}