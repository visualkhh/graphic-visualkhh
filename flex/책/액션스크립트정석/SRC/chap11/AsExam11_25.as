package
{
    import flash.display.DisplayObject;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.geom.Point;
    import flash.geom.Vector3D;    
    
    [SWF(width=800, height=600, backgroundColor = 0xffffff)]
    public class AsExam11_25 extends Sprite
    {
        private var sp:Sprite = new Sprite();
        private var itemArr:Array = new Array();
        private var itemCnt:int = 20;
        private var boxWidth:int = 100;
        private var boxHeight:int = 50;
        private var gap:int = 50;
                
        public function AsExam11_25()
        {
        	displayMain();
            drawObjects();
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);       
        }
        
        private function displayMain():void
        {
            sp.x = stage.stageWidth / 2;
            sp.y = stage.stageHeight / 2;
            sp.z = 100;         
            this.addChild(sp);
            // fieldOfView을 90으로 조절 
        //    root.transform.perspectiveProjection.fieldOfView = 90; 
        }
        // sp에 아이템 추가
        private function drawObjects():void
        {
            for(var i:uint=0; i<itemCnt; i++) 
            {
                var item:Sprite = new Sprite();
                item.graphics.beginFill(Math.random()*0x1000000);
                item.graphics.drawRect(-boxWidth, -boxHeight, 2*boxWidth, 2*boxHeight);
                item.graphics.endFill();
                item.y = i*gap;  
                item.z = 10;
                // x축으로 89도 회전
                item.rotationX = 89;
                itemArr.push(item);             
                sp.addChild(item);            
            }              
            // sp 자체를 -80도 회전함
            sp.rotationX = -80;
        }
        // z축에 대한 이동 변환 
        private function enterFrameHandler(event:Event):void
        {
            sp.transform.matrix3D.appendTranslation(0, 0, ((mouseY - sp.z) * 0.1));
            //sp.z += (mouseY - sp.z) * 0.1;
            sortItems(Array.NUMERIC );
        }
        // y축 값에 따라 정렬함 
        private function sortItems(ch:int):void
        {
            itemArr.sortOn("y", ch);
            for(var i:int = 0; i < itemArr.length; i++)
            {
                sp.addChildAt(itemArr[i] as Sprite, i);
            }
        }
    }
}