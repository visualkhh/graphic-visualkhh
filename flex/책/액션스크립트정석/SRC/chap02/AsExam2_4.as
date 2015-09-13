package
{
	import flash.display.Sprite;

	public class AsExam2_4 extends Sprite
	{
		public function AsExam2_4()
		{
            // 직선의 색상과 두께 지정
            this.graphics.lineStyle(3, 0xFF0000);		
            // 직선 그리기 시작점을 (100, 100)으로 이동
            this.graphics.moveTo(100, 100);
            // 좌표 (200, 200)까지 직선 그리기
            this.graphics.lineTo(200, 200);	
		}
	}
}