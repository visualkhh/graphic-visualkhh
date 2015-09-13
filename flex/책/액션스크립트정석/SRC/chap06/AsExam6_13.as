package 
{
	import flash.display.Sprite;
	public class AsExam6_13 extends Sprite 
	{
		public function AsExam6_13()
		{
			var sp:Sprite = new Sprite();
			trace("x" in sp); // true 
			trace("y" in sp); // true 
			trace("z" in sp); // false
			var okgosuArr:Array = ["okgosu.net", "okgosu.tistory.com"];
			trace(0 in okgosuArr); // true
			trace(1 in okgosuArr); // true
			trace(2 in okgosuArr); // false
			// okgosuArr의 모든 원소 출력 
			for each (var k:String in okgosuArr) 
			{
				trace(k);
			}
		}
	}
}