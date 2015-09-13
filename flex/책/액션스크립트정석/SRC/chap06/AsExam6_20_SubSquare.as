package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class AsExam6_20_SubSquare extends Sprite 
	{
	    private var sideLen:int;
	
	    public function AsExam6_20_SubSquare(pLength:int) 
	    {
	        this.sideLen = pLength;
	        this.x = this.y = 25;
	        this.buttonMode = true;
	        this.addEventListener(MouseEvent.CLICK, clickHandler);
	        draw();
	    }
	    // 사각형을 그린다. 
	    private function draw():void 
	    {
	    	this.graphics.clear();
	    	this.graphics.lineStyle(.5, 0xFFFFFF, .8);
	        this.graphics.beginFill(Math.random() * 0x1000000);
	        this.graphics.drawRect(0, 0, sideLen, sideLen);	   
	    }
	    // 클릭하면 15도씩 회전한다.
	    private function clickHandler(e:Event):void 
	    {
			this.rotation += 15;
	    }
	}	
}
