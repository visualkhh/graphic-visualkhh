package 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
    [SWF(backgroundColor=0x000000)]
	public class AsExam8_1 extends Sprite
	{
		public function AsExam8_1()
		{
			drawBox();
			addEventHandlers();
		}
		// 클릭, 더블클릭 이벤트 핸들러 등록
		private function addEventHandlers():void
		{
			// 더블클릭을 위한 속성 설정
			stage.doubleClickEnabled = true;
			stage.addEventListener(MouseEvent.CLICK, clickHandler);
			stage.addEventListener(MouseEvent.DOUBLE_CLICK, doubleClickHandler);
		}
        // 더블클릭을 하면 클릭이벤트도 같이 발생함
		private function clickHandler(event:MouseEvent):void 
		{
			trace('click');
			trace('event.type:' + event.type + " event.target:" + event.target);
		}
		// 더블클릭하면 화면을 다시 그려줌
		private function doubleClickHandler(event:MouseEvent):void 
		{
			drawBox();
			trace('double click');
			trace('event.type:' + event.type + " event.target:" + event.target);
		}
		
		private function drawBox():void
		{
			var c:uint = Math.random()*0x1000000;
			this.graphics.clear();
			var w:Number = 300;
			var h:Number = 300;
			for(var i:int=0; i<=50; i++)
			{
				this.graphics.lineStyle(0.5, c);
				this.graphics.moveTo(0, i*6);
				this.graphics.lineTo(i*6, h);
			}
		}
	}
}
