package
{
    import flash.display.Sprite;
    import flash.events.Event;
    [SWF(width=1400,height=600,backgroundColor=0xFFFFFF)]
    public class AsExam10_48 extends Sprite
    {
        private var myBall:MyBall = new MyBall();
        private var line:Sprite = new Sprite();
        // 중력 가속도
        private var gravity:Number = 0.5;
        // 바운스 계수 
        private var bounce:Number = -0.7;

        public function AsExam10_48()
        {
            displayMain();
            addEventListener(Event.ENTER_FRAME, enterFrameHandler);        	
        }
        
        // 화면에 공을 추가하고 경사면을 그려준다. 
        private function displayMain():void
        {
            this.addChild(myBall);
            myBall.x = 100;
            this.addChild(line);
            line.graphics.lineStyle(2, 0xFF0000);
            line.graphics.lineTo(800, 0);
            line.y = 200;
        }
                
        // 회전 변환을 이용하여 경사면 충돌 처리
        private function enterFrameHandler(event:Event):void
        {
            // 마우스의 위치로 경사면 라인을 회전시킨다. 
            line.rotation = Math.atan2(stage.mouseY - line.y, stage.mouseX - line.x) * 180 / Math.PI;        	
            var angle:Number = line.rotation * Math.PI / 180;
            var cos:Number = Math.cos(angle);
            var sin:Number = Math.sin(angle);            

        	// myBall에 중력, 속도 적용
            myBall.vy += gravity;
            myBall.x += myBall.vx;
            myBall.y += myBall.vy;
            var dx:Number = myBall.x - line.x;
            var dy:Number = myBall.y - line.y;
            var rotatedX:Number = cos * dx + sin * dy;
            var rotatedY:Number = cos * dy - sin * dx;
            // 공의 속도를 회전하여 수평으로 만듬
            var rotatedVx:Number = cos * myBall.vx + sin * myBall.vy;
            var rotatedVy:Number = cos * myBall.vy - sin * myBall.vx;

            // 회전했을 때 y좌표가 바닥(경사면)에 충돌했으면 좌표값 보정
            if(rotatedY + myBall.radius > 0)
            {
                rotatedY = -myBall.radius;
                // 바운스 적용
                rotatedVy *= bounce;
            }              
            // 바운스가 적용된 좌표를 역회전
            dx = cos * rotatedX - sin * rotatedY;
            dy = cos * rotatedY + sin * rotatedX;
            // 바운스가 적용된 속도를 적용
            myBall.vx = cos * rotatedVx - sin * rotatedVy;
            myBall.vy = cos * rotatedVy + sin * rotatedVx;
            // 공의 좌표에 최종 좌표 반영
            myBall.x = line.x + dx;
            myBall.y = line.y + dy;         
        }
    }
}