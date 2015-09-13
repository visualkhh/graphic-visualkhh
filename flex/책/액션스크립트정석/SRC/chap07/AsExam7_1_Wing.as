package 
{
	import flash.display.Sprite;
	public class AsExam7_1_Wing extends Sprite 
	{
		// 색상값을 입력 받아 삼각형을 그림 
		public function AsExam7_1_Wing(inColor:int) 
		{
			var sp:Sprite = new Sprite();
			var triangleHeight:Number = 100;
			var triangleWidth:Number = 80;
			sp.graphics.beginFill(inColor);
			sp.graphics.lineStyle(.5, 0xFFFFFF, .8);
			sp.graphics.moveTo(triangleWidth/2,0); // 꼭지점 1
			sp.graphics.lineTo(triangleWidth, triangleHeight);// 꼭지점 2
			sp.graphics.lineTo(0, triangleHeight);// 꼭지점 3
			sp.graphics.lineTo(triangleWidth/2, 0);//다시 꼭지점 1으로			
			// 회전 중심을 잡기 위해 전체 폭의 절반만큼 좌로 이동함 
			sp.x = -sp.width/2;
			sp.y = 0;
			this.buttonMode = true;
			this.addChild(sp);
		}
	}
}