package {
	import flash.display.Sprite;
	//추가된 화면의 겹침을 제어하기 위한 클래스 import
	import flash.display.BlendMode;
	// 삼각형과 역삼각형을 그려주는 예제 클래스 
	[SWF(backgroundColor = 0x000000)]
	public class AsExam3_1 extends Sprite 
	{
		// 삼각형의 높이 값 		
		private var triangleHeight:uint = 100;
		// 삼각형과 역삼각형간 거리 
		private var distance:uint=30;
		public function AsExam3_1()	
		{
			// 정삼각형 그리기
			addTriangle();
			// 역삼각형 그리기 
			addRetroTriangle();
		}
		// 삼각형 그리기
		private function addTriangle():void 
		{
			// 블랜딩을 표현하기위해 새로운 Sprite 객체를 만들어 화면에 추가한다.
			var triangle:Sprite = new Sprite();
			triangle.graphics.beginFill(0xFF0000);
			// 꼭지점 1
			triangle.graphics.moveTo(triangleHeight/2, 0); 
			// 꼭지점 2
			triangle.graphics.lineTo(triangleHeight, triangleHeight);
			// 꼭지점 3
			triangle.graphics.lineTo(0, triangleHeight);
			// 다시 꼭지점 1으로 
			triangle.graphics.lineTo(triangleHeight/2, 0);		
			// 그래픽이 겹칠 때 서로 밝게 비치도록 함 
			triangle.blendMode = BlendMode.LIGHTEN;
			this.addChild(triangle);
		}
		// 역삼각형 그리기 
		private function addRetroTriangle():void 
		{			
			// 블랜딩을 표현하기위해 새로운 Sprite 객체를 만들어 화면에 추가한다.
			var triangle2:Sprite = new Sprite();
			triangle2.graphics.beginFill(0x00FF00);
			// 꼭지점 1
			triangle2.graphics.moveTo(0, distance);
			// 꼭지점 2
			triangle2.graphics.lineTo(triangleHeight, distance);
			// 꼭지점 3
			triangle2.graphics.lineTo(triangleHeight/2, triangleHeight+distance);
			// 다시 꼭지점 1으로 
			triangle2.graphics.lineTo(0, distance); 
			// 그래픽이 겹칠 때 서로 밝게 비치도록 함 
			triangle2.blendMode = BlendMode.LIGHTEN;
			this.addChild(triangle2);
		}
	}
}
