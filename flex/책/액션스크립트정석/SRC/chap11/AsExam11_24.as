package
{
    import flash.display.DisplayObject;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.geom.Point;
    import flash.geom.Vector3D;    
    [SWF(width=800, height=600, backgroundColor = 0xffffff)]
    public class AsExam11_24 extends Sprite
    {
        // 3D 객체를 담을 컨테이너 
        private var sp:Sprite = new Sprite();
        private var itemArr:Array = new Array();
        private var itemCnt:int = 10;
        // 사각형의 width, height 
        private var boxWidth:int = 50;
        private var boxHeight:int = 100;
        // 사각형간의 간격
        private var gap:int = 50;
                
        public function AsExam11_24()
        {
        	displayMain();
            drawObjects();
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);        
        }
        // sp를 화면 중앙에 추가한다.
        private function displayMain():void
        {
            sp.x = stage.stageWidth / 2;
            sp.y = stage.stageHeight / 2;
            sp.z = 100;         
            this.addChild(sp);
        }
        // itemCnt만큼 사각형을 그려주는 Sprite를 화면에 추가함
        private function drawObjects():void
        {
            for(var i:uint=0; i<itemCnt; i++) 
            {
                var item:Sprite = new Sprite();
                item.graphics.beginFill(Math.random()*0x1000000);
                item.graphics.drawRect(-boxWidth, -boxHeight, 2*boxWidth, 2*boxHeight);
                item.graphics.endFill();
                item.x = i*gap;  
                item.z = 0;
                // 책장의 책처럼 보이게끔 y축 방향으로 89도 회전
                item.rotationY = 89;
                itemArr.push(item);             
                sp.addChild(item);            
            }              
        }
        // 마우스가 좌우로 움직이면 사각형들도 같이 좌우로 움직인다.        
        private function enterFrameHandler(event:Event):void
        {
            sp.transform.matrix3D.appendTranslation(((mouseX - sp.x) * 0.1), 0, 0);
            //sp.x += (mouseX - sp.x) * 0.1;
            // 마우스의 위치에 따라 사각형의 중첩을 자연스럽게 하기 위해 정렬함
            if(mouseX > stage.stageWidth/2) 
            {
            	// 내림차순 정렬
                sortItems(Array.NUMERIC | Array.DESCENDING);
            }
            else
            {
            	// 오름차순 정렬
                sortItems(Array.NUMERIC);
            }
        }
        // x축값에 따라 itemArr의 객체들을 정렬
        private function sortItems(ch:int):void
        {
            itemArr.sortOn("x", ch);
            for(var i:int = 0; i < itemArr.length; i++)
            {
                sp.addChildAt(itemArr[i] as Sprite, i);
            }
        }
    }
}