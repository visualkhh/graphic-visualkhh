package
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.geom.Point;
    import flash.geom.Vector3D;
    [SWF(width=800, height=600, backgroundColor=0xffffff)]
    public class AsExam11_52 extends Sprite
    {
        private var myBall:MyBall = new MyBall(9);
        private var vx:Number= 14;
        private var vy:Number= 8;
        private var vz:Number=20;
        private var sp:Sprite = new Sprite();
        private var fl:Number = 0;
        
        public function AsExam11_52()
        {
            displayMain();
	        stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler); 
        }
        private function displayMain():void
        {
            this.addChild(sp);
            sp.y = 200; 
            sp.x = 200; 
            sp.addChild(myBall);
            myBall.y = stage.stageHeight/2;
            myBall.z = 0;
            // focalLength값 계산
            fl = root.transform.perspectiveProjection.focalLength;
        }
        
        private function enterFrameHandler(event:Event):void
        {
            myBall.x += vx;
            myBall.y += vy;
            myBall.z += vz; 
            checkBorder(myBall);
        }
        
        private function checkBorder(ball:MyBall):void
        {
        	// 상하좌우 + 위 아래 경계면 좌표
            var borderTop:Number = 0;   
            var borderBottom:Number = 200; 
            var borderLeft:Number =  0; 
            var borderRight:Number = 200; 
            var borderFront:Number = -400; 
            var borderRear:Number = 200;  
            // 공의 3D 좌표를 2D 좌표로 변환한다.
            var p:Point = ball.local3DToGlobal(new Vector3D(0, 0, 0));
            // sp가 (200, 200)으로 이동했기 때문에 보정값을 빼준다.
            p.x -= 200;
            p.y -= 200;
            // 공의 z축 위치에 맞춰 알파값을 계산한다.
            var alaphZ:Number = (borderRear - ball.z)/(borderRear - borderFront);
            // 공의 z축 위치에 맞게 스케일 값을 계산한다.
            var scale:Number = fl / (fl + ball.z);
            if(ball.x + ball.radius > borderRight)
            {
                ball.x = borderRight - ball.radius;
                vx *= -1;
                sp.graphics.beginFill(0xff0000, alaphZ);
                sp.graphics.drawCircle(p.x, p.y,4*scale);
            }
            else if(ball.x - ball.radius < borderLeft)
            {
                ball.x = borderLeft + ball.radius;
                vx *= -1;
               sp.graphics.beginFill(0xffa500, alaphZ);
               sp.graphics.drawCircle(p.x, p.y, 4*scale);

            }
            if(ball.y + ball.radius > borderBottom)
            {
                ball.y = borderBottom - ball.radius;
                vy *= -1;

               sp.graphics.beginFill(0xffff00, alaphZ);
               sp.graphics.drawCircle(p.x, p.y, 4*scale);
            }
            else if(ball.y - ball.radius < borderTop)
            {
                ball.y = borderTop + ball.radius;
                vy *= -1;
                sp.graphics.beginFill(0x008000, alaphZ);
                sp.graphics.drawCircle(p.x, p.y, 4*scale);
            }
            if(ball.z - ball.radius > borderRear)
            {
                ball.z = borderRear - ball.radius;
                vz *= -1;
                sp.graphics.beginFill(0x0000ff, alaphZ+0.1);
                sp.graphics.drawCircle(p.x, p.y, 4*scale);
            }
            else if(ball.z + ball.radius < borderFront)
            {
                ball.z = borderFront + ball.radius;
                vz *= -1;
            }
        }
    }
}