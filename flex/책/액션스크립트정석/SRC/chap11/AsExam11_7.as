package
{
    import flash.display.Shape;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.geom.Point;
    import flash.text.TextField;
    [SWF(width=800, height=600, backgroundColor = 0xffffff)]
    public class AsExam11_7 extends Sprite
    {
        public function AsExam11_7()
        {
            displayMain();
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        // 텍스트필드 50개를 z축 값을 다르게 하여 배치함 
        private function displayMain():void
        {
            var position:int = 25;
            var depth:int = 20; 
            for (var i:int = 0; i < 50; i++) 
            { 
                this.addChild(createBox(stage.stageWidth/2, stage.stageHeight/2, (position - i) * depth)); 
            } 
        }
        // 텍스트필드를 생성함 
        private function createBox(xPos:int, yPos:int, zPos:int):TextField
        { 
            var box:TextField = new TextField(); 
            box.text = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"; 
            box.x = xPos; 
            box.y = yPos; 
            box.z = zPos; 
            return box; 
        } 
        // 마우스의 위치로 projectionCenter값을 설정함 
        private function enterFrameHandler(event:Event):void
        {
            root.transform.perspectiveProjection.projectionCenter = new Point(mouseX, mouseY);          
        }
    }
}