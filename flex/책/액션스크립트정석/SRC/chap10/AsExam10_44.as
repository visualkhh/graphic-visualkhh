package
{
    import flash.display.Sprite;
    import flash.events.Event;
    
    [SWF(width=400,height=300,backgroundColor=0xFFFFFF)]
    public class AsExam10_44 extends Sprite
    {
        private var myBall1:MyBall;
        private var myBall2:MyBall;
        private var eNum:Number = 1;
        
        public function AsExam10_44()
        {
        	displayMain();
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        // 화면에 질량이 다른 공 2개 추가 
        private function displayMain():void
        {
            var m1:Number = Math.random()*10 + 20;
            myBall1 = new MyBall(m1, 0xFF0000);
            this.addChild(myBall1);
            myBall1.x = stage.stageWidth/2 - 100;
            myBall1.y = stage.stageHeight/2;
            myBall1.m = m1;
            // 속도는 5 ~ 15사이로 
            myBall1.vx = Math.random() * 10 + 5;
            myBall1.vy = Math.random() * 10 + 5;

            var m2:Number = Math.random()*10 + 10;
            myBall2 = new MyBall(m2, 0x0000FF);
            this.addChild(myBall2);
            myBall2.x = stage.stageWidth/2 + 100;
            myBall2.y = stage.stageHeight/2;
            myBall2.m = m2;
            myBall2.vx = Math.random() * 10 + 5;
            myBall2.vy = Math.random() * 10 + 5;
        }
        
        private function enterFrameHandler(event:Event):void
        {
            moveBall(myBall1);
            moveBall(myBall2);
            processCollision(myBall1, myBall2);
        }
        // 두 공의 2차원 충돌 처리 함수
        private function processCollision(ballA:MyBall, ballB:MyBall):void
        {
            var dx:Number = ballA.x-ballB.x;
            var dy:Number = ballA.y-ballB.y;
            var dist:Number = Math.sqrt(dx*dx + dy*dy);
            var e:Number = 1;
            if(dist < ballA.radius + ballB.radius)
            {
                var cos:Number = dx/dist;
                var sin:Number = dy/dist;                           
                // 충돌각만큼 회전변환하여 x축 1차원 충돌속도 계산 = cos * vx + sin * vy;
                // x축 회전 변환
                var vxAR:Number = cos*ballA.vx + sin*ballA.vy;
                var vxBR:Number = cos*ballB.vx + sin*ballB.vy;
                // x축 충돌 속도 계산 
                var vxAp:Number = (ballA.m - e*ballB.m)/(ballA.m + ballB.m)*vxAR + (ballB.m + e*ballB.m)/(ballA.m + ballB.m)*vxBR; 
                var vxBp:Number = (ballA.m + e*ballA.m)/(ballA.m + ballB.m)*vxAR + (ballB.m - e*ballA.m)/(ballA.m + ballB.m)*vxBR;  
                // y축 속도는 회전변환만 = cos * vy - sin * vx;
                var vyAp:Number = cos*ballA.vy - sin*ballA.vx;
                var vyBp:Number = cos*ballB.vy - sin*ballB.vx;
                
                //x 축 속도: 원래 각도로 복원 = cos*vx - sin*vy
                ballA.vx = cos*vxAp - sin*vyAp;
                ballB.vx = cos*vxBp - sin*vyBp;
                //y 축 속도: 원래 각도로 복원 = cos*vy + sin*vx
                ballA.vy = cos*vyAp + sin*vxAp;
                ballB.vy = cos*vyBp + sin*vxBp;
                
                // 겹침 조정            
                var gap:Number = ballA.radius + ballB.radius - dist;
                var angleA:Number = Math.atan2(dy,dx);
                var angleB:Number = Math.atan2(-dy,-dx);
                ballA.x = ballA.x+gap*Math.cos(angleA);
                ballB.x = ballB.x+gap*Math.cos(angleB);
            }           
        }
        // 공을 이동시키는 함수로 상하좌우 경계면을 감지함
        private function moveBall(myBall:MyBall):void
        {
            var left:Number = 0;
            var right:Number = stage.stageWidth;
            var top:Number = 0;
            var bottom:Number = stage.stageHeight;          
            myBall.y += myBall.vy;
            myBall.x += myBall.vx;
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
            if(myBall.y + myBall.radius > bottom)
            {
                myBall.y = bottom - myBall.radius;
                myBall.vy *= -1;
            }
            else if(myBall.y - myBall.radius < top)
            {
                myBall.y = top + myBall.radius;
                myBall.vy *= -1; 
            }               
        }
    }
}