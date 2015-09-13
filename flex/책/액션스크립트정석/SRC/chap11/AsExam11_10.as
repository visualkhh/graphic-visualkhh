package 
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    [SWF(width=800, height=600, backgroundColor=0xffffff)]
    public class AsExam11_10 extends Sprite
    {
        private var ballsArr:Array=new Array();
        private var numBalls:uint = 100;
        private var sp:Sprite = new Sprite();
        // sp를 회전하기 위한 각도를 저장하는 변수
        private var rotateAmt:Number = 0;
        private var baseX:Number = stage.stageWidth/2;
        private var baseY:Number = stage.stageHeight/2;
        private var baseZ:Number = 500;
        // 회전방향을 결정하는 플래그변수로 마우스를 클릭하면 값이 바뀜
        private var rotaionDirectionFlag:Boolean = true;
        
        public function AsExam11_10()
        {
            displayMain();  
            addEventHandlers();
        }
        // sp에 100개의 공을 추가하고 sp를 화면에 추가한다. 
        private function displayMain():void
        {
            for(var i:int = 0; i < numBalls; i++)
            {
                var ball:MyBall = new MyBall(15, Math.random()*0x1000000);
                ballsArr.push(ball);
                ball.x = Math.random() * baseX + baseX/2;
                ball.y = Math.random() * baseY;// - baseY;
                ball.z = Math.random() * baseZ;
                sp.addChild(ball);
            }
            this.addChild(sp);
            sp.x = 0;
            sp.y = baseY;
            sp.z = baseZ;
        }

        private function addEventHandlers():void
        {
            stage.addEventListener(Event.ENTER_FRAME, enterframeHandler);
            stage.addEventListener(MouseEvent.CLICK, clickHandler);
        }
        // 화면을 클릭하면 변수값이 바뀜
        private function clickHandler(event:MouseEvent):void
        {
            rotaionDirectionFlag = !rotaionDirectionFlag;   
        }
        // rotaionDirectionFlag값에 따라 x축 또는 y축 회전 변환
        private function enterframeHandler(event:Event):void
        {
            if(rotaionDirectionFlag)
            {
                rotateX();
            } else {
                rotateY();
            } 
        }           
        // x축 회전 변환
        private function rotateX():void
        {
            sp.x = Math.cos(rotateAmt) * baseX/2;
            sp.z = Math.sin(rotateAmt) * baseZ/2;
            rotateAmt += 0.05;                  
        }
        // y축 회전 변환
        private function rotateY():void
        {
            sp.y = Math.sin(rotateAmt) * baseY/2;
            sp.z = Math.cos(rotateAmt) * baseZ/2;
            rotateAmt += 0.05;                  
        }
    }
}
