package {
	import flash.display.Sprite;
	//그라데이션을 위한 클래스 import
	import flash.display.GradientType;
	//그라데이션 계산을 위한 행렬(Matrix)클래스 import 
	import flash.geom.Matrix;	
	
	public class AsExam3_2 extends Sprite 
	{
		public function AsExam3_2()	
		{
			//무지개를 그려주는  함수 호출 
			drawRainbow();
		}
		private function drawRainbow():void 
		{
			//무지개를 그리기 위한 화면 객체 생성 
			var myRainbow:Sprite = new Sprite();
			//행렬 객체 생성
			var gradientBoxMatrix:Matrix = new Matrix();
			//그라데이션 값 생성 
			gradientBoxMatrix.createGradientBox(150, 0, 0, 25, 0);
			//myRainbow화면에 직선 방향의 사각형 그라데이션 그리기 시작
			myRainbow.graphics.beginGradientFill(GradientType.LINEAR, 
			   [0xff0000, 0xffa500, 0xffff00, 0x008000, 0x0000ff, 0x4B0082, 0x800080], 
			   [1, 1, 1, 1, 1, 1, 1], 
			   [0, 32, 64, 128, 170, 210, 255], 
			gradientBoxMatrix);
			//설정한 그라데이션 정보로 가로 세로 150픽셀의 사각형 그리기  
			myRainbow.graphics.drawRect(0, 0, 150, 150);
			//색상 채우기 종료
			myRainbow.graphics.endFill();
			//그라데이션 사각형을 화면에 보이도록 추가함 
			this.addChild(myRainbow); 
		}
	}
}
