package
{
    import flash.display.Shape;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.geom.Point;
    [SWF(width=800, height=600, backgroundColor = 0xffffff)]
    public class AsExam11_6 extends Sprite
    {
        public function AsExam11_6()
        {
            displayMain();
            // 투영 중심점을 (100, 100)으로 설정
            root.transform.perspectiveProjection.projectionCenter = new Point(100, 100);
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        // 10장의 사각형(Shape)을 z 좌표를 달리하여 배치한다.
        private function displayMain():void
        {
        	// 중심이 되는 레이어의 위치, 5번째 레이어는 움직이지 않는다.
            var position:int = 5;
            // 레이어간의 간격(깊이)
            var depth:int = 50; 
            for (var i:int = 0; i < 10; i++) 
            { 
                this.addChild(createBox(stage.stageWidth/2, stage.stageHeight/2, (position - i) * depth)); 
            } 
        }
        // 랜덤한 색상의 Shape를 생성함 
        private function createBox(xPos:int, yPos:int, zPos:int):Shape
        { 
            var box:Shape = new Shape(); 
            box.graphics.lineStyle(1, 0xCCCCCC); 
            box.graphics.beginFill(Math.random()*0x1000000); 
            box.graphics.drawRect(0, 0, 100, 100); 
            box.graphics.endFill(); 
            box.x = xPos; 
            box.y = yPos; 
            box.z = zPos; 
            return box; 
        } 
        // 마우스의 움직임에 따라 fieldOfView의 값을 변경함 
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