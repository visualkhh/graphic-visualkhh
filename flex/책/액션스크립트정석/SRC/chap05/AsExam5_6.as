package {
	import flash.display.Sprite;
	//while과 분기문으로 만든 부채꼴
	public class AsExam5_6 extends Sprite 
	{
		// 각도
		private var degree:Number = 0;
		// 사각형 크기
		private var recSize:Number = 180;
		
		public function AsExam5_6()
		{
			displayMain();
		}
		// 각도가 360도에 이를 때 까지 그려준다. 
		// 사각형의 크기가 마이너스가 되면 원래 크기로 복원하고 다시 반복 로직을 수행함
		private function displayMain():void 
		{
			while(degree <= 360) 
			{
			    degree += 4;
			    recSize -= 4;
			    if(recSize < 0) 
			    { 
			    	recSize = 180;
			    	continue;  // break를 쓰면 반복문을 완전히 빠져 나간다.
			    }
				var sp:Sprite = new Sprite();
				sp.graphics.lineStyle(.5, 0xFFFFFF, .8);
				sp.graphics.beginFill(0x00FF00, 0.3);
				sp.graphics.drawRect(5, 5, recSize, recSize);
				sp.rotation = degree;
			    sp.x = 200;
			    sp.y = 200;
				this.addChild(sp);	
			}
		}
	}
}