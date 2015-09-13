package
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.geom.Point;
    [SWF(backgroundColor=0xFFFFFF)]
    public class AsExam10_29 extends Sprite
    {
        private var myBall:MyBall = new MyBall();
        private var center:Point = new Point(150, 150);
                
        public function AsExam10_29()
        {
            this.addChild(myBall);
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
            stage.addEventListener(MouseEvent.MOUSE_MOVE, moveHandler);
        }
        // 마우스가 움직이는 위치로 회전 중심 이동                
        private function moveHandler(event:MouseEvent):void
        {
        	// 마우스를 움직이면 그래픽을 다시 그린다.
            this.graphics.clear();
            center.x = event.stageX;
            center.y = event.stageY;
        }
        // center를 중심으로 myBall을 1도씩 회전시킨다.
        private function enterFrameHandler(event:Event):void
        {
	        var radius:Number = 100;
            myBall.x = center.x + Math.cos(myBall.ang) * radius;
            myBall.y = center.y + Math.sin(myBall.ang) * radius;
            myBall.ang += Math.PI/180;
            // 회전중심과 myBall을 잇는 직선 그리기
            this.graphics.lineStyle(1, 0xFF0000);
            this.graphics.moveTo(center.x, center.y);
            this.graphics.lineTo(myBall.x , myBall.y);
        }
    }
}