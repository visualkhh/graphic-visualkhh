package
{
    import flash.display.Shape;
    import flash.display.Sprite;
    import flash.events.Event;
    [SWF(width=800, height=600, backgroundColor=0xffffff)]
    public class AsExam11_8 extends Sprite
    {
    	// 3D 그래픽 객체를 담을 컨테이너
        private var sp1:Sprite = new Sprite();
        // 2D 그래픽 객체를 담을 컨테이너
        private var sp2:Sprite = new Sprite();
        // 화면에 추가될 사각형들의 z축 간격
    	private var depth:Number = 20;
        public function AsExam11_8()
        {
            displayMain();
            drawRect3D();
            drawRect2D();
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);            
        }
        // 2D, 3D 그래픽 객체를 담을 컨테이너를 화면에 배치한다.
        private function displayMain():void
        {
            this.addChild(sp1);
            this.addChild(sp2);
            sp1.x = sp2.x = 10;
            sp1.y = 10;
            sp2.y = 250;
        }
        // z좌표값을 20씩 차이나도록 해서 Shape를 10개 추가한다.
        private function drawRect3D():void
        {
            for (var i:int=0; i<10; i++) 
            {
                var sh:Shape = new Shape();
                sp1.addChild(sh);
                sh.graphics.lineStyle(1, 0xFF0000);
                sh.graphics.drawRect(0, 0, 200, 200);
                sh.z = i*depth;
            } 
        }
        // 초점거리값을 이용하여 Shape의 스케일값을 변경해서 입체감을 부여한다
        private function drawRect2D():void
        {
            var fl:Number = root.transform.perspectiveProjection.focalLength; // 768.392822265625
            var scale:Number = 0;
            for (var i:int=0; i<10; i++) 
            {
                var sh:Shape = new Shape();
                sp2.addChild(sh);
                sh.graphics.lineStyle(1, 0x0000FF);
                sh.graphics.drawRect(0, 0, 200, 200);
                // depth와 fl값을 이용하여 스케일값 계산
                scale = fl / (fl + i*depth);         
                sh.scaleX = scale;
                sh.scaleY = scale;          
                // 우측하단에 사각형이 배치되도록 depth에 따른 x, y 좌표값을 계산함
                sh.x += i*(depth/2.5);
                sh.y += i*(depth/3);                
            } 
        }
        // 마우스을 움직이면 fieldOfView값이 변경되고, 3D API를 사용한 sp1에만 반영됨
        private function enterFrameHandler(event:Event):void
        {
            var fv:Number = mouseY/stage.stageHeight*180;
            if(fv > 0 && fv < 180)
            { 
                root.transform.perspectiveProjection.fieldOfView = fv;
            }
        }        
    }
}