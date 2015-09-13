package
{
    import flash.display.Sprite;
    import flash.events.Event;
    [SWF(width=1200,height=800,backgroundColor=0xFFFFFF)]
    public class AsExam10_35 extends Sprite
    {
        private var v0:Number = 15; // 초기 속도
        // 60도로 발사 
        private var angle:Number =60*Math.PI/180;
        // 중력 가속도 
        private const g:Number = 9.8; 
        // 시간, 프레임레이트를 감안하여 1/24씩 증가함
        private var t:Number=0; 
        // 포탄의 발사 위치
        private var baseX:Number = 40;
        private var baseY:Number = stage.stageHeight/2;
        private var myBall:MyBall = new MyBall();
        
        public function AsExam10_35()
        {
            this.addChild(myBall);          
            myBall.x = 40;
            myBall.y = baseY;
            this.graphics.moveTo(myBall.x, myBall.y);
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        
        private function enterFrameHandler(event:Event):void 
        {
            t += 1/24;    
            // x축 속도 계산
            myBall.vx = v0*Math.cos(angle);
            // y축 속도 계산 
            myBall.vy = v0*Math.sin(angle) - g*t;
            // x축 속도 반영
            myBall.x += myBall.vx;
            // y축은 +가 아니라 -가 되어야 위쪽으로 포탄이 날라감
            myBall.y -= myBall.vy; 
            this.graphics.lineStyle(1, 0xFF0000);
            this.graphics.lineTo(myBall.x,myBall.y);
            // y좌표가 발사위치로 오면 이벤트 종료
            if(myBall.y >= baseY) stage.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
    }
}
