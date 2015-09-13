package
{
    import flash.display.DisplayObject;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.geom.Point;
    import flash.geom.Vector3D;
    [SWF(width=800, height=600, backgroundColor = 0xffffff)]
    public class AsExam11_22 extends Sprite
    {
    	// 랜덤한 사각형들을 담을 배열로서 z축 정렬을 위한 배열
        private var itemArr:Array = new Array();
        // 화면에 추가될 사각형의 갯수
        private var itemCnt:int = 100;
        // 사각형의 width, height
        private var boxWidth:int = 50;
        private var boxHeight:int = 100;
        // 3D객체를 담을 컨테이너
        private var sp:Sprite = new Sprite();
        // 마우스가 가리키는 3D 객체위에 원을 그릴 Sprite객체 
        private var pointerSp:Sprite = new Sprite();

        public function AsExam11_22()
        {
            displayMain();
            drawObjects();
            sortItems(); 
        }
        // 컨테이너 sp를 추가하고 pointerSp에 원을 그린다.  
        private function displayMain():void
        {
            this.addChild(sp);
            sp.z = 0;
            // pointerSp는 원만 그리고 추가는 마우스가 가리키는 3D 객체위에 추가할 것이다.
            pointerSp.graphics.lineStyle(2, 0xff0000);
            pointerSp.graphics.beginFill(0xffff00);
            pointerSp.graphics.drawCircle(0, 0, 20);
        }
        // 100개의 사각형을 랜덤한 각도와 위치로 sp에 추가한다.
        private function drawObjects():void
        {
            for(var i:uint=0; i<itemCnt; i++) 
            {
                var item:Sprite = new Sprite();
                item.graphics.beginFill(Math.random()*0x1000000);
                item.graphics.drawRect(-boxWidth, -boxHeight, 2*boxWidth, 2*boxHeight);
                item.graphics.endFill();
                sp.addChild(item);            
                
                item.x = Math.random() * stage.stageWidth;
                item.y = Math.random() * stage.stageHeight;
                item.z = Math.random() * 1000;  
                
                item.rotationX = Math.random() * 90 - 45;
                item.rotationY = Math.random() * 90 - 45;
                // 사각형 위에 마우스를 가져가면 rollOverHandler 함수 실행
                item.addEventListener(MouseEvent.ROLL_OVER, rollOverHandler);
                itemArr.push(item);             
            }              
        }
        // 사각형 위에 마우스를 가져갔을 때 pointerSp를 화면위에 표시함
        private function rollOverHandler(event:MouseEvent):void
        {
            var itemSp:Sprite = event.target as Sprite;
            itemSp.addChild(pointerSp);
        }
        // 랜덤한 사각형들을 depthSort 함수를 이용하여 정렬
        private function sortItems():void
        {
            itemArr.sort(depthSort);
            for(var i:int = 0; i < itemArr.length; i++)
            {
                sp.addChildAt(itemArr[i] as Sprite, i);
            }
        }
        // matrix3D API를 이용하여 z축 정렬
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