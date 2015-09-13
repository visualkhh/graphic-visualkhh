package {
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	// 임시 변수를 활용한 객체 이동 
	public class AsExam5_9 extends Sprite 
	{
		private var arrGridSpr:Array;
		public function AsExam5_9()
		{
			displayMain();
			addEventHandlers();
		}

        private function displayMain():void 
        {
			var recSize:Number = 20;
			var posX:Number = 0;
			var posY:Number = 0;
            arrGridSpr = new Array();
            for(var i:Number=0; i<recSize; i++) 
            {
                for(var j:Number=0; j<recSize; j++) 
                {
                    var sp:Sprite = new Sprite();
                    arrGridSpr.push(sp);
                    sp.graphics.lineStyle(.1, 0xFFFFFF, 0.4);
                    sp.graphics.beginFill(Math.random() * 0x1000000);
                    sp.graphics.drawRect(5, 5, recSize, recSize);
                    sp.x = posX;
                    sp.y = posY;
                    this.addChild(sp);  
                    posY += recSize;
                }
                posX += recSize;
                posY = 0;
            }
        }		
		
		private function addEventHandlers():void
		{
			this.addEventListener(MouseEvent.CLICK, clickHandler);	
		}
		// 여기서는 마우스가 클릭될 때 마다 다음의 셀과 좌표값을 바꾸어 준다.
		private function clickHandler(event:MouseEvent):void 
		{
			for(var i:Number=0; i<arrGridSpr.length; i++) 
			{
				var tempX:Number = arrGridSpr[i].x;
				var tempY:Number = arrGridSpr[i].y;
				if((i+1) >= arrGridSpr.length) break;
				arrGridSpr[i].x = arrGridSpr[i+1].x;
				arrGridSpr[i].y = arrGridSpr[i+1].y;
				arrGridSpr[i+1].x = tempX;
				arrGridSpr[i+1].y = tempY;				
			}
		}
	}
}