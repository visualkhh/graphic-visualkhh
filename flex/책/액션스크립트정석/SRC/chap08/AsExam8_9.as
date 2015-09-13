package 
{
	import flash.display.Sprite;
	import flash.events.FocusEvent;
	import flash.events.IEventDispatcher;
	
	[SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
	public class AsExam8_9 extends Sprite 
	{
		// 그리드 픽셀의 크기
		private var recSize:Number = 50;
		private var posX:Number = 0;
		private var posY:Number = 0;
		
		public function AsExam8_9()
		{
			displayMain();
		}
		// 가로 20, 세로 20개의 그리드 셀을 이중 반복문으로 그려줌 
		private function displayMain():void 
		{
			var k:uint = 0;
			for(var i:Number=0; i<10; i++) 
			{
				for(var j:Number=0; j<10; j++) 
				{
					var sp:Sprite = new Sprite();
					sp.buttonMode = true;
	        		sp.useHandCursor = true;
		            sp.addEventListener(FocusEvent.FOCUS_IN, focusInHandler);
		            sp.addEventListener(FocusEvent.FOCUS_OUT, focusOutHandler);
					customDrawRect(sp, 0x000000);
				    sp.x = posX;
				    sp.y = posY;
				    sp.tabIndex = k++;
					this.addChild(sp);	
				    posX += recSize;
				}
				posY += recSize;
				posX = 0;
			}
		}
		private function customDrawRect(sp:Sprite, pColor:uint):void 
		{
			sp.graphics.clear();
			sp.graphics.lineStyle(5, 0xFFFFFF, 0.4);
			sp.graphics.beginFill(pColor, 1);
			sp.graphics.drawRect(5, 5, recSize, recSize);
		}
		// 포커스를 받으면 해당 Sprite를 하얀색으로 그린다.
        private function focusInHandler(event:FocusEvent):void 
        {
            var target:Sprite = Sprite(event.target);
            customDrawRect(target, 0xFFFFFF);
        }
        // 포커스가 아웃되면 해당 Sprite를 검은색으로 그린다.
        private function focusOutHandler(event:FocusEvent):void 
        {
            var target:Sprite = Sprite(event.target);
            customDrawRect(target, 0x000000);
        }
	}
}
