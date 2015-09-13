package
{
    import flash.display.Sprite;
    import flash.events.Event;
    
    [SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
    public class AsExam10_45 extends Sprite
    {
    	// 바운스를 -1로 설정하여 감속되지 않도록 한다.
        private var bounce:Number = -1;
        private var ballArr:Array = new Array();
        
        public function AsExam10_45()
        {
        	// 공 30개 추가
            for(var i:int=0; i<30; i++) 
            {
            	// 화면 전체적으로 랜덤한 곳에 공을 추가한다.
                addBall(Math.random() * stage.stageWidth, Math.random() * stage.stageHeight);   
            }
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        
        private function addBall(posX:Number, posY:Number):void
        {
            var childBall:MyBall = new MyBall(10, Math.random()*0x1000000);
            childBall.x = posX;
            childBall.y = posY;
            childBall.vx = Math.random() * 20 - 10;
            childBall.vy = Math.random() * 20 - 10;     
            this.addChild(childBall);
            ballArr.push(childBall);            
        }
        
        private function enterFrameHandler(event:Event):void
        {
        	// 경계면 좌표
            var left:Number = 0;
            var right:Number = stage.stageWidth;
            var top:Number = 0;
            var bottom:Number = stage.stageHeight;          
            for(var i:int=0; i<ballArr.length; i++)
            {
                var myBall:MyBall = ballArr[i];
                myBall.y += myBall.vy;
                myBall.x += myBall.vx;
                if(myBall.x + myBall.radius > right)
                {
                    myBall.x = right - myBall.radius;
                    myBall.vx *= bounce;
                }
                else if(myBall.x - myBall.radius < left)
                {
                    myBall.x = left + myBall.radius;
                    myBall.vx *= bounce;
                }
                if(myBall.y + myBall.radius > bottom)
                {
                    myBall.y = bottom - myBall.radius;
                    myBall.vy *= bounce;
                }
                else if(myBall.y - myBall.radius < top)
                {
                    myBall.y = top + myBall.radius;
                    myBall.vy *= bounce; 
                }       
                // 충돌 검사
                for(var j:int=i+1; j<ballArr.length; j++)
                {
                    var myBall2:MyBall = ballArr[j];
                    var dx:Number = myBall2.x - myBall.x;
                    var dy:Number = myBall2.y - myBall.y;
                    var dist:Number = Math.sqrt(dx * dx + dy * dy);
                    var rd:Number = myBall.radius + myBall2.radius;
                    // 충돌 거리에 들어가면 충돌 처리
                    if(dist <= rd) 
                    {
                        processCollision(myBall, myBall2);     
                    }
                } 
            }
        }       
        // 충돌 처리 함수
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
    }
}