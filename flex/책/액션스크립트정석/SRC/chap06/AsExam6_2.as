package 
{
	import flash.display.Sprite;
	//각 도형별 클래스를 구현한 예제 
	public class AsExam6_2 extends Sprite 
	{
		public function AsExam6_2() 
		{
			// 원 그리기
			var circleSp:AsExam6_2_Circle = new AsExam6_2_Circle();
			this.addChild(circleSp);
		
			// 사각형 그리기
			var rectangleSp:AsExam6_2_Rectangle = new AsExam6_2_Rectangle();
			this.addChild(rectangleSp);
		
			// 삼각형 그리기 
			var triangleSp:AsExam6_2_Triangle = new AsExam6_2_Triangle();
			this.addChild(triangleSp);
		}		
	}
}