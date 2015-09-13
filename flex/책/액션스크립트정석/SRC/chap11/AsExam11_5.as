package
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.display.GradientType;
    import flash.geom.Matrix;       
    [SWF(width=800, height=600, backgroundColor = 0xffffff)]
    public class AsExam11_5 extends Sprite
    {
        private var sp:Sprite = new Sprite();
        public function AsExam11_5()
        {
            drawRainbow();
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        // 마우스의 위치에 따라 sp를 x축 또는 y축 방향으로 회전시킨다.
        private function enterFrameHandler(event:Event):void
        {
            sp.rotationX = (stage.stageWidth/2 - mouseY);
            sp.rotationY = (stage.stageHeight/2 - mouseX);
        }       
        // 무지개 그라데이션 생성
        private function drawRainbow():void 
        {
            var gradientBoxMatrix:Matrix = new Matrix();
            gradientBoxMatrix.createGradientBox(150, 0, 0, 25, 0);
            sp.graphics.beginGradientFill(GradientType.LINEAR, 
               [0xff0000, 0xffa500, 0xffff00, 0x008000, 0x0000ff, 0x4B0082, 0x800080], 
               [1, 1, 1, 1, 1, 1, 1], 
               [0, 32, 64, 128, 170, 210, 255], 
            gradientBoxMatrix);
            sp.graphics.drawRect(0, 0, 150, 150);
            this.addChild(sp);
            sp.x = stage.stageWidth/2 - sp.width/2;
            sp.y = stage.stageHeight/2 - sp.height/2;           
        }        
    }
}