package
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.geom.Vector3D; 
    
    [SWF(width=800, height=600, backgroundColor = 0xffffff)]
    public class AsExam11_26 extends Sprite
    {
        private var sp:Sprite = new Sprite();
        private var itemArr:Array = new Array();
        private var itemCnt:int = 7;
        private var boxWidth:int = 50;
        private var boxHeight:int = 100;
        private var gap:int = 50;
        
        public function AsExam11_26()
        {
        	displayMain();
            drawWings();
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        
        private function displayMain():void
        {
            sp.x = stage.stageWidth / 2;
            sp.y = stage.stageHeight / 2;
            // 3D 변환을 위해 z좌표값 설정
            sp.z = 0;
            this.addChild(sp);
        }

        private function drawWings():void
        {
            for(var i:uint=0; i<itemCnt; i++) 
            {
            	// 아이템수에 따라 360도를 적절히 나눔 
                var angle:Number = Math.PI * 2 / itemCnt * i;
                var item:Sprite = new Sprite();
                item.graphics.beginFill(Math.random()*0x1000000);
                item.graphics.drawEllipse(-boxWidth, -boxHeight, 2*boxWidth, 2*boxHeight);
                item.graphics.endFill();
                // 각도에 따라 아이템의 x, y 좌표값 설정
                item.x = Math.cos(angle) * (boxHeight + gap);
                item.y = Math.sin(angle) * (boxHeight + gap);
                // 아이템을 각도에 맞게 회전함
                item.rotationZ = 360/itemCnt*i + 90; 
                itemArr.push(item);             
                sp.addChild(item);              
            }   
        } 
        
        private function enterFrameHandler(event:Event):void
        {
        	// 3D 변환 적용
            sp.transform.matrix3D.prependRotation(-(stage.stageWidth / 2 - mouseX) * 0.01, Vector3D.Z_AXIS);
            //sp.rotationZ += -(stage.stageWidth / 2 - mouseX) * 0.01;
            // rotationZ 는 rotation과 같음 
            //sp.rotation += -(stage.stageWidth / 2 - mouseX) * 0.01;
        }
    }
}
