// 원 그리기: AsExam6_8_Circle 클래스 
package 
{
	import flash.display.Sprite;
	public class AsExam6_8_Circle extends Sprite implements IDrawable 
	{
		public function AsExam6_8_Circle()
		{
		}
		// IDrawable의 인터페이스 함수를 구현함 
		public function drawInf(inColor:uint):Sprite 
		{
			this.graphics.beginFill(inColor);
			this.graphics.lineStyle(1, inColor, 1);
			this.graphics.drawCircle(100, 100, 50);		
			return this;			
		}
	}
} 