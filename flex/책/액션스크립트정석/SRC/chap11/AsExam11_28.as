package
{
    import flash.display.DisplayObject;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.geom.Point;
    import flash.geom.Vector3D;
    [SWF(width=800, height=600, backgroundColor = 0xffffff)]
    public class AsExam11_28 extends Sprite
    {
        private var sp:Sprite = new Sprite();
        private var itemArr:Array = new Array();
        private var itemCnt:int = 7;
        private var boxWidth:int = 50;
        private var boxHeight:int = 100;
        private var gap:int = 50;
        
        public function AsExam11_28()
        {
        	displayMain();
            drawWings();
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        
        private function displayMain():void
        {
            sp.x = stage.stageWidth / 2;
            sp.y = stage.stageHeight / 2;
            sp.z = 0;
            this.addChild(sp);
        }
        // 사각형들을 갯수에 맞춰 왕관형태로 배치한다.
        private function drawWings():void
        {
            for(var i:uint=0; i<itemCnt; i++) 
            {
                var angle:Number = Math.PI * 2 / itemCnt * i;
                var item:Sprite = new Sprite();
                item.graphics.beginFill(Math.random()*0x1000000);
                item.graphics.drawRect(-boxWidth, -boxHeight, 2*boxWidth, 2*boxHeight);
                item.x = Math.cos(angle) * (boxHeight + gap);
                item.z = Math.sin(angle) * (boxHeight + gap);
                // x, y축으로 회전하여 왕관형태가 되도록 한다.
                item.rotationX = -45;
                item.rotationY = -360/itemCnt*i + 90 ; 
                itemArr.push(item);             
                sp.addChild(item);              
            }
            // 입체감을 부여하기 위해 sp를 5도 회전함    
            sp.rotationX = 5;
        } 
        // 마우스를 좌우로 움직이면 Y축 회전변환이 적용되어 그 방향으로 왕관 형태가 회전한다.
        private function enterFrameHandler(event:Event):void
        {
        	sp.transform.matrix3D.prependRotation((stage.stageWidth / 2 - mouseX) * 0.01, Vector3D.Y_AXIS);
            //sp.rotationY += (stage.stageWidth / 2 - mouseX) * 0.01;
            sortItems();
        }
        
        private function sortItems():void
        {
            itemArr.sort(depthSort);
            for(var i:int = 0; i < itemArr.length; i++)
            {
                sp.addChildAt(itemArr[i] as Sprite, i);
            }
        }
        
        private function depthSort(objA:DisplayObject, objB:DisplayObject):int
        {
            var posA:Vector3D = objA.transform.matrix3D.position;
            posA = sp.transform.matrix3D.deltaTransformVector(posA);
            var posB:Vector3D = objB.transform.matrix3D.position;
            posB = sp.transform.matrix3D.deltaTransformVector(posB);
            return posB.z - posA.z;
        }        
    }
}
