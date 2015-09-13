package
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    [SWF(width=800,height=600,backgroundColor=0x000000)]
    public class AsExam11_54 extends Sprite
    {
    	// 바운스 계수
        private var bounce:Number = -0.8;
        // 중력 가속도
        private var gravity:Number = 1;
        private var ballArr:Array = new Array();
        
        public function AsExam11_54()
        {
            stage.addEventListener(MouseEvent.CLICK, clickHandler);
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        // 화면을 클릭하면 공을 낙하시킨다.
        private function clickHandler(event:MouseEvent):void
        {
            addBall(event.stageX, event.stageY);
        }
        
        private function addBall(posX:Number, posY:Number):void
        {
            var childBall:MyBall = new MyBall(10, Math.random()*0x1000000);
            childBall.x = posX;
            childBall.y = posY;
            // 떨어지는 높이 적용 
            childBall.z = -200;
            childBall.vx = 5;
            childBall.vy = 3;
            childBall.vz = 10;
            this.addChild(childBall);
            ballArr.push(childBall);            
        }
        
        private function enterFrameHandler(event:Event):void
        {
            // 바닥의 좌표 (깊이)
            var bottom:Number = 200;
            for(var i:int=0; i<ballArr.length; i++)
            {
                var myBall:MyBall = ballArr[i];
                // 중력 적용
                myBall.vz += gravity;
                myBall.y += myBall.vy;
                myBall.x += myBall.vx;
                myBall.z += myBall.vz;
                // 바닥에 도달하면 바운싱 적용
                if(myBall.z + myBall.radius > bottom)
                {
                    myBall.z = bottom - myBall.radius;
                    myBall.vz *= bounce;
                }
            }
        }       
    }
}