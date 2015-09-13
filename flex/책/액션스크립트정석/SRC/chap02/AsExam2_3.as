package
{
	import flash.display.Sprite;

	public class AsExam2_3 extends Sprite
	{
		public function AsExam2_3()
		{
            // 사각형의 테두리선 두께, 색상 지정
            this.graphics.lineStyle(3, 0x0000FF);
            //사각형의 색상 지정
            this.graphics.beginFill(0xF7F794);  
            //사각형 그리기 시작 좌표와 가로, 세로 설정
            this.graphics.drawRect(100, 100, 150, 150);  			
		}
		
	}
}