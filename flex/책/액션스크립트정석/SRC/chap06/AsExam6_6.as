package 
{
	//AsExam6_4를 상속 & 오버라이딩한 예제 
	public class AsExam6_6 extends AsExam6_4 
	{
		public function AsExam6_6() 
		{
		}		
		// 도형 그리는 순서가 바뀜
		override public function drawObject():void 
		{
			// 삼각형 그리기 
			var triangleSp:AsExam6_4_Triangle = new AsExam6_4_Triangle();
			this.addChild(triangleSp);
			triangleSp.draw(Math.random() * 0xffffff);			
			// 사각형 그리기
			var rectangleSp:AsExam6_4_Rectangle = new AsExam6_4_Rectangle();
			this.addChild(rectangleSp);
			rectangleSp.draw(Math.random() * 0xffffff);
			// 원 그리기
			var circleSp:AsExam6_4_Circle = new AsExam6_4_Circle();
			this.addChild(circleSp);
			circleSp.draw(Math.random() * 0xffffff);
		}
	}
}