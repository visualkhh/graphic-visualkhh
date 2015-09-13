package 
{
    import flash.display.Sprite;
    import flash.events.*;
	[SWF(width=800,height=800,backgroundColor=0xFFFFFF)]
    public class AsExam6_19 extends Sprite 
    {
        private var childSpr:Sprite;
        public function AsExam6_19():void 
        {
			childSpr = new Sprite();  
			this.addChild(childSpr);
			childSpr.graphics.beginFill(0x0FF0FF);
			childSpr.graphics.drawRect(0, 0, 800, 600);
			childSpr.addEventListener(MouseEvent.CLICK, clickHandler);        	
        }
        // 마우스를 클릭하면 AsExam6_19_SubTriangle을 생성하여 화면에 추가한다.
		private function clickHandler(event:MouseEvent):void 
		{
			var sp:AsExam6_19_SubTriangle = new AsExam6_19_SubTriangle(Math.random() * 0x1000000);
			sp.x = event.stageX;  
			sp.y = event.stageY;  
			sp.addEventListener(Event.ADDED, spAdded);
            sp.addEventListener(Event.ADDED_TO_STAGE, spAddedToStage);
            sp.addEventListener(Event.REMOVED, spRemoved);
            sp.addEventListener(Event.REMOVED_FROM_STAGE, spRemovedFromStage);
			childSpr.addChild(sp);
		}        
        private function spRemovedFromStage(event:Event):void 
        {
            trace("스테이지에서 Sprite 제거");
        }
        private function spRemoved(event:Event):void 
        {
            trace("Sprite 제거");
        }
        private function spAddedToStage(event:Event):void 
        {
            trace("스테이지에 Sprite 추가");
        }
        private function spAdded(event:Event):void 
        {
            trace("Sprite 추가");
        }
    }
}