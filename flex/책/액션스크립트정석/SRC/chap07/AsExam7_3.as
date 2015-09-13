package 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle; 
	
	[SWF(width=800,height=800,backgroundColor=0xFFFFFF)]	
	public class AsExam7_3 extends Sprite
	{
		private var sp:Sprite = new Sprite();
		public function AsExam7_3()	
		{
	    	displayMain();
	    	addEventHandlers();
	    }
	    private function displayMain():void
	    {
	    	sp.x = sp.y = 10;
	    	sp.graphics.lineStyle(.5, 0xFF0000, .8);
	        sp.graphics.beginFill(0xCCCCCC);
	        sp.graphics.drawRoundRect(0, 0, 100, 100, 20, 20);
	        sp.buttonMode = true;
	        // 스케일 모드를 설정함 
	        //sp.scale9Grid = new Rectangle(20, 20, 60, 60);	   		
			this.addChild(sp);
	    }
	    
	    private function addEventHandlers():void
	    {
	        sp.addEventListener(MouseEvent.CLICK, clickHandler);	        	
		}
        // 마우스를 클릭하면 스케일이 증가함
	    private function clickHandler(e:MouseEvent):void 
	    {
			sp.scaleX *= 1.5;
			sp.scaleY = sp.scaleX;
			trace("sp.width: " + sp.width + " sp.height: " + sp.height);
			trace("sp.scaleX: " + sp.scaleX + " sp.scaleY: " + sp.scaleY);  
	    }		
	}
}