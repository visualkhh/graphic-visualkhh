package 
{
	import flash.display.Sprite;
	// 사각형 그리기
	public class AsExam6_2_Rectangle extends Sprite 
	{
		public function AsExam6_2_Rectangle()
		{
			this.graphics.beginFill(0x00FF00);
			this.graphics.lineStyle(1, 0x00FF00, 1);
			this.graphics.drawRect(100, 100, 100, 100);			
		}
	}
}