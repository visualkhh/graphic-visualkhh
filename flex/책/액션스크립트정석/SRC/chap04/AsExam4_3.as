package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
    [SWF(backgroundColor=0xFFFFFF)]
	public class AsExam4_3 extends Sprite
	{
		// 체크박스 2개 선언
		private var cb1:AsExam8_CheckBox = new AsExam8_CheckBox("", "cb1");
		private var cb2:AsExam8_CheckBox = new AsExam8_CheckBox("둘다 체크하세요.", "cb2");
		public function AsExam4_3()
		{
			// 꺼진 전구 그리기
			turnOff();
			displayMain();
			addEventHandlers();
		}
        // 체크박스를 화면에 추가		
		private function displayMain():void
		{
			this.addChild(cb1);
			this.addChild(cb2);
			cb1.x = 80;
			cb2.x = 100;
			cb1.y = cb2.y = 70;
		}
		// 체크박스를 체크했을 때 clickHandler 함수가 실행
		private function addEventHandlers():void
		{
		  cb1.addEventListener("checkboxChecked", clickHandler);
		  cb2.addEventListener("checkboxChecked", clickHandler);
		}
		// && 연산으로 두 체크박스의 값에 따라 전구를 켜고 끔  
		private function clickHandler(event:MouseEvent):void
		{
			if(cb1.checkboxEnabled && cb2.checkboxEnabled)
			{
				turnOn();
			}  
			else
			{
				turnOff();
			}
		}
		// 불 켜진 전구 그리기 
		private function turnOn():void
		{
			this.graphics.clear();
			this.graphics.lineStyle(3, 0x000000);
			this.graphics.beginFill(0xFFFF00);
			this.graphics.drawCircle(100, 40, 25);
			this.graphics.endFill();
			drawFilament();
		}
        // 불 꺼진 전구 그리기
        private function turnOff():void
        {
            this.graphics.clear();
            this.graphics.lineStyle(3, 0x000000);
            this.graphics.drawCircle(100, 40, 25);        
            drawFilament();
        }
        // 지그재그로 필라멘트 모양 그리기 
        private function drawFilament():void
        {
            this.graphics.moveTo(75, 40);    
            this.graphics.lineTo(80, 35);
            this.graphics.lineTo(85, 40);
            this.graphics.lineTo(90, 35);
            this.graphics.lineTo(95, 40);
            this.graphics.lineTo(100, 35);
            this.graphics.lineTo(105, 40);
            this.graphics.lineTo(110, 35);
            this.graphics.lineTo(115, 40);
            this.graphics.lineTo(120, 35);
            this.graphics.lineTo(125, 40);
        }
	}
}