package
{
    import flash.display.Sprite;
    import flash.events.Event;
    
    [SWF(width=800, height=600, backgroundColor=0xffffff)]
    public class AsExam11_11 extends Sprite
    {
        protected var angle:Number = 0.05;
        // MyBall을 확장하여 3D 변환을 위한 좌표가 추가된 클래스
        protected var myBall:My3DBall = new My3DBall();
        // 회전 중심 좌표
        protected var centerX:Number = stage.stageWidth/2; 
        protected var centerY:Number = stage.stageHeight/2;
        // 회전축의 z 깊이
        protected var centerZ:Number;      
        // 회전축 z 깊이를 조절하기 위한 컨트롤
        protected var ns:AsExam8_NumericStepper = new AsExam8_NumericStepper(-1000, 1000, 100, "Z축 깊이", "ns1", 500);
        public function AsExam11_11()
        {
            displayMain();
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        
        private function displayMain():void
        {
            this.addChild(myBall);
            // myBall의 중심(centerX, centerY)에서의 거리
            // 이 값을 이용해 삼각함수 회전변환을 하여 xy좌표을 계산한다.  
            myBall.posX = 100;
            myBall.posY = 100;
            myBall.posZ = 50;
            this.addChild(ns);
            ns.x = centerX;
            ns.y = 100;
        }
        
        private function enterFrameHandler(event:Event):void
        {
            rotateFL(angle);
        }
        // Z축 회전 변환
        protected function rotateFL(angle:Number):void
        {
        	// 0.05 라디안씩 회전하도록 삼각함수값 계산
            var cos:Number = Math.cos(angle);
            var sin:Number = Math.sin(angle);
            // x, y축상 떨어진 거리
            var dx:Number = myBall.posX;
            var dy:Number = myBall.posY;
            // 삼각함수 회전 변환
            var distX:Number = cos * dx - sin * dy;
            var distY:Number = cos * dy + sin * dx;
            // 새로 계산된 거리값을 posX, posY에 할당
            myBall.posX = distX;
            myBall.posY = distY;
            // 초점 거리 값
            var fl:Number = root.transform.perspectiveProjection.focalLength;
            // 회전축 깊이에 따른 스케일값 계산
            centerZ = ns.selectedNumber;
            var scale:Number = fl / (fl + centerZ);     
            // 스케일값을 myBall에 반영  
            myBall.scaleX = myBall.scaleY = scale;
            // myBall의 위치를 스케일, 거리를 이용해 계산
            myBall.x = centerX + myBall.posX * scale;
            myBall.y = centerY + myBall.posY * scale;
            drawCenterLine();
        }
        
        // 중심과 잇는 선을 그리는 함수
        protected function drawCenterLine():void
        {    
            this.graphics.clear();
            this.graphics.beginFill(0xff0000);
            this.graphics.drawCircle(centerX, centerY, 3);
            this.graphics.lineStyle(1, 0xFF0000);
            this.graphics.moveTo(centerX, centerY);
            this.graphics.lineTo(myBall.x, myBall.y);
        }
    }
}