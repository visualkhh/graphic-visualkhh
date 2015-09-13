package 
{
    import flash.display.Sprite;
    import flash.events.MouseEvent;
	
	[SWF(width=800,height=800,backgroundColor=0xFFFFFF)]
    public class AsExam7_6 extends Sprite 
    {
        public function AsExam7_6() 
        {
        	displayMain();
        	addEventHandlers();
        }
        private function displayMain():void
        {
        	// 원형으로 사각형들을 그려주는 Sprite
            var sp_sub:AsExam7_6_Sub = new AsExam7_6_Sub();
            sp_sub.buttonMode = true;
            this.addChild(sp_sub);
        }
        
        private function addEventHandlers():void
        {
        	// 화면을 클릭하면 clickHandler 함수 실행
            stage.addEventListener(MouseEvent.CLICK, clickHandler);
        }
        // cacheAsBitmap을 true로 하고 opaqueBackground 색상 조절
        public function clickHandler(event:MouseEvent):void 
        {
        	this.opaqueBackground = 0xCCCCCC;
        	this.cacheAsBitmap = true;
        }
    }
}   