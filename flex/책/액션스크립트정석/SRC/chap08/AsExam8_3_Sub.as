package
{
	import flash.display.Sprite;
	
	public class AsExam8_3_Sub extends Sprite
	{
		private var rad:int;
		public function AsExam8_3_Sub(rad:int)
		{
			this.rad = rad;
			drawMyCircle();
		}
		// 입력받은 반지름으로 랜덤한 색상의 원을 그린다.
		public function drawMyCircle():void
		{
			this.graphics.clear();
			this.graphics.lineStyle(.5, 0xFFFFFF);
	        this.graphics.beginFill(Math.random() * 0x1000000);
	        this.graphics.drawCircle(0, 0, rad);	   
		}
	}
}