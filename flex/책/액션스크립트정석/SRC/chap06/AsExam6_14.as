package 
{
	import flash.display.Sprite;
	public class AsExam6_14 extends Sprite 
	{
		public function AsExam6_14()
		{
			trace(this.stage.frameRate);
			var sp1:AsExam6_8_Circle = new AsExam6_8_Circle();
			classTypeCheck1(sp1); // object
			classTypeCheck2(sp1); // object
			var sp2:Sprite = new Sprite();
			classTypeCheck1(sp2); // object
			// classTypeCheck2(sp2); // 
			// 에러 발생 : 정적 유형 flash.display:Sprite의 값을 관련되지 않은 유형 OkGosuCircle_3(으)로 암시적으로 강제 변환하려고 했습니다.	
		}
		
		static private function classTypeCheck1(p:Object):void 
		{
			trace(typeof p);
		}
		
		static private function classTypeCheck2(p:AsExam6_8_Circle):void 
		{
			trace(typeof p);
		}
	}
}