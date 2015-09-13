package {
	import flash.display.Sprite;
	// while 문으로 만든 미스테리서클 
	public class AsExam5_5 extends Sprite 
	{
		private var degree:Number = 0;
		public function AsExam5_5()
		{
			displayMain();
		}
		// 사각형을 4도씩 돌려가며 90회 (360/4)를 그려준다. 
		private function displayMain():void 
		{
			while(degree <= 360) 
			{
			    degree += 4;
				var sp:Sprite = new Sprite();
				sp.graphics.lineStyle(1, 0xFFFFFF, .8);
				sp.graphics.drawRect(25, 25, 100, 100);
				sp.rotation = degree;
			    sp.x = 200;
			    sp.y = 200;
				this.addChild(sp);	
			}
		}
	}
}