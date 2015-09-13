package 
{
	import flash.display.Sprite;

	//각 도형별 클래스를 구현한 예제 
	public class AsExam6_4 extends Sprite 
	{
		public function AsExam6_4() 
		{
			drawObject();			
		}		
		
		public  function drawObject():void 
		{
			// 원 그리기
			var circleSp:AsExam6_4_Circle = new AsExam6_4_Circle();
			this.addChild(circleSp);
			circleSp.draw(Math.random() * 0xffffff);
			// 사각형 그리기
			var rectangleSp:AsExam6_4_Rectangle = new AsExam6_4_Rectangle();
			this.addChild(rectangleSp);
			rectangleSp.draw(Math.random() * 0xffffff);
			// 삼각형 그리기 
			var triangleSp:AsExam6_4_Triangle = new AsExam6_4_Triangle();
			this.addChild(triangleSp);
			triangleSp.draw(Math.random() * 0xffffff);
			//trace(circleSp.myColor);			
		}
	}
}