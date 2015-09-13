package 
{
    import flash.display.Sprite;
    
	[SWF(backgroundColor=0xFFFFFF)]
	public class AsExam9_15 extends Sprite 
	{
		public function AsExam9_15() 
		{
			// AsExam9_15_MyBall을 반지름 100, 랜덤한 색상으로 생성하여 화면에 추가한다.
            var ball:AsExam9_15_MyBall = new AsExam9_15_MyBall(100, Math.random()*0x1000000);
            ball.x = ball.y = 150;
            this.addChild(ball);
		}
	}
}

