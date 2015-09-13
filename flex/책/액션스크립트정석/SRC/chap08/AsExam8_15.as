package 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.AntiAliasType;
    [SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
	public class AsExam8_15 extends Sprite 
	{
        // 포함시킬 폰트의 정보 설정    
		[Embed(mimeType='application/x-font', source="assets/-윤고딕350.ttf", fontName="-윤고딕350")]
        public var fontCls:Class;	// 폰트를 담을 클래스 선언	
        private var contentTxtFld:TextField = new TextField();
        
		public function AsExam8_15()
		{
            createTextField();
  			createDeviceFontsCombo();          
			createCheckBox();
		}
        // 폰트를 적용한 텍스트포맷생성하여 텍스트필드에 적용한다. 
		private function createTextField():void
		{
            var format:TextFormat = new TextFormat();
            format.font = "-윤고딕350";
            format.color = 0x0000FF;
            format.size = 12;
            contentTxtFld.defaultTextFormat = format;
            contentTxtFld.embedFonts = true;
            contentTxtFld.width = 250;
            contentTxtFld.height = 250;
            contentTxtFld.background = true;
            contentTxtFld.backgroundColor = 0xCCCCCC;
            contentTxtFld.border = true;
            contentTxtFld.borderColor = 0x00FF00;
            contentTxtFld.x = 20;
            contentTxtFld.y = 10;
            contentTxtFld.text = "                홀로서기\n"
            +"                                        서정윤\n"
            +"기다림은\n만남을 목적으로 하지 않아도\n좋다."
            +"\n\n가슴이 아프면\n아픈 채로, \n바람이 불면 "
            +"\n고개를 높이 쳐들면서, 날리는\n아득한 미소. "
            +"\n\n어디엔가 있을 \n나의 한 쪽을 위해\n"
            +"헤매이던 숱한 방황의 날들."
            +"\n태어나면서 이미 누군가가 정해졌었다면,\n"
            +"이제는 그를 \n만나고 싶다.\n\n";     
			addChild(contentTxtFld);
		}
		// 폰트리스트 배열을 담아와 화면에 보여주기 위한 콤보박스
		private function createDeviceFontsCombo():void 
		{
			var deviceFontsArray:Array = Font.enumerateFonts(true);
			deviceFontsArray.sortOn("fontName", Array.CASEINSENSITIVE);
			trace(deviceFontsArray[0].fontName);
            var systemFontsCombo:AsExam8_ComboBox = new AsExam8_ComboBox(deviceFontsArray, 100, 15, "fontName");
            this.addChild(systemFontsCombo);
            // 콤보박스의 선택이 바뀔 때 마다 changeDeiceFont가 실행되도록 한다.
            systemFontsCombo.addEventListener("comboChanged", changeDeviceFont);
			systemFontsCombo.x = 20;
			systemFontsCombo.y = 270;
		}          
        // 체크박스를 생성한다.
		private function createCheckBox():void
		{
			var checkBox:AsExam8_CheckBox = new AsExam8_CheckBox("Advanced AntiAlias", "ch");
			checkBox.x = 120;
			checkBox.y = 270;
			this.addChild(checkBox);
			// 체크박스가 선택되멸 changeAliasType 함수가 실행되도록 한다.
			checkBox.addEventListener("checkboxChecked", changeAliasType);
		}
        // 폰트선택을 바꾸면 텍스트필드에 새로운 텍스트포맷을 적용한다.
		private function changeDeviceFont(event:MouseEvent):void
		{
			var c:AsExam8_ComboBox = event.currentTarget as AsExam8_ComboBox; 
			trace("선택:" + c.selectedData);
            var format:TextFormat = new TextFormat();
            format.font = c.selectedData;
            contentTxtFld.setTextFormat(format);
            contentTxtFld.embedFonts = false;
		}
		// 텍스트필드의 AntiAliasType을 변경한다.
		private function changeAliasType(event:MouseEvent):void
		{
			var c:AsExam8_CheckBox = event.currentTarget as AsExam8_CheckBox;
			if(c.checkboxEnabled) 
			{
				contentTxtFld.antiAliasType = AntiAliasType.ADVANCED;
			} 
			else 
			{
				contentTxtFld.antiAliasType = AntiAliasType.NORMAL;
			}
		}
	}
}
