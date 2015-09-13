package
{
    import flash.display.Sprite;
    import flash.events.Event;
    [SWF(backgroundColor=0xffffff)]
    public class AsExam10_34 extends Sprite
    {
        private var myBall:MyBall = new MyBall();
        // 추의 길이
        private var pendLength:Number = 150;
        // 각속도
        private var vy:Number = 5*Math.PI/180; 
        
        public function AsExam10_34()
        {
            this.addChild(myBall);          
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        
        public function enterFrameHandler(event:Event):void 
        {
        	// 각속도를 반영
            myBall.ang += vy;
            // X축 위치를 각도에 따라 계산한다. 
            myBall.x = Math.cos(myBall.ang) * pendLength;
            // Y축 위치를 각도에 따라 계산한다. 이때 음수값이 나오지 않도록 절대값을 설정한다.
            myBall.y = Math.abs(Math.sin(myBall.ang) * pendLength);
            this.graphics.clear();          
            this.graphics.lineStyle(1, 0xFF0000);
            this.graphics.lineTo(myBall.x, myBall.y);
        }
    }
}