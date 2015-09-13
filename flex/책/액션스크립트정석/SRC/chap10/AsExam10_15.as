package
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.events.MouseEvent;
    import flash.ui.Keyboard;
    [SWF(backgroundColor=0xFFFFFF)]
    public class AsExam10_15 extends Sprite
    {
        private var myBall:MyBall= new MyBall();   
        // x, y축 방향 속도
        private var vx:Number = 0;
        private var vy:Number = 0;
        // x, y축 방향 가속도
        private var ax:Number = 0;
        private var ay:Number = 0;
        // 체크하면 x축, y축 방향 속도가 합쳐진다.
        private var checkBox:AsExam8_CheckBox = new AsExam8_CheckBox("XY속도 모두 적용", "ch_xy");
        
        public function AsExam10_15()
        {
            displayMain();
            addEventHandlers();
        } 
        
        private function displayMain():void
        {
            this.addChild(myBall);
            this.addChild(checkBox);
            myBall.x = myBall.y = 50;
        }
        
        private function addEventHandlers():void
        {
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
            stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
            stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);         
        }
        // 상하좌우 키보드를 누르면 가속도를 + 또는 - 값으로 설정
        // xy 속도 모두 적용에 체크가 안되어 있으면 다른 방향의 속도는 0으로 설정
        private function keyDownHandler(event:KeyboardEvent):void
        {
            switch(event.keyCode)
            {
                case Keyboard.LEFT :
                    ax = -0.2;
                    if(!checkBox.checkboxEnabled) vy = 0;
                break;

                case Keyboard.RIGHT :
                    ax = 0.2;
                    if(!checkBox.checkboxEnabled) vy = 0;
                break;
                
                case Keyboard.UP :
                    ay = -0.2;
                    if(!checkBox.checkboxEnabled) vx = 0;
                break;
                
                case Keyboard.DOWN :
                    if(!checkBox.checkboxEnabled) vx = 0;
                    ay = 0.2;
                break;
            }
        }
        // 키보드를 놓으면 가속도값을 0으로 변경한다 
        private function keyUpHandler(event:KeyboardEvent):void
        {
            ax = 0;
            ay = 0;
        }
        // 속도에 가속도를 적용하여 myBall을 움직인다. 
        private function enterFrameHandler(event:Event):void
        {
            vx += ax;
            vy += ay;
            myBall.x += vx;
            myBall.y += vy;     
        }           
    }
}