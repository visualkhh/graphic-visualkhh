package
{
    import flash.display.Sprite;
    import flash.events.Event;
    [SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
    public class AsExam10_39 extends Sprite
    {
    	// 드래그하는 공
        private var myBall1:MyDraggableBall = new MyDraggableBall(40, 0xFF0000, true);
        // 충돌감지로 밀리는 공
        private var myBall2:MyDraggableBall = new MyDraggableBall(40, 0x0000FF, false);
        
        public function AsExam10_39()
        {
            this.addChild(myBall1);
            this.addChild(myBall2);    
            myBall1.x = myBall1.y = 350;
            myBall2.x = myBall2.y = 300;     
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        
        private function enterFrameHandler(event:Event):void
        {
        	// 빨간공을 드래그해서 파란공과 충돌되면       
            if(myBall1.hitTestObject(myBall2))
            {
                var dx:Number = myBall2.x - myBall1.x;
                var dy:Number = myBall2.y - myBall1.y;
                // 파란공을 충돌거리의 1/10정도 더 이동하여 밀리도록 한다.
                myBall2.x += dx*0.1;
                myBall2.y += dy*0.1;  
            }           
        }
    }
}