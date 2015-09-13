package 
{
	import flash.display.Sprite;
	// for문으로 만든 기울어진 모니터 
	public class AsExam5_4 extends Sprite 
	{
		// 사각형의 초기 크기
		private var recSize:Number = 10;
		// 사각형의 처음 좌표   
		private var posX:Number = 300;
		private var posY:Number = 100;
		
		public function AsExam5_4()
		{
			displayMain();
		}
		// 사각형을 70개 그려준다.
		private function displayMain():void 
		{
			for(var i:uint=0; i<70; i++) 
			{
				// 사각형 Sprite객체 생성
				var sp:Sprite = new Sprite();
			    // 좌표를 2씩 감소
			    posX -= 2;
			    posY -= 2;
			    // 사각형 크기는 4씩 증가
				recSize +=4;
				sp.graphics.lineStyle(0.5, 0xFFFFFF, .8);
				sp.graphics.drawRect(5, 25, recSize, recSize);
				// 사각형을 15도 기울여 준다
				sp.rotation = 15;
			    sp.x = posX;
			    sp.y = posY;
				this.addChild(sp);	
			}
		}
	}
}