package
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    
    [SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
    public class AsExam10_37 extends Sprite
    {
    	// 바운스 계수 설정
        private var bounce:Number = -0.8;
        // 중력 가속도 
        private var gravity:Number = 1;
        // 공을 담을 배열 
        private var ballArr:Array = new Array();
        public function AsExam10_37()
        {
            // 화면에 공을 하나 추가
            addBall(Math.random() * stage.stageWidth, 20);  
            stage.addEventListener(MouseEvent.CLICK, clickHandler);
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        // 화면을 클릭하면 그 위치에 공을 추가함
        private function clickHandler(event:MouseEvent):void
        {
            addBall(event.stageX, event.stageY);
        }
        // 지정된 좌표에 공을 추가
        private function addBall(posX:Number, posY:Number):void
        {
            var childBall:MyBall = new MyBall(20, Math.random()*0x1000000);
            childBall.x = posX;
            childBall.y = posY;
            // y축 초기 속도는 -20으로 하여 위로 살짝 튀도록함
            childBall.vy = -20;
            this.addChild(childBall);
            ballArr.push(childBall);            
        }
        // 배열에 있는 공에 대해 바운스 모션 적용
        private function enterFrameHandler(event:Event):void
        {
        	// y축 바닥 위치값 계산
            var bottom:Number = stage.stageHeight;
            for(var i:int=0; i<ballArr.length; i++)
            {
                var myBall:MyBall = ballArr[i];
                // 중력 가속도 적용
                myBall.vy += gravity;
                // y축 방향 속도 적용
                myBall.y += myBall.vy;
                // 바닥에 도달하면
                if(myBall.y + myBall.radius > bottom)
                {
                	// 공의 위치를 보정하고
                    myBall.y = bottom - myBall.radius;
                    // 바운스 적용
                    myBall.vy *= bounce;
                }
            }
        }       
    }
}