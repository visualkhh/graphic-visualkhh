package 
{
	import flash.display.Sprite;
	//절차적 프로그래밍으로 구현한 예제
	public class AsExam6_1 extends Sprite 
	{
		public function AsExam6_1() 
		{
			// 원 그리기
			this.graphics.beginFill(0xFF0000);
			this.graphics.lineStyle(1, 0xFF0000, 1);
			this.graphics.drawCircle(100, 100, 50);
			// 사각형 그리기
			this.graphics.beginFill(0x00FF00);
			this.graphics.lineStyle(1, 0x00FF00, 1);
			this.graphics.drawRect(100, 100, 100, 100);
			// 삼각형 그리기 
			var triangleHeight:Number = 100;
			var n:Number = 0;
			this.graphics.beginFill(0x0000FF);
			this.graphics.lineStyle(1, 0x0000FF, 1);
			this.graphics.moveTo(triangleHeight/2 + 150, n + 150); // 꼭지점 1
			this.graphics.lineTo(triangleHeight + 150, triangleHeight + 150);// 꼭지점 2
			this.graphics.lineTo(n+150, triangleHeight+150);// 꼭지점 3
			this.graphics.lineTo(triangleHeight/2+150, n+150);//다시 꼭지점 1으로  		
		}		
	}
}