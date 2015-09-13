package 
{
	import flash.display.Sprite;
	// 다른 패키지에 있으므로 import 해야 함
	import comp.AsExam6_7_Circle;
	public class AsExam6_7 extends Sprite 
	{
		public function AsExam6_7() 
		{
			var circleSp:AsExam6_7_Circle = new AsExam6_7_Circle();
			this.addChild(circleSp);
			circleSp.draw(Math.random() * 0xffffff);
		}		
	}
}