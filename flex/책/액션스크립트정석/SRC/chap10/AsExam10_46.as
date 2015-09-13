package
{
    import flash.display.Sprite;
    import flash.events.Event;
    [SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
    public class AsExam10_46 extends Sprite
    {
        private var myBall:MyBall = new MyBall();
        // 직선(경사면)을 그리기 위한 Sprite
        private var line:Sprite = new Sprite();
                
        public function AsExam10_46()
        {
            displayMain();
            addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        // 화면에 공을 추가하고 직선(경사면)을 그려준다. 
        private function displayMain():void
        {
            this.addChild(myBall);
            myBall.x = 450;
            myBall.y = 250;
            this.addChild(line);
            line.graphics.lineStyle(2, 0xFF0000);
            line.graphics.lineTo(300, 0);
            line.x = line.y = 250;
        }

        private function enterFrameHandler(event:Event):void
        {
			// 직선이 마우스가 이루는 각도 계산            
			var angle:Number = Math.atan2(stage.mouseY - line.y, stage.mouseX - line.x);
			// 마우스의 위치로 직선을 회전시킨다. 
			line.rotation = angle * 180 / Math.PI;
            // 직선과 공의 충돌 검사 
            checkHit(myBall);
        }
        // 회전변환을 통해 충돌검사하는 함수
        private function checkHit(myBall:MyBall):void
        {
            // 직선의 각도 계산 
            var angle:Number = line.rotation * Math.PI / 180;
            // 직선이 이루는 각도에 대한 삼각함수값 계산
            var cos:Number = Math.cos(angle);
            var sin:Number = Math.sin(angle);  
            // 삼각함수를 이용하여 회전변환을 하기 위해 공과 직선사이 거리 계산
            var dx:Number = myBall.x - line.x;
            var dy:Number = myBall.y - line.y;
            
            // 공을 직선의 각도만큼 회전하여 충돌되었는지를 검사  
            var rotatedX:Number = cos * dx + sin * dy;
            var rotatedY:Number = cos * dy - sin * dx;
            // 회전했을 때 공의 y좌표가 바닥(경사면)에 충돌 
            if(rotatedY + myBall.radius > 0)
            {
            	// 충돌시 좌표값 보정
                rotatedY = -myBall.radius;
            }           
            // 원래의 좌표로 역회전 변환해서 myBall의 좌표에 할당 
            dx = cos * rotatedX - sin * rotatedY;
            dy = cos * rotatedY + sin * rotatedX;
            myBall.x = line.x + dx;
            myBall.y = line.y + dy;                  
        }        
    }
}