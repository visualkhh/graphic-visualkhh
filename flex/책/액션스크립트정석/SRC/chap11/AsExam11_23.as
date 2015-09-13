package
{
    import flash.display.Shape;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.geom.Point;
    import flash.geom.Vector3D;
    import flash.display.DisplayObject;
    [SWF(width=800, height=600, backgroundColor = 0xffffff)]
    public class AsExam11_23 extends Sprite
    {
    	// 3D 객체를 담을 컨테이너
        private var sp:Sprite = new Sprite();
        // 3D 객체 정렬을 위한 배열
        private var itemArr:Array = new Array();
        // 아이템 갯수 
        private var itemCnt:int = 200;
        public function AsExam11_23()
        {
        	displayMain();
            drawObjects();
            sortItems();
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        // sp를 화면에 추가하고 projectionCenter를 적용한다.
        private function displayMain():void
        {
            sp.z = 0;
            this.addChild(sp);
	        var centerX:Number = stage.stageWidth/2;
	        var centerY:Number = stage.stageHeight/2;
            root.transform.perspectiveProjection.projectionCenter = new Point(centerX*1.5, centerY/2);
        }
        // 랜덤한 색상과 크기의 삼각형을 생성하여 배열에 추가
        private function drawObjects():void
        {
            for (var i:int = 0; i < itemCnt; i++) 
            { 
                var item:Shape = createTriangles(Math.random() * stage.stageWidth, Math.random()*stage.stageHeight, Math.random()*500);
                sp.addChild(item); 
                itemArr.push(item);
            } 
        }
        // 지정된 x,y,z 좌표에 삼각형을 그리는 Shape 리턴  
        private function createTriangles(xPos:int, yPos:int, zPos:int):Shape
        { 
            var sh:Shape = new Shape();
            sh.graphics.beginFill(Math.random()*0x1000000);
            sh.graphics.lineTo(-50, 0);
            sh.graphics.lineTo(50, 0)
            sh.graphics.lineTo(0, 100)
            sh.x = xPos; 
            sh.y = yPos; 
            sh.z = zPos; 
            return sh; 
        } 
        // pointAt함수를 이용하여 삼각형들이 마우스를 향하도록함. 
        private function enterFrameHandler(event:Event):void
        {
            for(var i:int=0; i<itemArr.length; i++)
            {
                var sh:Shape = itemArr[i];
                sh.transform.matrix3D.pointAt(new Vector3D(mouseX, mouseY, 0));
            }
        }
        // itemArr에 추가된 Shape를 depthSort함수를 이용해 정렬함
        private function sortItems():void
        {
            itemArr.sort(depthSort);
            for(var i:int = 0; i < itemArr.length; i++)
            {
                //Sprite 가 아니라 Shape
                sp.addChildAt(itemArr[i] as Shape, i); 
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