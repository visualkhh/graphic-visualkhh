package
{
    import flash.display.Sprite;
    import flash.events.Event;
    
    [SWF(width=800, height=600, backgroundColor=0xffffff)]
    public class AsExam11_13 extends Sprite
    {
        private var sp:Sprite = new Sprite();
        private var angle:Number = 0.05;
        // 회전 중심 좌표
        private var centerX:Number = stage.stageWidth/2;
        private var centerY:Number = stage.stageHeight/2;
        // 회전축 길이, z 깊이
        private var centerZ:Number = 100;
        private var ballsArr:Array=new Array();
        private var numBalls:uint = 50;
        // 회전축 z 깊이를 조절하기 위한 컨트롤
        protected var ns:AsExam8_NumericStepper = new AsExam8_NumericStepper(-1000, 1000, 100, "Z축 깊이", "ns1", 500);                
        public function AsExam11_13()
        {
            displayMain();
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        // numBalls갯수만큼 공을 화면에 추가한다.
        private function displayMain():void
        {
            this.addChild(ns);
            ns.x = centerX;
            ns.y = 100;        	
            for(var i:int = 0; i < numBalls; i++)
            {
                var ball:My3DBall = new My3DBall(15, Math.random()*0x1000000);
                ballsArr.push(ball);
                ball.posX = Math.random() * 200 - 100 ;
                ball.posY = Math.random() * 200 - 100;
                ball.posZ = Math.random() * 200 - 100;
                this.addChild(ball);
            }
        }
        // ballsArr에 있는 My3DBall을 y축 회전변환한다.
        private function enterFrameHandler(event:Event):void
        {
            for(var i:int = 0; i < numBalls; i++)
            {
                var ball:My3DBall = ballsArr[i];
                rotateFL(angle, ball);
            }            
        }
        // 삼각함수를 이용한 Y축 회전변환
        private function rotateFL(angle:Number, myBall:My3DBall):void 
        {
            var cos:Number = Math.cos(angle);
            var sin:Number = Math.sin(angle);
            var dx:Number = myBall.posX;
            var dz:Number = myBall.posZ;
            var distX:Number = cos * dx - sin * dz;
            var distZ:Number = cos * dz + sin * dx;
            myBall.posX = distX;
            myBall.posZ = distZ;
            // 회전축 깊이에 따른 스케일값 계산
            centerZ = ns.selectedNumber;               
            var fl:Number = root.transform.perspectiveProjection.focalLength;
            var scale:Number = fl / (fl + centerZ);     
            myBall.scaleX = myBall.scaleY = scale;
            myBall.x = centerX + myBall.posX * scale;
            myBall.y = centerY + myBall.posY * scale;                
        }
    }
}