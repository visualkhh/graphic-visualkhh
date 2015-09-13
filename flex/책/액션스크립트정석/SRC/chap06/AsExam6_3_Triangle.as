package
{
	import flash.display.Sprite;
	// 삼각형 그리기 
	public class AsExam6_3_Triangle extends Sprite 
	{
		// 색상값을 저장하는 변수 
		private var myColor:uint;		
		// 색상값을 입력받는 생성자 함수 
		public function AsExam6_3_Triangle(inColor:uint)
		{
			myColor = inColor; //입력받은 색상값을 저장한다
			var triangleHeight:Number = 100;
			var n:Number = 0;
			this.graphics.beginFill(myColor);
			this.graphics.lineStyle(1, myColor, 1);
			this.graphics.moveTo(triangleHeight/2 + 150, n + 150); // 꼭지점 1
			this.graphics.lineTo(triangleHeight + 150, triangleHeight + 150);// 꼭지점 2
			this.graphics.lineTo(n+150, triangleHeight+150);// 꼭지점 3
			this.graphics.lineTo(triangleHeight/2+150, n+150);//다시 꼭지점 1으로  				
		}		
	}
}