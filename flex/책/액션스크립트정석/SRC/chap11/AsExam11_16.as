package
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.geom.Matrix3D;
    import flash.geom.Point;
    import flash.geom.Vector3D;
    [SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
    public class AsExam11_16 extends Sprite
    {
        private var sp1:Sprite = new Sprite();
        private var sp2:Sprite = new Sprite();
        private var sp3:Sprite = new Sprite();
        public function AsExam11_16()
        {
            displayMain();
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
            matrix3DUseCase1();
            matrix3DUseCase2();
            matrix3DUseCase3();
        }
        // sp1, sp2, sp3를 그려서 화면에 추가 & 배치함
        private function displayMain():void
        {
            this.addChild(sp1);
            this.addChild(sp2);
            this.addChild(sp3);
            sp1.graphics.beginFill(0xFF0000);
            sp1.graphics.drawRect(0, 0, 100, 100);
            sp2.graphics.beginFill(0x00FF00);
            sp2.graphics.drawRect(0, 0, 100, 100);
            sp3.graphics.beginFill(0x0000FF);
            sp3.graphics.drawRect(0, 0, 100, 100);
            sp1.x = 0;
            sp2.x = 150;
            sp3.x = 300;
            sp1.y = sp2.y = sp3.y = 300;
        }
        
        // z 값이 0이 아닌 객체에 대해서 projectionCenter값 적용 
        private function enterFrameHandler(event:Event):void
        {
            root.transform.perspectiveProjection.projectionCenter = new Point(mouseX, mouseY);
        }
        // sp1에 대해 x축 방향으로 90도 회전
        private function matrix3DUseCase1():void
        {
            sp1.z = 0; // z값을 주지 않으면 에러 발생
            sp1.transform.matrix3D.appendRotation(90, Vector3D.X_AXIS);
        }
        // sp2에 대해 x축으로 1.2배 확대, y축으로 0.5베 확대 변환 적용
        private function matrix3DUseCase2():void
        {
            var m:Matrix3D = new Matrix3D();
            var tempRawData:Vector.<Number> = new Vector.<Number>;
            tempRawData.push( 1.2, 0, 0, 0,  0, 0.5, 0, 0,   0, 0, 1, 0,  0, 0, 0, 1 );
            m.rawData = tempRawData;
            // z값을 주지 않으면 에러가 발생한다.
            // projectionCenter 값에 반응하도록 충분히 깊은 z값을 설정함
            sp2.z = 500;
            // 기존의 매트릭스값에 추가함 
            sp2.transform.matrix3D.append(m);
        }
        // sp3에 대해 x축으로 1.2배 확대, y축으로 0.5베 확대 변환 적용
        private function matrix3DUseCase3():void
        {
            var m:Matrix3D = new Matrix3D();
            var tempRawData:Vector.<Number> = new Vector.<Number>;
            tempRawData.push( 1.2, 0, 0, 0, 0, 0.5, 0, 0, 0, 0, 1, 0,  0, 0, 0, 1 );
            m.rawData = tempRawData;
            sp3.z = 500;
            // 새로운 매트릭스값을 설정하므로 위의 z좌표 설정은 무시됨
            sp3.transform.matrix3D = m;
        }
    }
}