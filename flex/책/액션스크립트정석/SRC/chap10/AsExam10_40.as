package
{
    import flash.display.Sprite;
    import flash.events.Event;
    
    [SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
    public class AsExam10_40 extends Sprite
    {
        protected var bounce:Number = -1;
        protected var ballArr:Array = new Array();
        // 상하 좌우 경계면 좌표값
        protected var left:Number = 0;
        protected var right:Number = stage.stageWidth;
        protected var top:Number = 0;
        protected var bottom:Number = stage.stageHeight;          

        public function AsExam10_40()
        {
            // 공을 20개 생성         	
            for(var i:int=0; i<20; i++) 
            {
                addBall(Math.random() * stage.stageWidth, Math.random() * stage.stageHeight);   
            }
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        // 공을 화면과 배열에 추가한다.
        private function addBall(posX:Number, posY:Number):void
        {
            var childBall:MyBall = new MyBall();
            childBall.x = posX;
            childBall.y = posY;
            // x, y 초기 속도는 -10 ~ 10 사이의 랜덤한 값으로 설정
            childBall.vx = Math.random() * 20 - 10;
            childBall.vy = Math.random() * 20 - 10;     
            this.addChild(childBall);
            ballArr.push(childBall);            
        }
        
        protected function enterFrameHandler(event:Event):void
        {
            for(var i:int=0; i<ballArr.length; i++)
            {
            	// 배열에 들어있는 공에 대해 vx, vy를 더하여 속도를 적용한다. 
                var myBall:MyBall = ballArr[i];
                myBall.y += myBall.vy;
                myBall.x += myBall.vx;
                // 공이 우측 경계면에 도달하면 바운스를 적용하고 공의 색상을 바꿈
                if(myBall.x + myBall.radius > right)
                {
                    myBall.x = right - myBall.radius;
                    myBall.vx *= bounce;
                    myBall.drawMyBall(20, Math.random()*0x1000000);
                }
                // 공이 좌측 경계면에 도달하면 바운스를 적용하고 공의 색상을 바꿈
                else if(myBall.x - myBall.radius < left)
                {
                    myBall.x = left + myBall.radius;
                    myBall.vx *= bounce;
                    myBall.drawMyBall(20, Math.random()*0x1000000);
                }
                // 공이 하단 경계면에 도달하면 바운스를 적용하고 공의 색상을 바꿈
                if(myBall.y + myBall.radius > bottom)
                {
                    myBall.y = bottom - myBall.radius;
                    myBall.vy *= bounce;
                    myBall.drawMyBall(20, Math.random()*0x1000000);
                }
                // 공이 상단 경계면에 도달하면 바운스를 적용하고 공의 색상을 바꿈
                else if(myBall.y - myBall.radius < top)
                {
                    myBall.y = top + myBall.radius;
                    myBall.vy *= bounce; 
                    myBall.drawMyBall(20, Math.random()*0x1000000);
                }       
            }
        }       
    }
}