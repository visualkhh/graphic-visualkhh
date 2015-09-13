package 
{
	import flash.display.Sprite;
	[SWF(backgroundColor=0xFFFFFF)]
	public class AsExam2_1 extends Sprite 
	{
		public function AsExam2_1()	
		{
		    //원의 색상 지정 
		    this.graphics.beginFill(0xC6DB94);  
			//원그리기 시작 좌표와 반지름 설정
			this.graphics.drawCircle(100, 100, 50);  
		}
	}
}