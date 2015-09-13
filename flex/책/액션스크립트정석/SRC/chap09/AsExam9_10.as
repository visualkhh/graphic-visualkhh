package 
{
	import flash.display.Sprite;
	[SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
	public class AsExam9_10 extends Sprite 
	{
		public function AsExam9_10()	
		{
			drawLines();									
		}
		// 직선을 80가닥 비스듬하게 그린다.
		private function drawLines():void 
		{
			for(var i:int=0; i<80; i++) 
			{
				// 직선의 굵기, 색상, 투명도는 랜덤하게 생성한다.
				this.graphics.lineStyle(Math.random()*10, Math.random() * 0x1000000, Math.random());
				// 직선은 20픽셀씩 증가한다.
				// 직선을 비스듬하게 하기 위하여 시작점을 왼쪽으로 400 픽셀 옮긴다. 
				this.graphics.moveTo(i*20- 400, 0);
				this.graphics.lineTo(i*20, 800);			
			}
		}
	}
}