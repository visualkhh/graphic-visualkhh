package
{
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import flash.geom.Matrix3D;
    import flash.geom.Vector3D;
    [SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
    public class AsExam11_18 extends Sprite
    {
        private var sp1:Sprite = new Sprite();
        private var sp2:Sprite = new Sprite();
        public function AsExam11_18()
        {
            displayMain();
            stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
        }
        
        private function displayMain():void
        {
            this.addChild(sp1);
            this.addChild(sp2);
            // 타원 그리기 1
            sp1.graphics.beginFill(0x00FF00);
            sp1.graphics.lineStyle(2, 0xFF0000);
            sp1.graphics.drawEllipse(-50, -40, 100, 80);
            sp1.graphics.endFill();
            // 타원 그리기 2
            sp2.graphics.beginFill(0xFFFF00);
            sp2.graphics.lineStyle(2, 0x0000FF);
            sp2.graphics.drawEllipse(-50, -40, 100, 80);
            sp2.graphics.endFill();
            sp1.x = sp2.x =  (this.stage.stageWidth / 2);
            sp1.y = sp2.y =  (this.stage.stageHeight / 2);
            sp1.z = sp2.z = 1;            
        }
        // 마우스가 움직이면 sp1, sp2를 X축 회전 변환 
        private function mouseMoveHandler(event:MouseEvent):void 
        {
            var rotationAmt:int;
            if(event.localY > sp1.y) 
            {
                rotationAmt = (Math.round(event.localY) / 100);
            } else {
                rotationAmt = -(Math.round(event.localY) / 100);
            }           
            // 회전에 회전이 붙어 회전반경이 커짐 
            sp1.transform.matrix3D.appendRotation(rotationAmt, Vector3D.X_AXIS);
            // 제자리에서 회전
            sp2.transform.matrix3D.prependRotation(rotationAmt, Vector3D.X_AXIS);
        }
    }
}
