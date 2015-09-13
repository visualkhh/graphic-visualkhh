package {
	import flash.display.Sprite;
			
	public class AsExam3_6 extends Sprite 
	{
		// static으로 선언한 색상값 변수 
		public static var randomColor:uint;
		// 인스턴스 변수 
		public var radius:uint;
		// AsExam3_6의 생성자 함수, 파라미터 값이 없으면 100, 100이 초기값 
		public function AsExam3_6(px:int=100, py:int=100)
		{
			// Math함수를 이용하여 랜덤한 색상값을 만들어 낸다 
			randomColor = Math.random() * 0x1000000;
			// 반지름은 100보다 적은 랜덤값으로 설정 
			radius = 100 * Math.random();
		    this.graphics.beginFill(randomColor);
		    // 파라미터로 받은 좌표값에 랜덤한 원을 그려줌 
			this.graphics.drawCircle(px, py, radius);  
		}
	}
}