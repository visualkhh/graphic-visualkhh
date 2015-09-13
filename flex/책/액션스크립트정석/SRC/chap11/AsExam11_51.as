package
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.geom.Point;
    import flash.geom.Vector3D;
    [SWF(width=800, height=600, backgroundColor=0xffffff)]
    public class AsExam11_51 extends Sprite
    {
        private var myBall:MyBall = new MyBall();
        private var vx:Number= 14;
        private var vy:Number= 8;
        private var vz:Number=20;
        private var sp:Sprite = new Sprite();
        
        public function AsExam11_51()
        {
            displayMain();
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler); 
        }
        private function displayMain():void
        {
            sp.x = sp.y = 200; 
            this.addChild(sp);
            sp.addChild(myBall);
            myBall.y = stage.stageHeight/2;
            myBall.z = 0;
        }
        // myBall에 vx, vy, vz 속도 적용        
        private function enterFrameHandler(event:Event):void
        {
            myBall.x += vx;
            myBall.y += vy;
            myBall.z += vz; 
            checkBorder(myBall);
        }
        // 상하좌우 + 위, 아래 경계면 감지
        private function checkBorder(ball:MyBall):void
        {
            var borderTop:Number = 0;// y축, 상  
            var borderBottom:Number = 200;// y축, 하
            var borderLeft:Number =  0;// x축, 좌
            var borderRight:Number = 200;// x축, 우
            var borderFront:Number = -400;// z축, 위
            var borderRear:Number = 200;// z축, 아래 

            if(ball.x + ball.radius > borderRight)
            {
                ball.x = borderRight - ball.radius;
                vx *= -1;
            }
            else if(ball.x - ball.radius < borderLeft)
            {
                ball.x = borderLeft + ball.radius;
                vx *= -1;
            }
            if(ball.y + ball.radius > borderBottom)
            {
                ball.y = borderBottom - ball.radius;
                vy *= -1;
            }
            else if(ball.y - ball.radius < borderTop)
            {
                ball.y = borderTop + ball.radius;
                vy *= -1;
            }
            if(ball.z - ball.radius > borderRear)
            {
                ball.z = borderRear - ball.radius;
                vz *= -1;
            }
            else if(ball.z + ball.radius < borderFront)
            {
                ball.z = borderFront + ball.radius;
                vz *= -1;
            }
        }
    }
}