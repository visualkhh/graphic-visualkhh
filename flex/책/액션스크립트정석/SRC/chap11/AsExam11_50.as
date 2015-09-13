package
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.geom.Point;
    import flash.geom.Vector3D;
    [SWF(width=800, height=600, backgroundColor=0x000000)]
    public class AsExam11_50 extends Sprite
    {
        private var vx:Number=0;
        private var vy:Number=0;
        private var vz:Number=-30;
        private var ballArr:Array = new Array();
        private var ballCount:int = 500;
        // 전진 또는 후진을 결정하는 변수 
        private var direction:int = 1;
        
        public function AsExam11_50()
        {
            displayMain();
            addEventHandlers();
        }
        // 랜던한 색상으로 별을 골고루 분포시킨다
        private function displayMain():void
        {
            for(var i:int=0; i<ballCount; i++)
            {
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
        // 화면을 클릭하면 별의 진행방향이 반대로 바뀐다.
        private function clickHandler(event:MouseEvent):void
        {
           direction *= -1;
        }
        // 별들을 전진 또는 후진 시킨다 
        private function enterFrameHandler(event:Event):void
        {
        	// z축 최대값으로 별이 가장 멀리 떨어졌을 때 
            var front:Number = 5000;
            for(var i:int=0; i<ballCount; i++)
            {
                var ball:MyBall = ballArr[i];
                ball.x += vx*direction;
                ball.y += vy*direction;
                ball.z += vz*direction;
                // 후진  
                if(direction == 1) 
                {
                	// 별의 2D 상 x, y 좌표값 계산 
	                var p:Point = ball.local3DToGlobal(new Vector3D(0, 0, 0));
                	// 별이 화면을 벗어 나면
                    if(p.x < 0 || p.x > stage.stageWidth)
                    {
                    	// 별이 뒤에서 오는 것처럼 보이도록 좌표값 설정 
                        ball.z *= -5;
                        ball.x = Math.random() * stage.stageWidth;
                        ball.y = Math.random() * stage.stageHeight;                        
                    }            
                }
                else // -1 전진
                {
                	// 별이 안보일 정도로 멀어지면 
                    if(ball.z > front)
                    {
                    	// 다시 화면 앞으로 옮긴다
                        ball.z = -1000;     
                    }        
                }
            }
        }
    }
}