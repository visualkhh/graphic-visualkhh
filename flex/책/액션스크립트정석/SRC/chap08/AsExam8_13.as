package 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	
    [SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
	public class AsExam8_13 extends Sprite 
	{
        private var contentTxtFld:TextField = new TextField();
        private var txtContent:String = "서시(序詩) \n"
        +"                                    윤동주\n"
		+ "죽는 날까지 하늘을 우러러\n"
		+"한점 부끄럼이 없기를\n"
		+"잎새에 이는 바람에도\n"
		+"나는 괴로와했다\n"
		+"별을 노래하는 마음으로\n"
		+"모든 죽어가는 것들을 사랑해야지\n"
		+"그리고 나한테 주어진 길을\n"
		+"걸어가야겠다.\n"
		+"\n"
		+"오늘밤에도 별이 바람에 스치운다.\n\n";
		
		public function AsExam8_13()
		{
			displayMain();
			addEventHandlers();
		}
		// 텍스트필드를 생성하고 텍스트 포맷을 적용한다
		private function displayMain():void
		{
            createText();
            applyTextFormat();
            // 텍스트필드의 0번째부터 6번째 문자열이 선택되도록 한다.
            contentTxtFld.setSelection(0, 6);
		}
		// 텍스트를 선택하고 나면 mouseHpHandler가 실행되도록 한다.
		private function addEventHandlers():void
		{
            contentTxtFld.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
		}
        
        private function createText():void 
        {
            contentTxtFld.autoSize = TextFieldAutoSize.LEFT;
            contentTxtFld.type = TextFieldType.DYNAMIC;
            contentTxtFld.alwaysShowSelection = true;
            contentTxtFld.background = true;
            contentTxtFld.backgroundColor = 0xCCCCCC;
            contentTxtFld.border = true;
            contentTxtFld.borderColor = 0x00FF00;
            contentTxtFld.x = 20;
            contentTxtFld.y = 40;
            contentTxtFld.text = txtContent;
            addChild(contentTxtFld);
        }
 
        private function applyTextFormat():void
        {
            var fmt:TextFormat = new TextFormat();
            fmt.leading = 10;
            fmt.blockIndent = 20;
            fmt.letterSpacing = 2;
            contentTxtFld.setTextFormat(fmt);
        }        
        // 텍스트 선택이 끝나면 실행되는 함수
		private function mouseUpHandler(event:MouseEvent):void 
		{
		    // 선택한 부분이 텍스트내에 유효한 인덱스일 경우	
			if( contentTxtFld.selectionBeginIndex >= 0 && contentTxtFld.selectionEndIndex < contentTxtFld.length ) 
			{
				var tempFormat:TextFormat = new TextFormat();
				// 밑줄 표시
				tempFormat.underline = true;
				// 선택 영역만 글자색, 굵기를 변경한다.
				tempFormat.color = 0xFF0000;
				tempFormat.bold = true;
				contentTxtFld.setTextFormat(tempFormat, contentTxtFld.selectionBeginIndex, contentTxtFld.selectionEndIndex);
			}
		}        
	}
}
