// 삼각형 그리기: AsExam6_8_Triangle 클래스
package 
{
	import flash.display.Sprite;
	public class AsExam6_8_Triangle extends Sprite implements IDrawable 
	{
		public function AsExam6_8_Triangle()
		{
		}
		// IDrawable의 인터페이스 함수를 구현함 		
		public function drawInf(inColor:uint):Sprite 
		{
			var triangleHeight:Number = 100;
			var n:Number = 0;
			this.graphics.beginFill(inColor);
			this.graphics.lineStyle(1, inColor, 1);
			this.graphics.moveTo(triangleHeight/2 + 150, n + 150); 
			this.graphics.lineTo(triangleHeight + 150, triangleHeight + 150);
			this.graphics.lineTo(n+150, triangleHeight+150); 
			this.graphics.lineTo(triangleHeight/2+150, n+150);
			return this;
		}		
	}
}