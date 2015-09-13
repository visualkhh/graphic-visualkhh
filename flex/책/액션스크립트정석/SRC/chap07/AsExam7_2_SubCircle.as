package 
{
	import flash.display.Sprite;
	
	public class AsExam7_2_SubCircle extends Sprite 
	{
	    private var sideLen:int;
	
	    public function AsExam7_2_SubCircle(pLength:int) 
	    {
	        this.sideLen = pLength;
	        draw();
	    }
	    
	    private function draw():void 
	    {
	    	this.graphics.clear();
	        this.graphics.beginFill(Math.random() * 0x1000000);
	        this.graphics.drawCircle(0, 0, sideLen);	   
	    }
	}	
}
