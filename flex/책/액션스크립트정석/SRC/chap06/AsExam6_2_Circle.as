package 
{
	import flash.display.Sprite;
	// 원 그리기
	public class AsExam6_2_Circle extends Sprite 
	{
		public function AsExam6_2_Circle()
		{
			this.graphics.beginFill(0xFF0000);
			this.graphics.lineStyle(1, 0xFF0000);
			this.graphics.drawCircle(100, 100, 50);			
		}
	}
}