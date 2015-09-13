package 
{
	import flash.display.Sprite;
	public class AsExam6_8 extends Sprite 
	{
		public function AsExam6_8() 
		{
			// 삼각형 그리기 
			var triangleSp:IDrawable = new AsExam6_8_Triangle();
			//var triangleSp:AsExam6_8_Triangle = new AsExam6_8_Triangle();
			this.addChild(triangleSp.drawInf(Math.random() * 0xffffff));			

			// 사각형 그리기
			var rectangleSp:IDrawable = new AsExam6_8_Rectangle();
			this.addChild(rectangleSp.drawInf(Math.random() * 0xffffff));

			// 원 그리기
			var circleSp:IDrawable = new AsExam6_8_Circle();
			this.addChild(circleSp.drawInf(Math.random() * 0xffffff));
		}		
	}
}