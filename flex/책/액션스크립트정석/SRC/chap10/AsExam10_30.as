package
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.geom.Point;
    [SWF(backgroundColor=0xffffff)]
    public class AsExam10_30 extends Sprite
    {
        private var myBall:MyBall = new MyBall();
        // 타원을 그리기 위한 x, y축 반경
        private var radiusX:Number = 120;
        private var radiusY:Number = 90;
        // 5도씩 회전하도록 설정
        private var angleAmt:Number = 5*Math.PI/180;
        // 회전 중심점
        private var center:Point = new Point(150, 150);
                
        public function AsExam10_30()
        {
            this.addChild(myBall);
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
            stage.addEventListener(MouseEvent.MOUSE_MOVE, moveHandler);
        }
        // 마우스를 움직이면 타원의 회전반경을 변경한다.      
        private function moveHandler(event:MouseEvent):void
        {
            radiusX = center.x - event.stageX;
            radiusY = center.y - event.stageY;
            this.graphics.clear();
        }
        // 타원의 회전반경에 따라 공을 움직이고, 그 위치에 궤적을 그린다.
        private function enterFrameHandler(event:Event):void
        {
            this.graphics.lineStyle(0.1, 0xFF0000);
            this.graphics.moveTo(myBall.x , myBall.y);  
            myBall.x = center.x + Math.cos(myBall.ang) * radiusX;
            myBall.y = center.y + Math.sin(myBall.ang) * radiusY;
            // 회전각도를 증가시킨다.
            myBall.ang += angleAmt;
            this.graphics.lineTo(myBall.x , myBall.y);
            this.graphics.moveTo(center.x, center.y);
            this.graphics.lineTo(myBall.x , myBall.y);          
        }
    }
}