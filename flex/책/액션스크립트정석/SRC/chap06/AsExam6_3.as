package 
{
	import flash.display.Sprite;
	//각 도형별 클래스를 구현한 예제 
	public class AsExam6_3 extends Sprite 
	{
		public function AsExam6_3() 
		{
			// 원 그리기
			var circleSp:AsExam6_3_Circle = new AsExam6_3_Circle(Math.random() * 0xffffff);
			this.addChild(circleSp);
			// 사각형 그리기
			var rectangleSp:AsExam6_3_Rectangle = new AsExam6_3_Rectangle(Math.random() * 0xffffff);
			this.addChild(rectangleSp);
			// 삼각형 그리기 
			var triangleSp:AsExam6_3_Triangle = new AsExam6_3_Triangle(Math.random() * 0xffffff);
			this.addChild(triangleSp);
		}		
	}
}