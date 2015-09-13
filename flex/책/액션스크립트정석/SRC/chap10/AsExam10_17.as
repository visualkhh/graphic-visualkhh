package
{
    import flash.display.Sprite;
    import flash.events.Event;
    [SWF(backgroundColor=0xFFFFFF)]
    public class AsExam10_17 extends Sprite
    {
        private var myBall:MyBall = new MyBall();
        // 이징 계수
        private var easing:Number = 0.1;
        // 이징 목표치 
        private var easingTargetX:Number = 0;
        private var easingTargetY:Number = 0;
        private var vx:Number = 0;
        private var vy:Number = 0;              

        public function AsExam10_17()
        {
            this.addChild(myBall);
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        // 공을 마우스 위치로 이징을 적용하여 움직인다. 
        private function enterFrameHandler(event:Event):void
        {
            easingTargetX = stage.mouseX;
            easingTargetY = stage.mouseY;
            vx = (easingTargetX - myBall.x) * easing;
            vy = (easingTargetY - myBall.y) * easing;
            myBall.x += vx;
            myBall.y += vy;
            drawBallLine(myBall.x, myBall.y);
        }       
        // 마우스의 위치와 공사이에 직선을 그어준다.
        private function drawBallLine(xPos:Number, yPos:Number):void
        {
            this.graphics.clear();
            this.graphics.moveTo(easingTargetX, easingTargetY);
            this.graphics.lineStyle(1, 0xFF0000);
            this.graphics.lineTo(xPos, yPos);           
        }       
    }
}