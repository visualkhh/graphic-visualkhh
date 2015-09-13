package
{
    import flash.display.Sprite;
    import flash.events.Event;
    [SWF(backgroundColor=0xFFFFFF)]
    public class AsExam10_22 extends Sprite
    {
        private var myBall:MyBall = new MyBall();
        // x,y 축 방향의 속도
        private var vx:Number = 0;
        private var vy:Number = 0;
        // x,y축 방향의 가속도 
        private var ax:Number = 0;
        private var ay:Number = 0;
        // 스프링 계수
        private var spring:Number = 0.1;
        // 저항 계수
        private var friction:Number = 0.95;
        // 중력 가속도
        private var gravity:int = 0;
        // 중력가속도값을 변경하는 컨트롤
        private var nsGravity:AsExam8_NumericStepper = new AsExam8_NumericStepper(0, 20, 5, "중력가속도값", "ns1", 0);        
        
        public function AsExam10_22()
        {
            this.addChild(myBall);
            this.addChild(nsGravity);
            nsGravity.y= 10;
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        
        private function enterFrameHandler(event:Event):void
        {
        	// x,y방향 가속도에 스프링 적용
            ax = (stage.mouseX - myBall.x) * spring;
            ay = (stage.mouseY - myBall.y) * spring;
            vx += ax;
            vy += ay;
        	gravity = nsGravity.selectedNumber;
        	// 저항 계수 적용전에 중력 가속도를 vy에 적용한다.
            vy += gravity;
            // x, y방향 속도에 저항 계수 적용
            vx *= friction;
            vy *= friction;
            myBall.x += vx;
            myBall.y += vy;
            drawBallLine(stage.mouseX, stage.mouseY);
            // 중력가속도 값에 비례하여 공이 커지도록 그려준다.
            myBall.drawMyBall(myBall.radius+gravity);
        }
        // 공과 마우스 위치 사이를 잇는 선을 그린다.
        private function drawBallLine(xPos:Number, yPos:Number):void
        {
            this.graphics.clear();
            this.graphics.moveTo(myBall.x, myBall.y);
            // 중력가속도 값에 비례하여 선을 굵게 그린다.
            this.graphics.lineStyle(1+gravity/5, 0xFF0000);
            this.graphics.lineTo(xPos, yPos);           
        }       
    }
}
