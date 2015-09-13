package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
    // 마우스 클릭시 radioChecked 이벤트를 발생한다는 선언
    [Event(name="radioChecked", type="flash.events.MouseEvent")]
	public class AsExam8_RadioButton extends Sprite
	{
		// 라디오 버튼의 선택 상태
		public var radioEnabled:Boolean;
		// 라디오 버튼의 라벨 텍스트값
		public var radioText:String;
		// 라디오 버튼의 라벨 텍스트를 표시하기 위한 텍스트필드
		private var radioTextField:TextField=new TextField();
		// 라디오 버튼의 모양을 그려주기 위한 Sprite
		private var radioArea:Sprite = new Sprite();
		// 라디오 버튼의 히트영역
		private var radioHitArea:Sprite = new Sprite();
		public function AsExam8_RadioButton(radioText:String, insName:String)
		{
			this.name = insName;
			this.radioText = radioText;
			drawUnchecked();
			drawHitarea();
			drawTextField();
			radioArea.addEventListener(MouseEvent.CLICK, clickHandler);
			radioArea.hitArea = radioHitArea; 
			radioArea.buttonMode = true;
			radioHitArea.mouseEnabled = false;
			this.addChild(radioArea);
			this.addChild(radioHitArea);
		}
		// 라디오 버튼의 라벨텍스트값 설정, 외부에서 사용하므로 public으로 선언
		public function setRadioText(txt:String):void 
		{
			radioTextField.text = txt;
		}
		// 텍스트필드를 추가한다.
		private function drawTextField():void 
		{
            radioTextField.x = 15;
            radioTextField.y = 1;
            radioTextField.text = radioText;
            radioTextField.autoSize = "left";
			this.addChild(radioTextField);
		}
		// 마우스 히트 영역을 그린다.
		private function drawHitarea():void 
		{
			radioHitArea.graphics.beginFill(0xFFFF00, 0);
			radioHitArea.graphics.drawCircle(10, 10, 6);
			radioHitArea.graphics.endFill();0	
		}
		// 선택된 상태를 그린다. (원 두개)
		private function drawChecked():void 
		{
			radioArea.graphics.clear();
			radioArea.graphics.lineStyle(1, 0x000000);
			radioArea.graphics.drawCircle(10, 10, 6);
			// 가운데 원은 빨간색으로 칠하여 선택되었음을 표시
			radioArea.graphics.beginFill(0xFF0000);
			radioArea.graphics.drawCircle(10, 10, 4);
			radioArea.graphics.endFill();
		}
		// 선택되지 않은 상태를 그린다.
		public function drawUnchecked():void 
		{
			radioArea.graphics.clear();
			radioArea.graphics.lineStyle(1, 0x000000);
			radioArea.graphics.drawCircle(10, 10, 6);
			radioArea.graphics.drawCircle(10, 10, 4);
			radioArea.graphics.endFill();
			radioEnabled = false;
		}
		// 선택되어 있지 않은 상태에서 마우스로 클릭하면 radioChecked 이벤트를 디스패치함
		private function clickHandler(event:MouseEvent):void 
		{
			if(!radioEnabled) 
			{
				drawChecked();
				radioEnabled = true;
				event.currentTarget.dispatchEvent(new MouseEvent("radioChecked"));
			}
		}
		// 라디오 체크 상태를 변경한다.
        public function setEnable(flag:Boolean):void
        {
            this.radioEnabled = flag;
            if(flag)
            {
                drawChecked();
            }
            else
            {
                drawUnchecked();
            }
        }		
	}
}