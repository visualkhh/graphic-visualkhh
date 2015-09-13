// 사각형 그리기: AsExam6_4_Rectangle 클래스
package 
{
	import flash.display.Sprite;
	public class AsExam6_4_Rectangle extends Sprite 
	{
		// 색상값을 저장하는 변수 
		private var myColor:uint;
		// 색상값을 입력받는 생성자 함수 		
		public function AsExam6_4_Rectangle()
		{
		}		
		public function draw(inColor:uint):void 
		{
			myColor = inColor; //입력받은 색상값을 저장한다
			this.graphics.beginFill(myColor);
			this.graphics.lineStyle(1, myColor, 1);
			this.graphics.drawRect(100, 100, 100, 100);					
		}	
	}
}