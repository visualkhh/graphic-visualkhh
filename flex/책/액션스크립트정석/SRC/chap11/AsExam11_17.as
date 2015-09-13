package
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.geom.Matrix3D;
    import flash.geom.Point;
    import flash.geom.Vector3D;
    [SWF(backgroundColor=0xFFFFFF)]
    public class AsExam11_17 extends Sprite
    {
        private var sp1:Sprite = new Sprite();
        private var sp2:Sprite = new Sprite();
        
        public function AsExam11_17()
        {
            displayMain();
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
            matrix3DUseCase1();
            matrix3DUseCase2();
        }
        
        private function displayMain():void
        {
            this.addChild(sp1);
            this.addChild(sp2);
            sp1.graphics.beginFill(0xFF0000);
            sp1.graphics.drawRect(0, 0, 100, 100);
            sp2.graphics.beginFill(0x00FF00);
            sp2.graphics.drawRect(0, 0, 100, 100);
            sp1.x = sp2.x = 0;
            sp1.y = sp2.y = 0;
        }
        
        private function enterFrameHandler(event:Event):void
        {
            // z 값이 0이 아닌 객체만 
            root.transform.perspectiveProjection.projectionCenter = new Point(mouseX, mouseY);
        }
        // 회전 변환 후 이동 변환
        private function matrix3DUseCase1():void
        {
            sp1.z = 0; // z값을 주지 않으면 에러 발생
            sp1.transform.matrix3D.appendRotation(90, Vector3D.X_AXIS);
            sp1.transform.matrix3D.appendTranslation(10, 10, 10);
        }
        // 이동 변환 후 회전 변환
        private function matrix3DUseCase2():void
        {
            sp2.z = 0; // z값을 주지 않으면 에러 발생
            sp2.transform.matrix3D.appendTranslation(10, 10, 10);
            sp2.transform.matrix3D.appendRotation(90, Vector3D.X_AXIS);
        }
    }
}