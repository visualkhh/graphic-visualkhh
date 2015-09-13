package 
{
	import flash.display.Sprite;
	// 삼각형 그리기 
	public class AsExam6_2_Triangle extends Sprite 
	{
		public function AsExam6_2_Triangle()
		{
			var triangleHeight:Number = 100;
			var n:Number = 0;
			this.graphics.beginFill(0x0000FF);
			this.graphics.lineStyle(1, 0x0000FF, 1);
			this.graphics.moveTo(triangleHeight/2 + 150, n + 150); // 꼭지점 1
			this.graphics.lineTo(triangleHeight + 150, triangleHeight + 150);// 꼭지점 2
			this.graphics.lineTo(n+150, triangleHeight+150);// 꼭지점 3
			this.graphics.lineTo(triangleHeight/2+150, n+150);//다시 꼭지점 1으로  				
		}
	}
}