package
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    [SWF(backgroundColor=0xFFFFFF)]
    public class AsExam10_14 extends Sprite
    {
        // 기본 속도
        private var v:Number = 3;
        // 각속도 
        private var va:Number=1;
        // 회전 각도 
        private var angle:Number = 5;
        private var myBall:MyBall  = new MyBall();
        private var nsAngle:AsExam8_NumericStepper = new AsExam8_NumericStepper(1, 10, 1, "각속도조절", "ns1", 1);
         
        public function AsExam10_14()
        {
            displayMain();
            addEventHandlers();
        }
        
        private function displayMain():void
        {
            this.addChild(myBall);
            this.addChild(nsAngle);
            myBall.x = 100; 
            myBall.y = 100;
            nsAngle.x =10;
        }
        
        private function addEventHandlers():void
        {
            nsAngle.addEventListener("numberChanged", numberChangedHandler);    
            addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        
        private function enterFrameHandler(event:Event):void
        {
        	// 5도씩 회전한다.
            var radians:Number = angle * Math.PI / 180;
            // x, y 축 방향의 속도에 대한 좌표 이동량 계산             
            var vx:Number = Math.cos(radians)*v;
            var vy:Number = Math.sin(radians)*v;
            myBall.x += vx;
            myBall.y += vy;
            // 각속도가 증가하면 회전각도가 증가한다.
            angle += va;
        }       
        // 숫자입력기 값을 변경하면 각속도 값이 변경된다.
        private function numberChangedHandler(event:MouseEvent):void
        {       
            va = nsAngle.selectedNumber;
        }
    }
}