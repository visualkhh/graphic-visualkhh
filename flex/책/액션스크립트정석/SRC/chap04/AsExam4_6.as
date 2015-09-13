package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
   [SWF(backgroundColor=0xFFFFFF)]
	public class AsExam4_6 extends Sprite
	{
		// 각 색상별 값을 변화시키기 위한 컨트롤 
        private var nsRed:AsExam8_NumericStepper = new AsExam8_NumericStepper(0, 255, 10);
        private var nsGreen:AsExam8_NumericStepper = new AsExam8_NumericStepper(0, 255, 10);
        private var nsBlue:AsExam8_NumericStepper = new AsExam8_NumericStepper(0, 255, 10);
        // RGB값을 보여주는 텍스트필드
        private var tf:TextField = new TextField();
		public function AsExam4_6()
		{
            displayMain();
            drawBox(0);
            addEventHandlers();
		}
		// 컨트롤과 텍스트필드를 화면에 배치
		private function displayMain():void
		{
            this.addChild(nsRed);		
            this.addChild(nsGreen);
            this.addChild(nsBlue);
            nsGreen.x = 50;
            nsBlue.x = 100;
            nsRed.y = nsGreen.y = nsBlue.y = 10;
            this.addChild(tf);
            tf.y = 25;
		}
		
		private function addEventHandlers():void
		{
			nsRed.addEventListener("numberChanged", numberChangedHandler);
			nsGreen.addEventListener("numberChanged", numberChangedHandler);
			nsBlue.addEventListener("numberChanged", numberChangedHandler);
		}
		
		// 컨트롤의 값이 바뀌었을 때 실행될 함수
		private function numberChangedHandler(event:MouseEvent):void
		{
			// 16진수 값 계산
			var rVal:int = nsRed.selectedNumber << 16;
			var gVal:int = nsGreen.selectedNumber << 8;
			var bVal:int = nsBlue.selectedNumber;
			var rgb:int = rVal | gVal | bVal;
			trace(rgb.toString(16).toUpperCase());
			drawBox(rgb);
			tf.text = "0x" + nsRed.selectedNumber.toString(16).toUpperCase() 
			+ nsGreen.selectedNumber.toString(16).toUpperCase() + nsBlue.selectedNumber.toString(16).toUpperCase();
		}
		// 지정된 색상으로 박스를 그림
		private function drawBox(rgb:int):void 
		{
			this.graphics.clear();
			this.graphics.lineStyle(2, 0xCCCCCC);
			this.graphics.beginFill(rgb);
			this.graphics.drawRect(0, 45, 150, 150);
		}
	}
}