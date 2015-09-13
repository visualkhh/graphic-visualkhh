package
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.geom.Matrix3D;
    import flash.geom.Point;
    import flash.geom.Vector3D;

    [SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
    public class AsExam11_20 extends Sprite
    {
        private var inc:Number = 0;
        private var mt3:Matrix3D = new Matrix3D();       
        private var spKnite:Sprite = new Sprite();
        
        public function AsExam11_20()
        {
        	displayMain();
            addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        // 삼각형 그리기
        private function displayMain():void
        {
            spKnite.graphics.beginFill(Math.random()*0x1000000);
            spKnite.graphics.lineStyle(2, 0xFF0000);
            spKnite.graphics.moveTo(0, 0);
            spKnite.graphics.lineTo(150, 150);
            spKnite.graphics.lineTo(-150, 150);
            spKnite.graphics.lineTo(0, 0);
            this.addChild(spKnite);
        }
        // spKnite를 3D 변환
        private function enterFrameHandler(event:Event):void
        {
            var posX:Number = (mouseX - spKnite.x) * 0.01;
            var posY:Number = (mouseY - spKnite.y) * 0.01;
            var posZ:Number = Math.sin(inc += 0.01);
            // X축 회전 변환
            mt3.appendRotation(1, Vector3D.X_AXIS);
            // Y축 회전 변환
            mt3.appendRotation(1, Vector3D.Y_AXIS);
            // Z축 회전 변환
            mt3.appendRotation(1, Vector3D.Z_AXIS);
            // 마우스쪽으로 이동 변환
            mt3.appendTranslation(posX, posY, posZ);
            // 변환 적용
            spKnite.transform.matrix3D = mt3;
            // spKnite와 잇는 선 그리기
            drawLines();
        }
        // local3DToGlobal 함수를 이용하여 spKnite와 잇는 선 그리기
        private function drawLines():void
        {
        	// spKnite의 각 꼭지점에 해당하는 3D 좌표를 2D로 변환
            var p1:Point = spKnite.local3DToGlobal(new Vector3D(0, 0, 0));
            var p2:Point = spKnite.local3DToGlobal(new Vector3D(150, 150, 0));
            var p3:Point = spKnite.local3DToGlobal(new Vector3D(-150, 150, 0));
            // 마우스 위치와 p1, p2, p3와 잇는 선 그리기
            this.graphics.clear();
            this.graphics.lineStyle(2, 0xFF0000);
            this.graphics.moveTo(p1.x, p1.y);
            this.graphics.lineTo(mouseX, mouseY);
            this.graphics.moveTo(p2.x, p2.y);
            this.graphics.lineTo(mouseX, mouseY);
            this.graphics.moveTo(p3.x, p3.y);
            this.graphics.lineTo(mouseX, mouseY);
        }
    }
}