package
{
    import flash.display.Sprite;
    import flash.events.Event;
    [SWF(backgroundColor=0xFFFFFF)]
    public class AsExam11_56 extends Sprite
    {
        private var balls:Array = new Array();
        private var numBalls:Number = 20;
        // 이징 계수
        private var easing:Number = 0.2;
        // 공 사이 z 축 간격
        private var gap:Number = 150;
        
        public function AsExam11_56()
        {
        	displayMain();
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        // z 좌표값을 순서대로 설정하여 공을 추가한다.
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
        // 맨뒤에 추가된 공부터 움직인다.
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
        // 공을 지정된 xyz 좌표값으로 옮긴다.
        private function moveBall(myBall:MyBall, targetX:Number, targetY:Number, targetZ:Number):void
        {
            myBall.vx = (targetX - myBall.x) * easing;
            myBall.vy = (targetY - myBall.y) * easing;
            // z축은 공 사이에 gap만큼은 간격을 유지하도록 한다.
            myBall.vz = (targetZ + gap - myBall.z) * easing;
            myBall.x += myBall.vx;
            myBall.y += myBall.vy;
            myBall.z += myBall.vz;
        }
    }
}
