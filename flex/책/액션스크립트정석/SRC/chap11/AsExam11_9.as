package 
{
    import flash.display.Sprite;
    import flash.events.Event;
    [SWF(width=800, height=600, backgroundColor=0xffffff)]
    public class AsExam11_9 extends Sprite
    {
        // 공을 담을 배열
        private var ballsArr:Array=new Array();
        // 공의 갯수
        private var numBalls:uint = 100;
        // 공들을 담을 컨테이너
        private var sp:Sprite = new Sprite();
        // 화면의 중앙 좌표
        private var baseX:Number = stage.stageWidth/2;
        private var baseY:Number = stage.stageHeight/2;
        private var baseZ:Number = 500;
        
        public function AsExam11_9()
        {
        	displayMain();
            createBalls();  
            stage.addEventListener(Event.ENTER_FRAME, enterframeHandler);
        }
        // sp를 화면에 배치한다.
        private function displayMain():void
        {
            this.addChild(sp);
            sp.x = baseX/2;
            sp.y = baseY;
            sp.z = 0;
        }
        // 공 100개를 생성하여 sp와 ballsArray에 추가한다.
        private function createBalls():void 
        {
            for(var i:int = 0; i < numBalls; i++)
            {
                var ball:MyBall = new MyBall(15, Math.random()*0x1000000);
                // 랜덤함수를 사용하여 공을 화면에 골고루 분산시킨다.
                ball.x = Math.random() * baseX;
                ball.y = Math.random() * baseY/2;
                //ball.z = Math.random() * baseZ;
                ball.z = Math.random() * baseZ - baseZ/2;
                ballsArr.push(ball);
                sp.addChild(ball);
            }
        }
        // 마우스의 위치에 따라 sp가 x축 방향으로 회전하도록 한다.
        private function enterframeHandler(event:Event):void
        {
            sp.rotationX = (stage.stageHeight/2 - mouseY);
        }           
    }
}
