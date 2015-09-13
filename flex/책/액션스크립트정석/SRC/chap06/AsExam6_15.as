package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	[SWF(width=800,height=600,frameRate=20,backgroundColor=0xFFFFFF)]
	public class AsExam6_15 extends Sprite 
	{
		private var needle:Sprite; 
		private var currentDegree:uint = 0;
		private var needleMoveFlag:Boolean = false;
		
		public function AsExam6_15()	
		{
			drawWatch();
			drawNeedle();
		}
		// 시계의 둥근 원을 그리는 함수
		private function drawWatch():void 
		{
			var circleSp:Sprite = new Sprite();
			circleSp.graphics.beginFill(Math.random() * 0xffffff);
			circleSp.graphics.lineStyle(1, Math.random() * 0xffffff);
			circleSp.graphics.drawCircle(250, 250, 220);		
			this.addChild(circleSp);
			circleSp.addEventListener(MouseEvent.CLICK, clickHandler);
		}
		// 시계 바늘을 그린다.
		private function drawNeedle():void 
		{
			needle = new Sprite();  
			this.addChild(needle);  
			needle.x = 250;
			needle.y = 250;
			needle.graphics.beginFill(Math.random() * 0xffffff);
			needle.graphics.lineStyle(5, Math.random() * 0xffffff);
			needle.graphics.moveTo(0, 0);  
			needle.graphics.lineTo(0, -200); 
			needle.addEventListener(Event.ENTER_FRAME, moveNeedle); 
		}
        // 클릭 이벤트가 발행할 때마다 시계바늘을 움직이거나 멈추게 한다.
		private function clickHandler(event:Event):void 
		{
			if(!needleMoveFlag) 
			{
				needle.removeEventListener(Event.ENTER_FRAME, moveNeedle);
			} 
			else 
			{
				needle.addEventListener(Event.ENTER_FRAME, moveNeedle); 
			}
			needleMoveFlag = !needleMoveFlag;
		}
		// 엔터프레임 이벤트가 발생할 때 마다 시계 바늘을 6도씩 회전한다.
		private function moveNeedle(event:Event):void 
		{
		    needle.rotation = currentDegree;
		    currentDegree += 6;
		}
	}
}
