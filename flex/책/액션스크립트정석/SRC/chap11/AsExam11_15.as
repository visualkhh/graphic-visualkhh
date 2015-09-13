package 
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.geom.Vector3D;
    [SWF(width=800, height=600, backgroundColor=0xffffff)]
    public class AsExam11_15 extends Sprite
    {
        private var sp:Sprite = new Sprite();
        private var ballsArr:Array=new Array();
        // sp회전을 위한 변수
        private var rotateAmt:Number = 0;
        
        public function AsExam11_15()
        {
            displayMain();
            createBalls();
            addEventHandlers();  
        }
        
        private function displayMain():void
        {
            this.addChild(sp);                  
            sp.x = sp.y = sp.z = 0;           
        }
        // 공 40개를 10개씩 쌓아 올림
        private function createBalls():void 
        {
        	// 공 40개를 화면과 배열에 추가
            var numBalls:uint = 40;
            for(var i:int = 0; i < numBalls; i++)
            {
                var ball:MyBall = new MyBall(50, Math.random()*0x1000000);
                sp.addChild(ball);
                ballsArr.push(ball);
            }
            // x, y, z 좌표가 200씩 차이가 나도록 10개씩 쌓아 올림
            var position:Number = 200;
            for(var j:int = 0; j<10; j++)
            {
            	// 첫 번째 기둥
                ballsArr[j*4].x = position;
                ballsArr[j*4].y = position; 
                ballsArr[j*4].z = position*(j-1);
                // 두 번째 기둥
                ballsArr[j*4+1].x = position*2;
                ballsArr[j*4+1].y = position;
                ballsArr[j*4+1].z = position*(j-1);
                // 세 번째 기둥
                ballsArr[j*4+2].x = position;
                ballsArr[j*4+2].y = position*2;
                ballsArr[j*4+2].z = position*(j-1);
                // 네 번째 기둥
                ballsArr[j*4+3].x = position*2;
                ballsArr[j*4+3].y = position*2;
                ballsArr[j*4+3].z = position*(j-1);
            }
        }

        private function addEventHandlers():void
        {
            stage.addEventListener(MouseEvent.CLICK, clickHandler);
            stage.addEventListener(Event.ENTER_FRAME, enterframeHandler);
        }
        // 화면을 클릭하면 공들을 정렬한다.
        private function clickHandler(event:MouseEvent):void
        {
        	// Matrix3D의 position 속성을 이용한 정렬
            reorderChildren();
        }
        // x축 방향으로 sp를 회전함 
        private function enterframeHandler(event:Event):void
        {
            var baseY:Number = stage.stageHeight/2;
            var baseZ:Number = 500;
            sp.y = Math.sin(rotateAmt) * baseY/2;
            sp.z = Math.cos(rotateAmt) * baseZ/2;
            rotateAmt += 0.05;                  
        }
        // Matrix3D의 position속성을 이용한 정렬 
        private function reorderChildren():void
        {
            ballsArr.sort(depthSort);
            for(var i:int = 0; i < ballsArr.length; i++)
            {
                sp.addChildAt(ballsArr[i], i);
            }
        }
        // Matrix3D함수를 이용하여 ballsArr에 들어있는 공들을 차례대로 정렬함
        private function depthSort(objA:Sprite, objB:Sprite):int
        {
            var posA:Vector3D = objA.transform.matrix3D.position;
            posA = sp.transform.matrix3D.deltaTransformVector(posA);
            var posB:Vector3D = objB.transform.matrix3D.position;
            posB = sp.transform.matrix3D.deltaTransformVector(posB);
            return posB.z - posA.z;
        }    		
    }
}
