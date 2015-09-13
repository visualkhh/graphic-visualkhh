package
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;

    [SWF(width=800, height=600, backgroundColor = 0xffffff)]
    public class AsExam11_14 extends Sprite
    {
        private var ballsArr:Array = new Array();
        private var ballsNum:int = 1000;
        public function AsExam11_14()
        {
            createBalls();
            stage.addEventListener(MouseEvent.CLICK, clickHandler);
            stage.addEventListener(Event.ENTER_FRAME, enterframeHandler);
        }
        // MyBall 100개를 화면에 골고루 추가함
        private function createBalls():void
        {
            for(var i:int = 0; i < ballsNum; i++)
            {
                var ball:MyBall = new MyBall(15, Math.random()*0x1000000);
                ballsArr.push(ball);
                ball.x = Math.random() * stage.stageWidth;
                ball.y = stage.stageHeight/2 + 100;
                ball.z = Math.random() * 5000;
                addChild(ball);
            }
        }
        // 화면을 클릭하면 Z축값에 대한 정렬
        private function clickHandler(event:MouseEvent):void
        {
            ballsArr.sortOn("z", Array.NUMERIC | Array.DESCENDING);
            for(var i:uint = 0; i < ballsNum; i++)
            {
            	// 공이 z축 값에 따라 화면 위에 오도록 함
                addChild(ballsArr[i]);
            }
        }
        // 마우스위치에 따라 fieldOfView값 변경
        private function enterframeHandler(event:Event):void
        {
            root.transform.perspectiveProjection.fieldOfView = mouseY/stage.stageHeight*180;
        }       
    }
}