package
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.geom.Point;
    [SWF(width=800, height=600, backgroundColor = 0xffffff)]
    public class AsExam11_2 extends Sprite
    {
        private var sp:Sprite = new Sprite();
        public function AsExam11_2()
        {
            displayMain();
            drawObjects();
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        
        private function displayMain():void
        {
            sp.x = stage.stageWidth / 2;
            sp.y = stage.stageHeight / 2;
            this.addChild(sp);
        }
        
        private function drawObjects():void
        {
            for(var i:uint=0; i<10; i++) 
            {
                var item:Sprite = new Sprite();
                item.graphics.beginFill(Math.random()*0x1000000);
                item.graphics.drawRect(-50, -50, 100, 100);
                item.x = i*10;
                item.y = i*10;    
                // z좌표를 설정
                item.z = -i*10;
                sp.addChild(item);            
            }              
        }       
        
        private function enterFrameHandler(event:Event):void
        {
        	// 마우스가 움직이면 투영지점을 옮긴다.
            root.transform.perspectiveProjection.projectionCenter = new Point(mouseX, mouseY);   
        }        
    }
}