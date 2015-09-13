package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
    // 숫자 입력기를 선택하면 numberChanged이벤트가 발생하도록 함
	[Event(name="numberChanged", type="flash.events.MouseEvent")]
	public class AsExam8_NumericStepper extends Sprite
	{
		// 숫자값을 보여주기 위한 텍스트필드
		private var tf:TextField = new TextField();
		// 현재 선택한 값
		public var selectedNumber:Number=0;
		// 숫자값 변화 간격
		public var interval:Number=1;
		// 시작값	
		public var fromNum:Number=0;
		// 최고값  
		public var toNum:Number=0;
		// 라벨값
        private var nsLabel:String;		
        // 라벨 텍스트필드 
        private var tfLabel:TextField = new TextField();
        // 상하 버튼의 누름 여부
        public var upDownYN:int = 1;

        // 시작값, 최고값, 간격, 라벨, 인스턴스명, 선택값을 입력 받는 생성자 함수
        public function AsExam8_NumericStepper(fromNum:Number=0, toNum:Number=0, interval:Number=1, nsLabel:String='', insName:String='', selectedNum:Number=0)
        {
            this.fromNum = fromNum;
            this.toNum = toNum;
            this.interval = interval;
            this.nsLabel = nsLabel;
            this.name = insName;
            this.selectedNumber = selectedNum;       
            drawNumericStepper();
        }		
		// 숫자 입력기를 화면에 그린다.
		private function drawNumericStepper():void
		{
			// 텍스트필드를 화면에 추가한다.
			this.addChild(tf);
            tf.background = true;
            tf.border = true;
            tf.height = 18;
            tf.width = 50;
            tf.text = "" + selectedNumber;
            // 라벨을 화면에 추가한다.
            this.addChild(tfLabel);
            tfLabel.x = 50;
            tfLabel.text = this.nsLabel;
            
            // 위쪽 버튼을 추가한다.
			var upBtn:AsExam8_TriangleButton = new AsExam8_TriangleButton(6);
			// 버튼 방향이 위로 가도록 180도 회전한다.
			upBtn.rotation = 180;
			upBtn.x = 48;
			upBtn.y = 8;
			// 아래쪽 버튼을 추가한다.
			var downBtn:AsExam8_TriangleButton = new AsExam8_TriangleButton(6);
			this.addChild(upBtn);
			this.addChild(downBtn);
			downBtn.y = 10;	
			downBtn.x = 42;
			// 버튼에 클릭이벤트 핸들러 함수를 등록한다.
			upBtn.addEventListener(MouseEvent.CLICK, upBtnClickHandler);
			downBtn.addEventListener(MouseEvent.CLICK, downBtnClickHandler);
		}
        // 업버튼을 누르면 선택값을 증가시킨다.
		private function 	upBtnClickHandler(event:MouseEvent):void
		{
			selectedNumber+= interval;
			// 최고값을 넘지 않도록
			if(selectedNumber > toNum) selectedNumber = toNum;
			selectedNumber = Math.round(selectedNumber*10)/10; 
			tf.text = "" + selectedNumber;
			upDownYN = 1;
			// numberChanged 이벤트를 디스패치한다.
			event.currentTarget.dispatchEvent(new MouseEvent("numberChanged"));
		}
		// 다운버튼을 누르면 선택값을 감소시킨다.
		private function downBtnClickHandler(event:MouseEvent):void
		{
			selectedNumber-= interval;
			// 최저값을 넘지 않도록 
			if(selectedNumber < fromNum) selectedNumber = fromNum;
            selectedNumber = Math.round(selectedNumber*10)/10; 
			tf.text = "" + selectedNumber;
			upDownYN = -1;
			// numberChanged 이벤트를 디스패치한다.
			event.currentTarget.dispatchEvent(new MouseEvent("numberChanged"));
		}
	}
}