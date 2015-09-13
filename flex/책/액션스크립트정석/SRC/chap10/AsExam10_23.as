package
{
    import flash.display.Sprite;
    import flash.events.Event;
    [SWF(backgroundColor=0xFFFFFF)]
    public class AsExam10_23 extends Sprite
    {
        private var ballsArr:Array = new Array();
        private var numBalls:Number = 10;
        // 스프링값이 커지면 반동이 심해진다.
        private var spring:Number = 0.05;
        // 저항계수도 낮춰줘야 자연스러운 모션이 만들어진다.
        private var friction:Number = 0.8;
        private var gravity:Number = 1;
        
        public function AsExam10_23()
        {
        	displayMain();
        	addEventHandlers();
        }
        // numBalls 갯수만큼 공을 생성하여 화면에 추가한다.
        private function displayMain():void
        {
            for(var i:uint = 0; i < numBalls; i++)
            {
                var ball:MyBall = new MyBall(10, Math.random()*0x1000000);
                this.addChild(ball);
                ballsArr.push(ball);
            }
        }
        
        private function addEventHandlers():void
        {
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        // 마우스가 움직이면 ballsArr의 공에 스프링을 적용하여 차례대로 움직인다. 
        private function enterFrameHandler(event:Event):void
        {
        	// 마우스와 공 사이를 잇는 선을 그린다.
            this.graphics.clear();
            this.graphics.lineStyle(1, 0xFF0000);
            this.graphics.moveTo(stage.mouseX, stage.mouseY);
            this.graphics.lineTo(ballsArr[numBalls-1].x, ballsArr[numBalls-1].y);
            moveBall(ballsArr[numBalls-1], stage.mouseX, stage.mouseY);
            for(var i:uint = numBalls-1; i > 0; i--)
            {
                var ballA:MyBall = ballsArr[i];
                var ballB:MyBall = ballsArr[i-1];
                moveBall(ballB, ballA.x, ballA.y);
            }
        }
        // 스프링, 중력가속도, 저항계수를 적용하여 공을 움직인다.
        private function moveBall(myBall:MyBall, targetX:Number, targetY:Number):void
        {
        	// 공사이를 잇는 선을 그린다.
            this.graphics.lineTo(myBall.x, myBall.y);
            myBall.vx += (targetX - myBall.x) * spring;
            myBall.vy += (targetY - myBall.y) * spring;
            myBall.vy += gravity;
            myBall.vx *= friction;
            myBall.vy *= friction;
            myBall.x += myBall.vx;
            myBall.y += myBall.vy;
        }
    }
}
