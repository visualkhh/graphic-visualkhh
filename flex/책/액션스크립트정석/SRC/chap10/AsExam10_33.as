package
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    [SWF(backgroundColor=0xffffff)]
    public class AsExam10_33 extends Sprite
    {
        // 그래프의 최고 높이 (Y축 최대값)
        private var maxHeight:Number = 100;
        // x축 속도
        private var vx:Number = 1;
        // y축 각속도 (5도)
        private var vy:Number = 5*Math.PI/180;
        // 파동이 그려내는 xy 좌표 
        private var posX:Number=0;
        private var posY:Number=0;
        private var myBall:MyBall = new MyBall(10, 0x1BE955, true);
        private var nsX:AsExam8_NumericStepper = new AsExam8_NumericStepper(0, 10, 1, "X축 속도(파장)", "nsx", 1);
        private var nsY:AsExam8_NumericStepper = new AsExam8_NumericStepper(5, 20, 1, "Y축 속도(진동수)", "nsy", 5);
        private var nsH:AsExam8_NumericStepper = new AsExam8_NumericStepper(0, 1000, 10, "Y축 최대값(진폭)", "nsh", 100);
        // 그래프가 잘 보이도록 200픽셀 정도 아래부터 화면을 그리도록 한다.
        private var startPointY:Number = 200;
        
        public function AsExam10_33()
        {
            initGraph();
            displayMain();
            addEventHandlers();
        }
        // sin 함수 그래프와 공의 위치를 초기화 함
        private function initGraph():void
        {
            this.graphics.clear();
            this.graphics.lineStyle(1, 0xFF0000);
            // 화면의 하단부 (y=200)에서 그래프를 시작
            this.graphics.moveTo(0, startPointY);
            myBall.ang = 0;
            posX = 0;
            posY = 0;
            myBall.x = posX;
            myBall.y = posY;            
        }        
        
        private function displayMain():void
        {
            this.addChild(myBall);          
            this.addChild(nsX);
            this.addChild(nsY);
            this.addChild(nsH);
            nsX.y = 10;
            nsY.y = 30;
            nsH.y = 50; 
        }
        
        private function addEventHandlers():void
        {
            nsX.addEventListener("numberChanged", numberChangedHandler);    
            nsY.addEventListener("numberChanged", numberChangedHandler);    
            nsH.addEventListener("numberChanged", numberChangedHandler);    
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        
        public function enterFrameHandler(event:Event):void 
        {
        	// 각속도를 증가
            myBall.ang += vy;
            // x축 속도 증가 
            posX += vx;
            // y축 속도 증가 
            posY = startPointY + Math.sin(myBall.ang) * maxHeight;
            // 공을 회전 각속도에 따라 방향을 회전함
            myBall.rotation = Math.atan((posY-myBall.y)/vx)*180/Math.PI;
            // 계산된 위치로 공을 이동
            myBall.x = posX;
            myBall.y = posY;
            // 계산된 위치를 따라 그래프를 그린다.
            this.graphics.lineTo(posX, posY);
        }
        
        private function numberChangedHandler(event:MouseEvent):void
        {       
        	// 컨트롤 값을 바꾸면 그래프를 다시 그린다.
            initGraph();
            vx = nsX.selectedNumber;
            vy = nsY.selectedNumber * Math.PI/180;
            maxHeight = nsH.selectedNumber;
        }       
    }
}