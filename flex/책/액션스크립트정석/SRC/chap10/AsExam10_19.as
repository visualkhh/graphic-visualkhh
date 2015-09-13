package
{
    import flash.display.Sprite;
    import flash.events.Event;
    [SWF(backgroundColor=0xFFFFFF)]
    public class AsExam10_19 extends Sprite
    {
    	// 공의 위치를 컨트롤하기 위해 배열에 담는다. 
        private var ballsArr:Array = new Array();
        // 마우스 체이서에 사용할 공의 갯수
        private var numBalls:Number = 10;
        // 이징 계수
        private var easing:Number = 0.3;
        
        public function AsExam10_19()
        {
        	displayMain();
        	addEventHandlers();
        }
        // 공의 갯수만큼 MyBall을 생성하고 배열과 화면에 추가한다.
        private function displayMain():void
        {
            for(var i:uint = 0; i < numBalls; i++)
            {
                var ball:MyBall = new MyBall(10, Math.random()*0x1000000);
                this.addChild(ball);
                ballsArr.push(ball);
            }
        }
        // 엔터프레임 이벤트 핸들러 함수 등록
        private function addEventHandlers():void
        {
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        // 배열에 있는 공들을 이징을 적용하여 마우스 위치로 움직인다.
        private function enterFrameHandler(event:Event):void
        {
        	// 맨위의 공은 마우스 위치로 바로 움직인다.
            moveBall(ballsArr[numBalls-1], mouseX, mouseY);
            // 나머지 공들은 차례대로 그 위의 공의 위치로 계속 움직임으로써 공이 줄줄이 따라 가도록 한다.
            for(var i:uint = numBalls-1; i > 0; i--)
            {
                var ballA:MyBall = ballsArr[i];
                var ballB:MyBall = ballsArr[i-1];
                moveBall(ballB, ballA.x, ballA.y);
            }
        }
        // 공을 이징 목표치로 움직인다.
        private function moveBall(myBall:MyBall, targetX:Number, targetY:Number):void
        {
            myBall.vx = (targetX - myBall.x) * easing;
            myBall.vy = (targetY - myBall.y) * easing;
            myBall.x += myBall.vx;
            myBall.y += myBall.vy;
        }
    }
}
