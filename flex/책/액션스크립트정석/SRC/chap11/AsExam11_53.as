package
{
    import flash.display.Sprite;
    import flash.events.Event;
    [SWF(width=800, height=600, backgroundColor=0xffffff)]
    public class AsExam11_53 extends Sprite
    {
        private var sp:Sprite = new Sprite();
        private var ballArr:Array = new Array();
        private var ballCount:int = 50;
        
        public function AsExam11_53()
        {
            displayMain();
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler); 
        }

        private function displayMain():void
        {
            this.addChild(sp);
            sp.x = sp.y = 200; 
            for(var i:int=0; i<ballCount; i++) 
            {
                addBall(Math.random() * stage.stageWidth, Math.random() * stage.stageHeight);   
            }
        }
        // 랜덤한 위치에 -10 ~ 10사이의 속도로 공을 화면과 배열에 추가함
        private function addBall(posX:Number, posY:Number):void
        {
            var childBall:MyBall = new MyBall(9, Math.random()*0x1000000);
            childBall.x = posX;
            childBall.y = posY;
            childBall.vx = Math.random() * 20 - 10;
            childBall.vy = Math.random() * 20 - 10;     
            childBall.vz = Math.random() * 20 - 10;
            sp.addChild(childBall);
            ballArr.push(childBall);            
        }        
        // 배열에 들어있는 공에 속도를 가하고, 경계면 감지를 수행한다.
        private function enterFrameHandler(event:Event):void
        {
            for(var i:int=0; i<ballArr.length; i++)
            {
                var myBall:MyBall = ballArr[i];
                myBall.y += myBall.vy;
                myBall.x += myBall.vx;
                myBall.z += myBall.vz; 
                checkBorder(myBall);
            }           
        }
        // 상하좌우 + 위아래 6방향의 경계면 감지
        private function checkBorder(ball:MyBall):void
        {
            var borderTop:Number = 0;// y축, 상  
            var borderBottom:Number = 300;// y축, 하
            var borderLeft:Number =  0;// x축, 좌
            var borderRight:Number = 300;// x축, 우
            var borderFront:Number = -400;// z축, 위
            var borderRear:Number = 200;// z축, 아래 

            if(ball.x + ball.radius > borderRight)
            {
                ball.x = borderRight - ball.radius;
                ball.vx *= -1;
            }
            else if(ball.x - ball.radius < borderLeft)
            {
                ball.x = borderLeft + ball.radius;
                ball.vx *= -1;
            }
            if(ball.y + ball.radius > borderBottom)
            {
                ball.y = borderBottom - ball.radius;
                ball.vy *= -1;
            }
            else if(ball.y - ball.radius < borderTop)
            {
                ball.y = borderTop + ball.radius;
                ball.vy *= -1;
            }
            if(ball.z - ball.radius > borderRear)
            {
                ball.z = borderRear - ball.radius;
                ball.vz *= -1;
            }
            else if(ball.z + ball.radius < borderFront)
            {
                ball.z = borderFront + ball.radius;
                ball.vz *= -1;
            }
        }
    }
}