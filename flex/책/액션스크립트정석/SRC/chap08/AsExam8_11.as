package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	[SWF(backgroundColor=0xFFFFFF)]
	public class AsExam8_11 extends Sprite
	{
		private var textFld:TextField = new TextField();
		private var texFormat:TextFormat = new TextFormat();
		// 텍스트 필드 속성 변경용 체크박스 3개
		private var cb1:AsExam8_CheckBox = new AsExam8_CheckBox("텍스트필드 배경, 테두리 변경", "cb1");
		private var cb2:AsExam8_CheckBox = new AsExam8_CheckBox("텍스트필드 타입 변경", "cb2");
		private var cb3:AsExam8_CheckBox = new AsExam8_CheckBox("워드랩 & 오토사이즈", "cb3");
		
		public function AsExam8_11()
		{
			displayMain();
			addCheckBoxes();
			addEventHandlers();
		}
        // 텍스트 필드를 화면에 추가한다.
        private function displayMain():void 
        {
            textFld.x = 10;
            textFld.y = 90;
            textFld.height = 20;
            textFld.width = 200;
            // 배경색상을 적용 가능하도록 함
            textFld.background = true;
            // 텍스트필드 테두리를 보이도록
            textFld.border = true;
            // 최대 글자수는 100자
            textFld.maxChars = 100;
            // 텍스트 줄바꿈이 되도록 함 
            textFld.wordWrap = true;
            // 입력 가능한 텍스트 필드로 설정
            textFld.type = TextFieldType.INPUT;
            // 텍스트필드 글자색은 파란색
            texFormat.color = 0x0000FF;
            texFormat.size = 14;
            texFormat.italic = true;
            // 텍스트필드의 기본 텍스트포맷을 지정함
            textFld.defaultTextFormat = texFormat;  
            // 텍스트 설정은 기본 텍스트포맷후에 수행해야함           
            textFld.text = "코드의 로직은 머리에서 코드의 입력은 타이핑에서 완성된다";          
            this.addChild(textFld);
        }
        // 체크박스 3개를 추가함  		
		private function addCheckBoxes():void
		{
			cb1.x = 5; cb1.y = 30;
			this.addChild(cb1);
			cb2.x = 5; cb2.y = 50;
			this.addChild(cb2);
			cb3.x = 5; cb3.y = 70;
			this.addChild(cb3);
		}
		// 각 체크박스가 체크될 때 실행될 함수를 checkedHandler로 지정
		private function addEventHandlers():void
		{
			cb1.addEventListener("checkboxChecked", checkedHandler);
			cb2.addEventListener("checkboxChecked", checkedHandler);
			cb3.addEventListener("checkboxChecked", checkedHandler);
		}
		// 체크박스가 체크되면 체크박스 이름으로 구분하여 텍스트필드의 속성을 바꾼다.
		private function checkedHandler(event:MouseEvent):void
		{
			var objName:String = event.currentTarget.name;
			switch(objName)
			{
				case 'cb1':
	                if(cb1.checkboxEnabled) 
	                {
	                    textFld.backgroundColor = Math.random()*0x1000000;              
	                    textFld.border = true;
	                    textFld.borderColor =  0xFF0000;
	                }
	                else
	                {
	                    textFld.backgroundColor = 0xFFFF00;
	                    textFld.border = false;
	                }
	                cb1.setCheckBoxText("테두리 표시: " + textFld.border + " 배경색: 0x" + textFld.backgroundColor.toString(16));				
				    break;
                case 'cb2':
	                if(cb2.checkboxEnabled) 
	                {
	                    textFld.type = TextFieldType.INPUT;
	                    textFld.background = true;
	                    textFld.border = true;                  
	                }
	                else
	                {
	                    textFld.type = TextFieldType.DYNAMIC;
	                    textFld.background = false;
	                    textFld.border = false;
	                }
	                cb2.setCheckBoxText("텍스트필드 타입: " + textFld.type);                
                    break;
                case 'cb3':
	                if(cb3.checkboxEnabled) 
	                {
	                    textFld.wordWrap = true;
	                    textFld.autoSize = TextFieldAutoSize.LEFT;
	                }
	                else
	                {
	                    textFld.wordWrap = false;
	                    textFld.autoSize = TextFieldAutoSize.NONE;
	                    textFld.height = 20;
	                }
	                cb3.setCheckBoxText("워드랩 타입: " + textFld.wordWrap + " 오토사이즈:" +   textFld.autoSize);                
                    break;     
			}
		}
	}
}