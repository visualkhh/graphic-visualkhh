package
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.geom.Point;
    import flash.geom.Vector3D;
    [SWF(width=800, height=600, backgroundColor=0x000000)]
    public class AsExam11_49 extends Sprite
    {
    	// x, y, z축 속도
        private var vx:Number=20;
        private var vy:Number=-0.5;
        private var vz:Number=20;
        // 별을 담기 위한 배열
        private var ballArr:Array = new Array();
        private var ballCount:int = 300;
        private var direction:int = 1;
        
        public function AsExam11_49()
        {
            displayMain();
            addEventHandlers();
        }
        
        private function displayMain():void
        {
            for(var i:int=0; i<ballCount; i++)
            {
                // myBall을 확장한 MyStar를 이용하여 화면을 그린다.
                var ball:MyBall = new MyStar(15, Math.random()*0x1000000);
                ballArr.push(ball);
                ball.x = Math.random() * stage.stageWidth*2;
                ball.y = Math.random() * stage.stageHeight;
                ball.z = Math.random() * 2000;
                this.addChild(ball);
            }
        }
        
        private function addEventHandlers():void
        {
           stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler); 
           stage.addEventListener(MouseEvent.CLICK, clickHandler);
        }
        // 화면을 클릭하면 속도의 방향이 반대로 바뀐다.
        private function clickHandler(event:MouseEvent):void
        {
           direction *= -1;
        }
        // 별들에 대해 속도를 적용하여 3D로 가속한다. 
        private function enterFrameHandler(event:Event):void
        {
            for(var i:int=0; i<ballCount; i++)
            {
                var ball:MyBall = ballArr[i];
                // 속도 적용
                ball.x += vx*direction;
                ball.y += vy*direction;
                ball.z += vz*direction;
                // 별의 2D상의 위치 계산
                var p:Point = this.local3DToGlobal(new Vector3D(ball.x, ball.y, ball.z));
                // 전진
                if(direction == 1) 
                {
                	// 별이 화면 오른쪽 끝에 근접하면 다시 왼쪽으로 옮긴다.
                    if(p.x-100 > stage.stageWidth)
                    {
                        ball.z = Math.random() * 1000;
                        ball.x = -ball.z;
                    }            
                }
                else // -1 (후진) 
                {
                	// 별이 화면 왼쪽 끝에 근접하면 다시 오른쪽으로 옮긴다.
                    if(p.x + 100< 0)
                    {
                        ball.z = Math.random() * 1000 + 4 * stage.stageWidth;
                        ball.x = 4* stage.stageWidth;
                    }            
                }
            }
        }
    }
}