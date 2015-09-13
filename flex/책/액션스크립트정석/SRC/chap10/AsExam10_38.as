package
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    
    [SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
    public class AsExam10_38 extends Sprite
    {
        private var bounce:Number = -0.8;
        private var gravity:Number = 1;
        private var ballArr:Array = new Array();
        
        public function AsExam10_38()
        {
            addBall(Math.random() * stage.stageWidth, 300);  
            stage.addEventListener(MouseEvent.CLICK, clickHandler);
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        
        private function clickHandler(event:MouseEvent):void
        {
            addBall(event.stageX, event.stageY);
        }
        
        private function addBall(posX:Number, posY:Number):void
        {
            var childBall:MyBall = new MyBall(20, Math.random()*0x1000000);
            childBall.x = posX;
            childBall.y = posY;
            // x 초기 속도 설정
            childBall.vx = 5;
            // 위쪽으로 살짝 튀도록 y축 초기 속도 설정
            childBall.vy = -20;
            this.addChild(childBall);
            ballArr.push(childBall);            
        }
        
        private function enterFrameHandler(event:Event):void
        {
            var bottom:Number = stage.stageHeight;
            for(var i:int=0; i<ballArr.length; i++)
            {
                var myBall:MyBall = ballArr[i];
                myBall.vy += gravity;
                myBall.y += myBall.vy;
                // x축 속도도 같이 적용
                myBall.x += myBall.vx;
                if(myBall.y + myBall.radius > bottom)
                {
                    myBall.y = bottom - myBall.radius;
                    myBall.vy *= bounce;
                }
            }
        }       
    }
}