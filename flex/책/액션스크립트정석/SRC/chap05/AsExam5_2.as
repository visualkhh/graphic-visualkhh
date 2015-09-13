package {
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	// switch 문을 이용한 주사위 그리기 
	public class AsExam5_2 extends Sprite 
	{
		// 주사위 면을 위한 Sprite 클래스  
		private var diceSpr:Sprite = new Sprite();
		public function AsExam5_2() 
		{
			displayMain();
			addEventHandlers();
		}
		
		private function displayMain():void
		{
			this.addChild(diceSpr);
			// 주사위 모양을 그려주는 함수 호출
			drawDice();
		}
		
		private function addEventHandlers():void
		{
			// 마우스를 클릭하면 주사위 모양을 그려주는 함수가 호출되도록 함
			diceSpr.addEventListener(MouseEvent.CLICK, drawDice);
		}
		
		// 입력 파라미터가 없으면 null값으로 입력되도록 파라미터를 세팅 
		private function drawDice(event:MouseEvent=null):void 
		{
			// 1 ~ 6 까지의 난수 발생 
			var diceNumber:uint = Math.random()*6 + 1;
			// 이전의 주사위 그림을 지워줌 
			diceSpr.graphics.clear();
			diceSpr.graphics.lineStyle();
			// 하얀 면을 그려줌
			diceSpr.graphics.beginFill(0xFFFFFF);
			diceSpr.graphics.drawRect(25, 25, 70, 70);
			diceSpr.graphics.endFill();
			diceSpr.graphics.beginFill(0x0000FF);
			// 주사위 값에 따라 점을 그려 줌 
			switch(diceNumber) {
				case 1:
					diceSpr.graphics.drawCircle(60, 60, 5);
					break;
				case 2:
					diceSpr.graphics.drawCircle(40, 40, 5);
					diceSpr.graphics.drawCircle(80, 80, 5);
					break;
				case 3:
					diceSpr.graphics.drawCircle(40, 40, 5);
					diceSpr.graphics.drawCircle(60, 60, 5);
					diceSpr.graphics.drawCircle(80, 80, 5);						
					break;					
				case 4:
					diceSpr.graphics.drawCircle(40, 40, 5);
					diceSpr.graphics.drawCircle(40, 80, 5);
					diceSpr.graphics.drawCircle(80, 40, 5);	
					diceSpr.graphics.drawCircle(80, 80, 5);	
					break;													
				case 5:
					diceSpr.graphics.drawCircle(40, 40, 5);
					diceSpr.graphics.drawCircle(80, 40, 5);		
					diceSpr.graphics.drawCircle(60, 60, 5);				
					diceSpr.graphics.drawCircle(40, 80, 5);
					diceSpr.graphics.drawCircle(80, 80, 5);	
					break;											
				case 6:
					diceSpr.graphics.drawCircle(40, 40, 5);
					diceSpr.graphics.drawCircle(40, 60, 5);
					diceSpr.graphics.drawCircle(40, 80, 5);
					diceSpr.graphics.drawCircle(80, 40, 5);	
					diceSpr.graphics.drawCircle(80, 60, 5);													
					diceSpr.graphics.drawCircle(80, 80, 5);
					break;
			} 
		}
	}
}