package
{
    import flash.display.Sprite;
    import flash.events.Event;
    [SWF(backgroundColor=0xffffff)]
    public class AsExam10_32 extends Sprite
    {
    	// 공에 꼬리가 표시되도록 한다.
        private var myBall:MyBall = new MyBall(20, Math.random()*0x1000000, true);
        public function AsExam10_32()
        {
            this.addChild(myBall);
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        
        private function enterFrameHandler(event:Event):void
        {
        	// 공을 회전시키기 위해 공과 마우스사이 거리 계산 
            var dx:Number = stage.mouseX - myBall.x;
            var dy:Number = stage.mouseY - myBall.y;
            // 공과 마우스가 이루는 각도 계산            
            var angle:Number = Math.atan2(dy, dx);
            // 공을 회전시킨다. 
            myBall.rotation = angle * 180 / Math.PI;
            // 각도에 맞는 속도를 계산하여 공에 적용한다. 
            var vx:Number = Math.cos(angle) * 10;
            var vy:Number = Math.sin(angle) * 10;
            // 마우스와 공의 거리 계산
            var dist:Number = Math.sqrt(dx*dx + dy*dy);
            // 5픽셀 이상일 경우만 공을 움직이고 5픽셀 이하면 공을 움직이지 않도록 한다.
            if(dist > 5)
            {
                myBall.x += vx;
                myBall.y += vy;         
            }
        }
    }
}