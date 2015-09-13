package
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    [SWF(backgroundColor=0xFFFFFF)]
    public class AsExam10_18 extends Sprite
    {
        private var myBall:MyBall = new MyBall();
        private var easing:Number = 0.2;
        private var targetX:Number;
        private var targetY:Number;
        private var vx:Number = 0;
        private var vy:Number = 0;      
        
        public function AsExam10_18()
        {
            displayMain();
            addEventHandlers();
        }
        
        private function displayMain():void
        {
            this.addChild(myBall);
            // 이징 목표치를 공의 위치로 설정
            targetX = targetY = myBall.x = myBall.y = 150;
        }
        // 마우스를 눌렀을 때 드래그 되도록 이벤트 핸들러 함수 등록
        private function addEventHandlers():void
        {
            myBall.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
            myBall.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
        }
        // 드래그하는 동안 실행되는 함수로 마우스를 누르면 마우스무브 핸들러를 등록한다.
        private function mouseDownHandler(event:MouseEvent):void
        {
            stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
            // 드래그하는 동안은 엔터프레임 이벤트 핸들러함수가 실행되지 않도록 한다.
            stage.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        // 마우스를 놓으면 엔터프레임핸들러 함수가 실행되도록 하고 마우스 무브 핸들러는 제거한다.
        private function mouseUpHandler(event:MouseEvent):void
        {
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
            stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
        }
        // 마우스를 드래그하는 위치로 공을 움직이도록 한다. 
        private function mouseMoveHandler(event:MouseEvent):void
        {
            myBall.x = event.stageX;
            myBall.y = event.stageY;
            // 마우스 위치와 이징목표 사이에 선을 그어준다.
            drawBallLine(myBall.x, myBall.y);
        }
        // 드래그했던 마우스를 놓으면 이징을 적용하여 공을 원래 위치로 옮긴다.
        private function enterFrameHandler(event:Event):void
        {
            vx = (targetX - myBall.x) * easing;
            vy = (targetY - myBall.y) * easing;
            myBall.x += vx;
            myBall.y += vy;
            drawBallLine(myBall.x, myBall.y);
        }
        // 마우스 위치와 이징목표 사이에 선을 그어준다.
        private function drawBallLine(xPos:Number, yPos:Number):void
        {
            this.graphics.clear();
            this.graphics.moveTo(targetX, targetY);
            this.graphics.lineStyle(1, 0xFF0000);
            this.graphics.lineTo(xPos, yPos);           
        }
    }
}
