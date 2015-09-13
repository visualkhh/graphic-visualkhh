package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	// 마우스 클릭시 checkboxChecked를 발생한다는 선언
    [Event(name="checkboxChecked", type="flash.events.MouseEvent")]

	public class AsExam8_CheckBox extends Sprite
	{
		// 체크 박스의 상태값 저장
		public var checkboxEnabled:Boolean;
		// 체크박스의 라벨 텍스트 값
		public var checkboxText:String;
		// 체크박스 라벨 텍스트를 표시하는 텍스트필드
		private var checkboxTextField:TextField=new TextField();
		// 체크박스를 그리기 위한 Sprite
		private var checkBoxArea:Sprite = new Sprite();
		// 체크박스의 클릭 영역을 만들어주기 위한 Sprite
		private var checkBoxHitArea:Sprite = new Sprite();
		// 체크박스텍스트와 인스턴스 이름을 입력 받는 생성자 함수
		public function AsExam8_CheckBox(checkboxText:String, insName:String)
		{
			this.name = insName;
			this.checkboxText = checkboxText;
			initCheckBox();
		}
		
		private function initCheckBox():void 
		{
			// 체크되지 않은 상태의 체크박스를 그림
			drawUnchecked();
			// 체크박스의 마우스 클릭 영역을 그림
			drawHitarea();
			// 체크박스 라벨을 위한 텍스트 필드를 추가
			drawTextField();
			// 체크박스의 이벤트 핸들러 함수 추가
			checkBoxArea.addEventListener(MouseEvent.CLICK, clickHandler);
			this.addChild(checkBoxArea);
		}
	    // 체크박스 라벨 변경을 위한 함수로 외부에서 사용가능하도록 하기 위해 punblic으로 선언
		public function setCheckBoxText(txt:String):void
		{
			checkboxTextField.text = txt;
		}
		// 텍스트필드를 화면에 추가함 
		private function drawTextField():void 
		{
            checkboxTextField.x = 16;
            checkboxTextField.y = 0;
            checkboxTextField.text = checkboxText;
            checkboxTextField.autoSize = "left";
			this.addChild(checkboxTextField);
		}
		// checkBoxHitArea를 화면에 그린 다음 checkBoxHitArea를 checkBoxArea의 히트영역으로 설정
		private function drawHitarea():void 
		{
			checkBoxHitArea.graphics.beginFill(0xFFFF00, 0);
			checkBoxHitArea.graphics.drawRect(2, 2, 14, 14);
			checkBoxHitArea.graphics.endFill();
			checkBoxArea.buttonMode = true;
			checkBoxArea.hitArea = checkBoxHitArea; 
			checkBoxHitArea.mouseEnabled = false;
			this.addChild(checkBoxHitArea);
		}
		// V자 표시로 체크된 상태를 그림
		private function drawChecked():void 
		{
			checkBoxArea.graphics.clear();
			checkBoxArea.graphics.lineStyle(1, 0x000000);
			checkBoxArea.graphics.drawRect(2, 2, 14, 14);
			checkBoxArea.graphics.lineStyle(3, 0x000000);
			// V자 라인을 그림 
			checkBoxArea.graphics.moveTo(5, 5);
			checkBoxArea.graphics.lineTo(8, 13);
			checkBoxArea.graphics.lineTo(14, 4);
			checkBoxArea.graphics.endFill();
		}
		// V자 표시 없이 체크되지 않은 상태를 그림
		private function drawUnchecked():void 
		{
			checkBoxArea.graphics.clear();
			checkBoxArea.graphics.lineStyle(1, 0x000000);
			checkBoxArea.graphics.drawRect(2, 2, 14, 14);
			checkBoxArea.graphics.endFill();
		}
		// 체크가 되면 화면 상태를 바꾸고 checkboxChecked 이벤트 발생 
		private function clickHandler(event:MouseEvent):void 
		{
			if(!checkboxEnabled) 
			{
				drawChecked();
				checkboxEnabled = true;
			}
			else
			{
				drawUnchecked();
				checkboxEnabled = false;
			}
			event.currentTarget.dispatchEvent(new MouseEvent("checkboxChecked"));
		}
	}
}