package
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    [SWF(width=800,height=600,backgroundColor=0x000000)]
    public class AsExam11_55 extends Sprite
    {
        private var bounce:Number = -0.7;
        private var gravity:Number = 1;
        private var ballCount:int = 200;
        private var ballArr:Array = new Array();
        private var sp:Sprite = new Sprite();
        
        public function AsExam11_55()
        {
            displayMain();
            addEventHandlers();
        }
        // 공을 담을 컨테이너를 배치한다. 
        private function displayMain():void
        {
            this.addChild(sp);
            sp.z = 0;
            // 회색 바닥 부분             
            sp.graphics.beginFill(0xCCCCCC, 0.5);
            sp.graphics.drawRect(400, 400, 500, 500);
            // 공의 모션이 입체적으로 보이도록 x, y, z 방향으로 회전한다.
            sp.rotationX = -60;
            sp.rotationY = 15;
            sp.rotationZ = 10;
        }

        private function addEventHandlers():void
        {
            stage.addEventListener(MouseEvent.CLICK, clickHandler);
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        // 화면을 클릭하면 공이 추가된다.
        private function clickHandler(event:MouseEvent):void
        {
            addBall(event.stageX, event.stageY);
        }
        
        private function addBall(posX:Number, posY:Number):void
        {
            var childBall:MyBall = new MyBall(5, Math.random()*0x1000000);
            childBall.x = posX;
            childBall.y = posY;
            childBall.vx = 5;
            childBall.vy = 3;
            childBall.vz = 10;
            // sp와 동일하게 회전한다.
            childBall.rotationX = 60;
            childBall.rotationY = -15;
            childBall.rotationZ = -10;            
            sp.addChild(childBall);
            ballArr.push(childBall);            
        }
        
        private function enterFrameHandler(event:Event):void
        {
        	// 공이 200개가 될 때 까지 화면에 추가한다.
            if(ballArr.length < ballCount)
            {
                addBall(stage.stageWidth/4*Math.random(), stage.stageHeight/4*Math.random());  
            }
            var bottom:Number = 200;//stage.stageHeight;
            for(var i:int=0; i<ballArr.length; i++)
            {
                var myBall:MyBall = ballArr[i];
                myBall.vz += gravity;
                myBall.y += myBall.vy;
                myBall.x += myBall.vx;
                myBall.z += myBall.vz;
                // 바닥에 도달하면 바운스 모션 적용
                if(myBall.z + myBall.radius > bottom)
                {
                    myBall.z = bottom - myBall.radius;
                    myBall.vz *= bounce;
                }
            }
        }       
    }
}