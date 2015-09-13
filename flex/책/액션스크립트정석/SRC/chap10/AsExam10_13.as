package
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.text.TextField;
    [SWF(backgroundColor=0xFFFFFF)]
    public class AsExam10_13 extends Sprite
    {
    	// myBall의 속도 (x축 방향으로 1)
        private var vx:Number = 1;
        // myBall의 가속도 
        private var ax:Number = 0;
        // 꼬리가 달린 공을 추가한다. 꼬리는 진행 방향 표시를 위함 
        private var myBall:MyBall = new MyBall(20, Math.random()*1000000, true);
        // 가속 운동의 진행방향을 결정하는 변수로 -1 또는 1을 가진다.
        private var direction:int = 1;
        // 속도와 가속도를 표시하기 위한 텍스트 필트
        private var tf:TextField = new TextField();
        public function AsExam10_13()
        {
            displayMain();
            addEventHandlers();
        }
        
        private function displayMain():void
        {
            myBall.x = myBall.y = 100;
            this.addChild(myBall);
            tf.autoSize = "left";
            this.addChild(tf);
        }
        
        private function addEventHandlers():void
        {
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
            stage.addEventListener(MouseEvent.CLICK, clickHandler);
        }
        // 화면을 클릭하면 가속도가 반대로 바뀐다. 
        private function clickHandler(event:MouseEvent):void
        {
        	// 클릭하면 1 또는 -1이 된다.
            direction *= -1;
            // 0.1 또는 -0.1이 된다.
            ax = direction*0.1;
            // 공도 반대방향으로 회전한다.
            myBall.rotation += 180*direction;   
        }

        private function enterFrameHandler(event:Event):void
        {
        	// vx에 ax를 더하여 가속도를 구현한다.
            vx += ax;
            myBall.x += vx;
            tf.text = "가속도: " + ax + " 속도: " + Math.round(vx*10)/10;
        }       
    }
}