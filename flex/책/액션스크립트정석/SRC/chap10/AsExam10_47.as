package
{
    import flash.display.Sprite;
    import flash.events.Event;
    [SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
    public class AsExam10_47 extends Sprite
    {
        private var myBall:MyBall = new MyBall();
        private var line:Sprite = new Sprite();
        // 중력 가속도
        private var gravity:Number = 0.5;
                
        public function AsExam10_47()
        {
            displayMain();
            addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }

        // 화면에 공을 추가하고 경사면을 그려준다. 
        private function displayMain():void
        {
            this.addChild(myBall);
            myBall.x = 250;
            this.addChild(line);
            line.graphics.lineStyle(2, 0xFF0000);
            line.graphics.lineTo(600, 0);
            line.y = 200;
        }

        private function enterFrameHandler(event:Event):void
        {
            // 경사면 라인과 마우스가 이루는 각도 계산            
            var angle:Number = Math.atan2(stage.mouseY - line.y, stage.mouseX - line.x);
            // 마우스의 위치로 경사면 라인을 회전시킨다. 
            line.rotation = angle * 180 / Math.PI;
            // 경사면에 충돌하면 vx, vy를 0으로 하여 경사면에 붙어 있도록 함
            if(checkHit(myBall)) 
            {
                myBall.vx = myBall.vy = 0;
            } 
            else // 경사면에 도달하지 않으면 계속 떨어지도록 중력가속도 추가 
            {
                myBall.vy += gravity;
                myBall.x += myBall.vx;
                myBall.y += myBall.vy;
            }        
        }
        // 회전변환을 통해 충돌검사하는 함수
        private function checkHit(myBall:MyBall):Boolean
        {
            var res:Boolean = false;            
            // 경사면의 라디안값 계산
            var angle:Number = line.rotation * Math.PI / 180;
            // 좌표를 회전하기 위한 삼각함수값 계산
            var cos:Number = Math.cos(angle);
            var sin:Number = Math.sin(angle);  
            // 삼각함수를 이용하여 회전변환을 하기 위해 공과 경사면사이 거리 계산
            var dx:Number = myBall.x - line.x;
            var dy:Number = myBall.y - line.y;
            // 공의 좌표를 회전하여 수평으로 만듬 
            var rotatedX:Number = cos * dx + sin * dy;
            var rotatedY:Number = cos * dy - sin * dx;
            // 회전했을 때 y좌표가 바닥(경사면)에 충돌했으면 좌표값 보정
            if(rotatedY + myBall.radius > 0)
            {
                rotatedY = -myBall.radius;
                res = true; 
            }           
            // 원래의 좌표로 역회전 변환해서 myBall의 좌표에 할당 
            dx = cos * rotatedX - sin * rotatedY;
            dy = cos * rotatedY + sin * rotatedX;
            myBall.x = line.x + dx;
            myBall.y = line.y + dy;                  
            return res;
        }        
    }
}