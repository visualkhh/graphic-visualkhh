package
{
    import flash.display.Sprite;
    import flash.events.Event;
    [SWF(backgroundColor=0xFFFFFF)]
    public class AsExam11_57 extends Sprite
    {
        private var balls:Array = new Array();
        private var numBalls:Number = 20;
        // 공 사이 z 축 간격
        private var gap:Number = 100;        
        // 스프링 계수
        private var spring:Number = 0.05;
        // 저항 계수
        private var friction:Number = 0.8;
        // 중력 가속도
        private var gravity:Number = 1;
        
        public function AsExam11_57()
        {
        	displayMain();
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        
        private function displayMain():void
        {
            for(var i:uint = 0; i < numBalls; i++)
            {
                var ball:MyBall = new MyBall(20, Math.random()*0x1000000);
                ball.z += i*100;
                balls.push(ball);
            }
            // z좌표값이 적은 공이 위로 오도록 공들을 z좌표 내림차순으로 정렬하여 화면에 추가한다.
            balls.sortOn("z", Array.NUMERIC|Array.DESCENDING);
            for(var j:uint = 0; j< numBalls; j++)
            {
                this.addChild(balls[j]);
            }       
        }

        private function enterFrameHandler(event:Event):void
        {
            moveBall(balls[numBalls-1], mouseX, mouseY, -gap);
            for(var i:int = numBalls-1; i > 0; i--)
            {
                var ballA:MyBall = balls[i];
                var ballB:MyBall = balls[i-1];
                moveBall(ballB, ballA.x, ballA.y, ballA.z);
            }
        }
        // 공에 스프링 모션을 적용한다.
        private function moveBall(myBall:MyBall, targetX:Number, targetY:Number, targetZ:Number):void
        {
            myBall.vx += (targetX - myBall.x) * spring;
            myBall.vy += (targetY - myBall.y) * spring;
            myBall.vz += (targetZ - myBall.z + gap) * spring;           
            myBall.vz += gravity;
            myBall.vx *= friction;
            myBall.vy *= friction;
            myBall.vz *= friction;
            myBall.x += myBall.vx;
            myBall.y += myBall.vy;
            myBall.z += myBall.vz;
        }
    }
}
