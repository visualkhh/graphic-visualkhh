package
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    
    [SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
    public class AsExam10_42 extends Sprite
    {
        protected var myBall1:MyBall = new MyBall(20, 0xFF0000);
        protected var myBall2:MyBall = new MyBall(20, 0x0000FF);
        private var eNum:Number = 1;
        
        public function AsExam10_42()
        {
        	displayMain();
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        // myBall1, myBall2를 화면에 추가하고 vx값을 서로 반대로 설정하여 충돌하도록 함
        protected function displayMain():void
        {
            this.addChild(myBall1);
            myBall1.x = stage.stageWidth/2 - 100;
            myBall1.y = stage.stageHeight/2;
            myBall1.m = 10;
            myBall1.vx = 5;
            this.addChild(myBall2);
            myBall2.x = stage.stageWidth/2 + 100;
            myBall2.y = stage.stageHeight/2;
            myBall2.m = 10;
            myBall2.vx = -5;
        }
        // myBall1과 myBall2의 모션과 충돌 처리
        private function enterFrameHandler(event:Event):void
        {
            if(myBall1.hitTestObject(myBall2)) 
            {
                processCollision();
            }           
            moveBall(myBall1);
            moveBall(myBall2);
        }
        // 초기 속도에 따라 공을 움직인다.
        private function moveBall(myBall:MyBall):void
        {
            var left:Number = 0;
            var right:Number = stage.stageWidth;            
            myBall.y += myBall.vy;
            myBall.x += myBall.vx;
            // 좌, 우 경계면 감지
            if(myBall.x + myBall.radius > right)
            {
                myBall.x = right - myBall.radius;
                myBall.vx *= -1;
            }
            else if(myBall.x - myBall.radius < left)
            {
                myBall.x = left + myBall.radius;
                myBall.vx *= -1;
            }           
        }
        // myBall의 m 값에 따라 충돌후 속도를 계산한다.
        private function processCollision():void
        {
            var massTotal:Number = myBall1.m + myBall2.m;
            var myBall1_vx_col:Number = (myBall1.m - myBall2.m*eNum)/massTotal*myBall1.vx+(myBall2.m+myBall2.m*eNum)/massTotal*myBall2.vx;
            var myBall2_vx_col:Number = (myBall1.m + myBall1.m*eNum)/massTotal*myBall1.vx+(myBall2.m-myBall1.m*eNum)/massTotal*myBall2.vx;
            myBall1.vx = myBall1_vx_col;
            myBall2.vx = myBall2_vx_col;
        }
    }
}