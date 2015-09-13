package
{
    import flash.display.Sprite;
    import flash.events.Event;
    [SWF(backgroundColor=0xFFFFFF)]
    public class AsExam10_20 extends Sprite
    {
        private var myBall:MyBall = new MyBall();
        // y축 속도
        private var vy:Number = 0;
        // y축 가속도 
        private var ay:Number = 0;
        // 스프링 계수
        private var spring:Number = 0.2;
        // 스프링 목표치 
        private var springTarget:Number = 100;
        // 스프링 계수를 변경한다.
        private var nsSpring:AsExam8_NumericStepper = new AsExam8_NumericStepper(0.1, 1, 0.1, "Spring 값", "ns1", 0.1);

        public function AsExam10_20()
        {
            this.addChild(myBall);
            myBall.x = 50;
            this.addChild(nsSpring);
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }

        private function enterFrameHandler(event:Event):void
        {
        	spring = nsSpring.selectedNumber;
        	// 이징과 달리 가속도에 스프링을 적용한다.
            ay = (springTarget - myBall.y) * spring;
            // 가속도를 속도에 더한다.
            vy += ay;
            myBall.y += vy; 
        }               
    }
}