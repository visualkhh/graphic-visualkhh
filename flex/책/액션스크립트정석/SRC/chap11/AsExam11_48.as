package
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.geom.Point;
    import flash.geom.Vector3D;
    [SWF(width=800, height=600, backgroundColor=0xffffff)]
    public class AsExam11_48 extends Sprite
    {
        private var myBall:MyBall = new MyBall(50);
        // 초기 속도 설정
        private var vx:Number=5;
        private var vy:Number=-0.2;
        private var vz:Number=10;

        public function AsExam11_48()
        {
            displayMain();
            addEventHandlers();
        }
        
        private function displayMain():void
        {
            this.addChild(myBall);
            myBall.y = stage.stageHeight/2;
            myBall.z = 0;
        }
        
        private function addEventHandlers():void
        {
           stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler); 
           stage.addEventListener(MouseEvent.CLICK, clickHandler);
        }
        // 클릭하면 속도의 방향이 바뀐다.
        private function clickHandler(event:MouseEvent):void
        {
            vx *= -1;
            vy *= -1;
            vz *= -1;           
        }
        // x, y, z축 방향 속도를 증가시킨다
        private function enterFrameHandler(event:Event):void
        {
            myBall.x += vx;
            myBall.y += vy;
            myBall.z += vz;
            // 공이 우측 끝면에 도달했는지를 체크 
            var p:Point = myBall.local3DToGlobal(new Vector3D(myBall.x, myBall.y, myBall.z));
            if(p.x + myBall.width > stage.stageWidth)
            {
                vx *= -1;
                vy *= -1;
                vz *= -1;
            }
        }
    }
}