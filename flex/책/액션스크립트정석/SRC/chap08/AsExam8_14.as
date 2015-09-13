package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	public class AsExam8_14 extends Sprite
	{
		private var tfContentsFormat:TextFormat = new TextFormat();
		private var tfContents:TextField = new TextField();
		private var tfURL:TextField = new TextField();
		// 텍스트필드 포맷을 설정하기 위한 8개의 토글 버튼을 추가함
		private var tbAL:AsExam8_ToggleButton = new AsExam8_ToggleButton("tbAL", 12, 12,  "assets/icon_align_left.png");
		private var tbAC:AsExam8_ToggleButton = new AsExam8_ToggleButton("tbAC",12, 12, "assets/icon_align_center.png");
		private var tbAR:AsExam8_ToggleButton = new AsExam8_ToggleButton("tbAR", 12, 12, "assets/icon_align_right.png");
		private var tbAJ:AsExam8_ToggleButton = new AsExam8_ToggleButton("tbAJ",12, 12, "assets/icon_align_justify.png");
		private var tbBL:AsExam8_ToggleButton = new AsExam8_ToggleButton("tbBL",12, 12, "assets/icon_bullet.png");
		private var tbBO:AsExam8_ToggleButton = new AsExam8_ToggleButton("tbBO",12, 12, "assets/icon_style_bold.png");
		private var tbIT:AsExam8_ToggleButton = new AsExam8_ToggleButton("tbIT",12, 12, "assets/icon_style_italic.png");
		private var tbUL:AsExam8_ToggleButton = new AsExam8_ToggleButton("tbUL",12, 12, "assets/icon_style_underline.png");
		
		public function AsExam8_14()
		{
     		makeContentText();
			addToggleButtons();
			makeURLField();
		}
				
		private function makeContentText():void 
		{
       		tfContentsFormat.blockIndent = 10;
            tfContentsFormat.size = 7;			
            tfContents.background = true;
            tfContents.border = true;
			tfContents.type = TextFieldType.INPUT;
			tfContents.x = 0;
			tfContents.y = 10;
			tfContents.width = 220;
			tfContents.height = 190;
			tfContents.defaultTextFormat = tfContentsFormat;
			tfContents.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);	
			this.addChild(tfContents);
        	tfContents.text = "낙화(落花) \n"
	        +"                                                  이형기\n"
			+ "가야 할 때가 언제인가를\n"
			+ "분명히 알고 가는 이의\n"
			+ "뒷모습은 얼마나 아름다운가.\n"
			+ "\n"
			+ "봄 한철\n"
			+ "격정을 인내한\n"
			+ "나의 사랑은 지고 있다.\n"
			+ "\n"
			+ "분분한 낙화……\n"
			+ "결별이 이룩하는 축복에 싸여\n"
			+ "지금은 가야 할 때,\n"
			+ "\n"
			+ "무성한 녹음과 그리고\n"
			+ "머지않아 열매 맺는\n"
			+ "가을을 향하여\n"
			+ "\n"
			+ "나의 청춘은 꽃답게 죽는다.\n"
			+ "\n"
			+ "헤어지자\n"
			+ "섬세한 손길을 흔들며\n"
			+ "하롱하롱 꽃잎이 지는 어느 날\n"
			+ "\n"
			+ "나의 사랑, 나의 결별,\n"
			+ "샘터에 물 고이듯 성숙하는\n"
			+ "내 영혼의 슬픈 눈.\n";
		}
		
		private function addToggleButtons():void
		{
			// 텍스트 정렬
			tbAL.x = 0; tbAL.y = 201;
			tbAC.x = 12; tbAC.y = 201;
			tbAR.x = 24; tbAR.y = 201;
			tbAJ.x = 36; tbAJ.y = 201;
			// bullet 
			tbBL.x = 48; tbBL.y = 201;
			// bold
			tbBO.x = 60; tbBO.y = 201;
			// italic
			tbIT.x = 72; tbIT.y = 201;
			// underline 
			tbUL.x = 84; tbUL.y = 201;
			this.addChild(tbAL);
			this.addChild(tbAC);
			this.addChild(tbAR);
			this.addChild(tbAJ);
			this.addChild(tbBL);
			this.addChild(tbBO);
			this.addChild(tbIT);
			this.addChild(tbUL);
			tbAL.addEventListener(MouseEvent.CLICK, clickHandler);
			tbAC.addEventListener(MouseEvent.CLICK, clickHandler);
			tbAR.addEventListener(MouseEvent.CLICK, clickHandler);
			tbAJ.addEventListener(MouseEvent.CLICK, clickHandler);
			tbBL.addEventListener(MouseEvent.CLICK, clickHandler);
			tbBO.addEventListener(MouseEvent.CLICK, clickHandler);
			tbIT.addEventListener(MouseEvent.CLICK, clickHandler);
			tbUL.addEventListener(MouseEvent.CLICK, clickHandler);
		}
		
		private function makeURLField():void
		{
            tfURL.defaultTextFormat = tfContentsFormat;			
            tfURL.background = true;
            tfURL.border = true;
			tfURL.type = TextFieldType.INPUT;
			tfURL.width = 120;
			tfURL.height = 12;
			this.addChild(tfURL);
			tfURL.x = 100;
			tfURL.y = 201;
			tfURL.text = "http://okgosu.net";			
		}

		private function mouseUpHandler(event:MouseEvent):void 
		{
			var tempFormat:TextFormat = new TextFormat();
			tempFormat.underline = true;
			if( tfContents.selectionBeginIndex >= 0 && tfContents.selectionEndIndex < tfContents.length ) 
			{
				tempFormat.url = tfURL.text;
				tfContents.setTextFormat(tempFormat,  tfContents.selectionBeginIndex, tfContents.selectionEndIndex);
			}
		}
		// 토글 버튼을 클릭했을 때, 토글버튼의 이름에 따라 텍스트포맷을 변경함
		private function clickHandler(event:MouseEvent):void
		{
			var insName:String = event.currentTarget.name;
			switch(insName)
			{
				case "tbAL":
					tfContentsFormat.align = TextFormatAlign.LEFT;
					tbAL.setToggled();
					tbAC.displayBaseState();
					tbAR.displayBaseState();
					tbAJ.displayBaseState();
					break;
				case "tbAC":
					tfContentsFormat.align = TextFormatAlign.CENTER;
					tbAC.setToggled();
					tbAL.displayBaseState();
					tbAR.displayBaseState();
					tbAJ.displayBaseState();					
					break;
				case "tbAR":
					tfContentsFormat.align = TextFormatAlign.RIGHT;
					tbAR.setToggled();
					tbAL.displayBaseState();
					tbAC.displayBaseState();
					tbAJ.displayBaseState();					
					break;
				case "tbAJ":
					tfContentsFormat.align = TextFormatAlign.JUSTIFY;
					tbAJ.setToggled();
					tbAL.displayBaseState();
					tbAC.displayBaseState();
					tbAR.displayBaseState();
					break;
				case "tbBL":
					tbBL.setToggled();
					tfContentsFormat.bullet = tbBL.toggled;
					break;
				case "tbBO":
					tbBO.setToggled();
					tfContentsFormat.bold = tbBO.toggled;
					break;
				case "tbIT":
					tbIT.setToggled();
					tfContentsFormat.italic = tbIT.toggled;
					break;
				case "tbUL":
					tbUL.setToggled();
					tfContentsFormat.underline = tbUL.toggled;
					break;
			}
			tfContents.setTextFormat(tfContentsFormat);
		}
	}
}