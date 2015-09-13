package
{
	import flash.display.Sprite;

	public class AsExam2_5 extends Sprite
	{
		public function AsExam2_5()
		{
            // 직선의 색상과 두께 지정
            this.graphics.lineStyle(3, 0xFF0000);       
            // 직선 그리기 시작점을 (100, 100)으로 이동
            this.graphics.moveTo(100, 100);
            // 꼭지점 (200, 200), (200, 100), (100, 100)인 삼각형 그리기
            this.graphics.lineTo(200, 200); 			
            this.graphics.lineTo(200, 100);
            this.graphics.lineTo(100, 100);
		}
	}
}