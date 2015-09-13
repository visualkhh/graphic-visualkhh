package
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.text.TextField;
    [SWF(width=1200,height=800,backgroundColor=0xFFFFFF)]
    public class AsExam10_36 extends Sprite
    {
        // 초기 속도
        private var v0:Number = 0;
        // 발사 각도 
        private var angle:Number = 0; 
        // 중력 가속도
        private const g:Number = 9.8;
        // 시간
        private var t:Number=0;       
        // 포탄의 발사 위치
        private var baseX:Number = 40;
        private var baseY:Number = stage.stageHeight/2;
        private var myBall:MyBall = new MyBall(); 
        // 포탄의 각도, 속도, 비거리를 나타내기 위한 텍스트필드 
        private var tf:TextField = new TextField();
        
        public function AsExam10_36()
        {
        	displayMain();
        	addEventHandlers();
        }
        
        private function displayMain():void
        {
            this.addChild(myBall);          
            this.addChild(tf);
            myBall.x = baseX;
            myBall.y = baseY;
            tf.y = baseY + 20; 
            tf.autoSize = "left";       
        }
        
        private function addEventHandlers():void
        {
            stage.addEventListener(MouseEvent.CLICK, clickHandler);
            stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
        }
        
        private function mouseMoveHandler(event:MouseEvent):void
        {
            this.graphics.clear();
            this.graphics.lineStyle(1, 0xFF0000);
            this.graphics.moveTo(myBall.x, myBall.y);
            this.graphics.lineTo(event.stageX, event.stageY);
            // 공과 마우스 사이의 좌표를 이용하여 각도를 계산
            angle = -Math.atan2(event.stageY-myBall.y, event.stageX-myBall.x);
            var dy:Number = event.stageY-myBall.y;
            var dx:Number = event.stageX-myBall.x;
            // 공과 마우스 사이의 거리를 반올림한 값을 초기 속도로 설정
            v0 = Math.round(Math.sqrt(dx*dx + dy*dy))/2;
            // 초기 속도값은 물리학 공식으로 계산한 값과 일치하도록 값을 보정하여 보여준다.
            tf.text = "각도:" + Math.round(angle*180/Math.PI) + " 초기속도:" + (Math.round(v0*0.578)); 
        }
        
        private function clickHandler(event:MouseEvent):void
        {
            initBall();
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
            stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
        }
        // 발사를 위해 시간, 공의 위치 값을 초기화한다.
        private function initBall():void
        {
            t = 0;
            myBall.x = baseX;
            myBall.y = baseY;
            this.graphics.moveTo(myBall.x, myBall.y);
            stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
        }                
        // 포물선 운동을 계산하여 화면에 그려준다.
        private function enterFrameHandler(event:Event):void 
        {
            this.graphics.lineStyle(1, 0xFF0000);
            this.graphics.lineTo(myBall.x,myBall.y);
            t += 1/24; // 시간은 프레임레이트 24에 맞추어 줘야함  
            // x축 방향 속도 계산
            myBall.vx = v0*Math.cos(angle);
            // y축 방향 속도 계산
            myBall.vy = v0*Math.sin(angle) - g*t;
            // x, y축 속도 반영
            myBall.x = baseX + myBall.vx*t;
            myBall.y = baseY - myBall.vy*t + 1/2*g*t*t;// y축의 방향 보정을 위해 증감 부호를 바꿈 (+를 -로, -를 +로)           
            // 공이 지면에 닿으면 초기속도값을 0으로 설정하고 이동거리를 표시한다.
            if(myBall.y >= baseY) 
            {
                v0 = 0;
                myBall.y = baseY;
                stage.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
                this.graphics.lineStyle(2, 0xFF0000);
                this.graphics.drawCircle(myBall.x, myBall.y, 5);
                tf.appendText(" 이동거리: " + (myBall.x - baseX));
                // 발사 상태로 되돌린다.
                initBall();
            }
        }
    }
}
