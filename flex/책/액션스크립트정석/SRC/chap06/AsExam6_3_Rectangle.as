package 
{
	import flash.display.Sprite;
	// 사각형 그리기
	public class AsExam6_3_Rectangle extends Sprite 
	{
		// 색상값을 저장하는 변수 
		private var myColor:uint;
		// 색상값을 입력받는 생성자 함수 		
		public function AsExam6_3_Rectangle(inColor:uint)
		{
			myColor = inColor; //입력받은 색상값을 저장한다
			this.graphics.beginFill(myColor);
			this.graphics.lineStyle(1, myColor, 1);
			this.graphics.drawRect(100, 100, 100, 100);		
		}		
	}
}