package
{
	import flash.events.Event;
	[SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
	public class AsExam10_41 extends AsExam10_40
	{
		public function AsExam10_41()
		{
			super();
		}
		
        override protected function enterFrameHandler(event:Event):void
        {		
            for(var i:int=0; i<ballArr.length; i++)
            {
                var myBall:MyBall = ballArr[i];
                myBall.y += myBall.vy;
                myBall.x += myBall.vx;
                if(myBall.x + myBall.radius > right)
                {
                    myBall.x = right - myBall.radius;
                    myBall.vx *= bounce;
                    myBall.drawMyBall(20, Math.random()*0x1000000);
                }
                else if(myBall.x - myBall.radius < left)
                {
                    myBall.x = left + myBall.radius;
                    myBall.vx *= bounce;
                    myBall.drawMyBall(20, Math.random()*0x1000000);
                }
                if(myBall.y + myBall.radius > bottom)
                {
                    myBall.y = bottom - myBall.radius;
                    myBall.vy *= bounce;
                    myBall.drawMyBall(20, Math.random()*0x1000000);
                }
                else if(myBall.y - myBall.radius < top)
                {
                    myBall.y = top + myBall.radius;
                    myBall.vy *= bounce; 
                    myBall.drawMyBall(20, Math.random()*0x1000000);
                }       
                // myBall과 배열에 있는 모든 배열에 대해 충돌처리를 함
                for(var j:int=0; j<ballArr.length; j++)
                {
                    if(i!=j)
                    {
                        var myBall2:MyBall = ballArr[j];
                        var dx:Number = myBall2.x - myBall.x;
                        var dy:Number = myBall2.y - myBall.y;
                        // myBall과 myBall2 거리를 계산
                        var dist:Number = Math.sqrt(dx * dx + dy * dy);
                        // myBall과 myBall2가 충돌했다면
                        if(dist < myBall.radius + myBall2.radius)
                        {
                        	// myBall과 myBall2의 속도를 반대로 바꾼다.
                            myBall.vx *= -1;
                            myBall.vy *= -1;  
                            myBall2.vx *= -1;
                            myBall2.vy *= -1;  
                        }    
                        
                    }
                }
            }
        }
	}
}