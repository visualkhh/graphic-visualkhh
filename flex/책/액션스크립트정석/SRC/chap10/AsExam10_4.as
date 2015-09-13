package
{
	import flash.display.Sprite;
	import flash.events.Event;
    [SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
	public class AsExam10_4 extends Sprite
	{
		private var sp:Sprite = new Sprite();
		private var sizeX:Number = 100;
		private var sizeY:Number = 200;
        
		public function AsExam10_4()
		{
			displayMain();
			addEventHandlers();
		}
		
		private function displayMain():void
		{
		    sp.graphics.beginFill(Math.random()*0x100000);
		    // 회전의 중심이 (0, 0)가 된다. 
		    sp.graphics.drawRect(0, 0, sizeX, sizeY);
		    this.addChild(sp);	
		    sp.x = sp.y = 200;
		}
		
		private function addEventHandlers():void
		{
			stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
		
		private function enterFrameHandler(event:Event):void
		{
			sp.rotation += 1;
		}
	}
}