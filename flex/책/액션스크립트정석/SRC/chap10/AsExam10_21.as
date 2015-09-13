package
{
    import flash.display.Sprite;
    import flash.events.Event;
    [SWF(backgroundColor=0xFFFFFF)]
    public class AsExam10_21 extends Sprite
    {
        private var myBall:MyBall = new MyBall();
        
        // x축 속도
        private var vx:Number = 0;
        // x축 가속도 
        private var ax:Number = 0;        
        // spring 계수
        private var spring:Number = 0.2;
        // spring 목표치 
        private var springTarget:Number = 200;
        // 저항 계수
        private var friction:Number = 0.95;

        public function AsExam10_21()
        {
            myBall.y = springTarget;
            this.addChild(myBall);
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        // 저항계수를 적용한 스프링 모션
        private function enterFrameHandler(event:Event):void
        {
        	// 스프링 목표치를 마우스의 X좌표로 설정한다.
            springTarget = stage.mouseX;
            // 가속도에 스프링을 설정한다.
            ax = (springTarget - myBall.x) * spring;
            // 가속도를 속도에 더한다.
            vx += ax;
            // 속도에 저항계수를 곱한다.
            vx *= friction;
            myBall.x += vx; 
            drawBallLine(mouseX, mouseY);
        }               
        // 마우스와 공의 위치를 잇는 직선을 그린다.
        private function drawBallLine(xPos:Number, yPos:Number):void
        {
            this.graphics.clear();
            this.graphics.moveTo(myBall.x, myBall.y);
            this.graphics.lineStyle(1, 0xFF0000);
            this.graphics.lineTo(xPos, yPos);           
        }           
    }
}