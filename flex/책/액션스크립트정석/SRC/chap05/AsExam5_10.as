package {
	import flash.display.Sprite;
	// 재귀 패턴으로 그린 암모나이트 문양 
	public class AsExam5_10 extends Sprite 
	{
		// 각 사각형의 각도를 저장하는 변수
		private var degree:Number = 0;
		// 사각형의 크기
		private var size:Number = 150;
		
		public function AsExam5_10()
		{
			displayMain();
		}
		// 재귀 패턴으로 각도가 360도가 되면 재귀를 멈춘다 
	   private function displayMain():void 
	   {
			if(degree>360) return; //재귀패턴이 끝나는 로직 
			var sp:Sprite = new Sprite();
			sp.graphics.lineStyle(1, 0x0000FF, .8);
			sp.graphics.drawRect(15, 15, size, size);
			sp.rotation = degree;
		    sp.x = 200;
		    sp.y = 150;
		    degree += 4; //사각형을 4도씩 기울여서 그린다
		    size--;// 사각형 사이즈는 1씩 감소 시킨다 
			this.addChild(sp);	
			displayMain();//함수의 끝에서 자신을 다시 호출한다 
		}
	}
}