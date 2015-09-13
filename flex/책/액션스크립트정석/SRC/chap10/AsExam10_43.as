package
{
	[SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
	public class AsExam10_43 extends AsExam10_42
	{
		public function AsExam10_43()
		{
			super();
		}
		
		override protected function displayMain():void
		{
			// 질량을 20~30사이로 
            var m1:Number = Math.random()*10 + 20;
            // 질량 크기에 따라 공의 반지름 설정
            myBall1 = new MyBall(m1, 0xFF0000);
            this.addChild(myBall1);
            myBall1.x = stage.stageWidth/2 - 100;
            myBall1.y = stage.stageHeight/2;
            myBall1.m = m1;
            myBall1.vx = 5;
            // 질량을 10~20사이로
            var m2:Number = Math.random()*10 + 10;
            myBall2 = new MyBall(m2, 0x0000FF);
            this.addChild(myBall2);
            myBall2.x = stage.stageWidth/2 + 100;
            myBall2.y = stage.stageHeight/2;
            myBall2.m = m2;
            myBall2.vx = -5;
		}
	}
}