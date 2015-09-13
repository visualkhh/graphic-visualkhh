package
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    [SWF(backgroundColor=0xFFFFFF)]
    public class AsExam10_12 extends Sprite
    {
    	// myBall의 속도 (x축 방향으로 1)
        private var vx:Number = 1;
        // 입체 그라데이션이 적용된 공 생성 
        private var myBall:MyBall = new MyBall();
        private var nsVX:AsExam8_NumericStepper = new AsExam8_NumericStepper(1, 10, 1, "속도조절", "ns1", 1);
        
        public function AsExam10_12()
        {
            displayMain();
            addEventHandlers();
        }
        
        private function displayMain():void
        {
            this.addChild(myBall);
            this.addChild(nsVX);
            myBall.x = myBall.y = 100;
            nsVX.y = 10; 
        }
        
        private function addEventHandlers():void
        {
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
            nsVX.addEventListener("numberChanged", numberChangedHandler);   
        }
    	// vx만큼 x축으로 좌표를 이동함으로써 속도를 구현
        private function enterFrameHandler(event:Event):void
        {
            myBall.x += vx;
        }       
        // 숫자입력기 값이 바뀌면 vx값을 바꿔줌으로써 속도를 변화시킴
        private function numberChangedHandler(event:MouseEvent):void
        {       
            vx = nsVX.selectedNumber;
        }
    }
}