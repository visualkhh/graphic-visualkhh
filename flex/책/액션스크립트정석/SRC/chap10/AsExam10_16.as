package
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    [SWF(backgroundColor=0xFFFFFF)]
    public class AsExam10_16 extends Sprite
    {
        private var myBall:MyBall = new MyBall();
        // 이징 계수
        private var easing:Number = 0.1;
        // 이징 목표값으로 물체가 최종 도달해야할 좌표로 서서히 이동하게 된다. 
        private var easingTargetX:Number = 0;
        private var easingTargetY:Number = 0;
        // 물체의 속도
        private var vx:Number = 0;
        private var vy:Number = 0;          
        private var nsEasing:AsExam8_NumericStepper = new AsExam8_NumericStepper(0.1, 1, 0.1, "Easing 값", "ns1", 0.1);
        
        public function AsExam10_16()
        {
            displayMain();
            addEventHandlers();
        }
        
        private function displayMain():void
        {
            this.addChild(myBall);
            this.addChild(nsEasing);
            myBall.x = 10; 
            myBall.y = 100;
            nsEasing.y = 10; 
        }
        
        private function addEventHandlers():void
        {
            nsEasing.addEventListener("numberChanged", numberChangedHandler);   
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
            stage.addEventListener(MouseEvent.CLICK, clickHandler);
        }
        // 숫자입력기를 선택하면 이징 계수값이 변한다
        private function numberChangedHandler(event:MouseEvent):void
        {       
            easing = nsEasing.selectedNumber;
        }       
        // 마우스가 있는 위치로 공이 서서히 이동하도록 이징 타겟 값을 설정한다.
        private function clickHandler(event:MouseEvent):void
        {
            easingTargetX = event.stageX;
            easingTargetY = event.stageY;
        }
        // 공이 이징타겟에 도달할 때 까지 서서히 이동하도록 속도가 조절된다.
        private function enterFrameHandler(event:Event):void
        {
            vx = (easingTargetX - myBall.x) * easing;
            vy = (easingTargetY - myBall.y) * easing;
            myBall.x += vx;
            myBall.y += vy;
        }
    }
}
