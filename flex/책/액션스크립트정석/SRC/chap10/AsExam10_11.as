package
{
	import flash.display.Sprite;
	import flash.events.Event;
	[SWF(width=800,height=600,backgroundColor=0x000000)]
	public class AsExam10_11 extends Sprite
	{
		private var sp:Sprite = new Sprite();
		public function AsExam10_11()
		{
			displayMain();
			addEventHandlers();
		}

        private function addEventHandlers():void
        {
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        
        private function enterFrameHandler(event:Event):void
        {
            var dy:Number = stage.mouseY - sp.y;
            var dx:Number = stage.mouseX - sp.x;
            // 마우스위치와 sp위치사이의 각도(라디안)를 계산한다.
            var angle:Number = Math.atan2(dy, dx);
            // rotation에 적용할 때에는 라디안을 각도로 변환한다.
            sp.rotation = angle * 180 / Math.PI;            
        }
        		
		private function displayMain():void
		{
            sp.graphics.beginFill(Math.random()*0x1000000);
            // 회전의 중심을 맞춰 준다.
            sp.graphics.drawRect(-50, -50, 100, 100);
            this.addChild(sp);
            sp.x = stage.stageWidth/2;
            sp.y = stage.stageHeight/2;
		}
	}
}