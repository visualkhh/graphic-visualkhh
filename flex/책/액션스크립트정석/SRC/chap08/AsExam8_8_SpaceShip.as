package 
{
	import flash.display.Sprite;
	
	public class AsExam8_8_SpaceShip extends Sprite 
	{
		public function AsExam8_8_SpaceShip() 
		{
			// 삼각형의 높이
			var triangleHeight:Number = 100;
			// 삼각형의 밑변 길이
			var triangleWidth:Number = 80;
			this.graphics.beginFill(Math.random() * 0x1000000);
			this.graphics.lineStyle(1, 0xFFFFFF);
			// 삼각형의 중심을 (0, 0)으로 잡기 위해 음수 좌표 영역부터 삼각형을 그린다.
			this.graphics.moveTo(0,-triangleHeight/2); // 꼭지점 1
			this.graphics.lineTo(triangleWidth/2, triangleHeight/2);// 꼭지점 2
			this.graphics.lineTo(-triangleWidth/2, triangleHeight/2);// 꼭지점 3
			this.graphics.lineTo(0,-triangleHeight/2);//다시 꼭지점 1으로			
		}
	}
}