package 
{
	import flash.display.Sprite;
	public class AsExam6_12 extends Sprite 
	{
		public function AsExam6_12()
		{
			var sp:AsExam6_8_Circle = new AsExam6_8_Circle();
 			trace(sp is AsExam6_8_Circle);// true
			trace(sp instanceof AsExam6_8_Circle);// true
			trace(sp is Sprite);// true
			trace(sp instanceof Sprite);// true
			trace(sp is Object); // true
			trace(sp instanceof Object);// true
			trace(sp is IDrawable); // true
			trace(sp instanceof IDrawable);// instanceof는 interface에 대해 false를 리턴 
			trace(sp is Boolean); // false
			trace(false is Boolean); // true 
		}
	}
}