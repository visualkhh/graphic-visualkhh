package
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.geom.Point;
    [SWF(backgroundColor=0xffffff)]
    public class AsExam10_31 extends Sprite
    {
        private var myBall:MyBall = new MyBall();
        // 회전 중심점
        private var center:Point = new Point(100, 100);
        // 회전 방향 결정을 위한 플래그
        private var directionFlag:Boolean;
        // 1도에 대한 라디안값을 저장하는 상수
        private const cos:Number = Math.cos(Math.PI/180);
        private const sin:Number = Math.sin(Math.PI/180);        
        public function AsExam10_31()
        {
        	displayMain();
        	addEventHandlers();
        }
        // 공을 화면에 추가하고 공을 잇는 선을 그린다.
        private function displayMain():void
        {
            myBall.x = myBall.y = 50;
            this.addChild(myBall);
            drawLine();
        }
        // 중심과 공을 잇는 선을 그린다.
        private function drawLine():void
        {
        	this.graphics.clear();
            this.graphics.lineStyle(1, 0xFF0000);
            this.graphics.moveTo(center.x , center.y);
            this.graphics.lineTo(myBall.x , myBall.y);
        }
        
        private function addEventHandlers():void
        {
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
            stage.addEventListener(MouseEvent.CLICK, clickHandler);
        }
        // 화면을 클릭하면 회전 방향이 바뀐다.
        private function clickHandler(event:MouseEvent):void
        {
            directionFlag = !directionFlag;	
        	drawLine();
        }
        // 회전 방향에 따라 turnLeft, turnRight 함수 호출
        private function enterFrameHandler(event:Event):void
        {
        	if(directionFlag)
        	{
        		turnLeft();
        	}
        	else
        	{
        		turnRight();
        	}
        }
        // 삼각함수를 이용해 우측으로 회전
        private function turnRight():void
        {
            var dx:Number = myBall.x - center.x;
            var dy:Number = myBall.y - center.y;
            var distX:Number = cos * dx - sin * dy;
            var distY:Number = cos * dy + sin * dx;
            myBall.x = center.x + distX;
            myBall.y = center.y + distY;                
            this.graphics.lineTo(myBall.x , myBall.y);
        }
        // 삼각함수를 이용해 좌측으로 회전
        private function turnLeft():void
        {
            var dx:Number = myBall.x - center.x;
            var dy:Number = myBall.y - center.y;
            var distX:Number = cos * dx + sin * dy;
            var distY:Number = cos * dy - sin * dx;
            myBall.x = center.x + distX;
            myBall.y = center.y + distY;                
            this.graphics.lineTo(myBall.x , myBall.y);
        }
    }
}