package
{
    import flash.display.Bitmap;
    import flash.display.Shape;
    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.Event;
    import flash.events.MouseEvent;
    [SWF(backgroundColor=0xFFFFFF)]
	public class AsExam9_36 extends Sprite
	{
        [Embed(source="assets/okjaemin01.jpg")]
        public var Photo:Class;         
        private var bg:Bitmap = new Photo();
        // 마스크 객체
        private var myMask:Shape = new Shape();  
        // 마스크의 반지름
        private var maskRadius:Number=0;
        // 마스크의 반지름 사이즈 조절값
        private var maskSize:int = -10;               
		public function AsExam9_36()
		{
            displayMain();
            addMask();
            addEventHandlers();
		}
        
        private function displayMain():void
        {
            stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.align = StageAlign.TOP;           
            this.addChild(bg);
        }
        // myMask에 그래픽을 그려서 화면에 추가한 다음 mask 설정을 함
        private function addMask():void
        {
            myMask.graphics.beginFill(0xFF0000);
            myMask.graphics.drawCircle(0, 0, 200);
            this.addChild(myMask);
            this.mask = myMask;
        }    		
		
		private function addEventHandlers():void
		{
			myMask.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
		// 마스크 원의 크기를 계속 변경해서 그려줌으로 마스크 이펙트 구현
		private function enterFrameHandler(event:Event):void
		{
			myMask.graphics.clear();
            myMask.graphics.beginFill(0xFF0000);
            myMask.graphics.drawCircle(stage.mouseX, stage.mouseY, maskRadius);
            maskRadius +=maskSize;
            if(maskRadius>=200) 
            {
                maskSize = -5;
            }
            if(maskRadius<20)  
            {
                maskSize = 5;	
            }			
		}
	}
}