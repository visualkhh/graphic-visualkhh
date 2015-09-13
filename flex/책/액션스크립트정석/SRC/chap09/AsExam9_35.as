package
{
    import flash.display.Bitmap;
    import flash.display.Shape;
    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.MouseEvent;
    import flash.geom.ColorTransform;    
    [SWF(backgroundColor=0xFFFFFF)]
	public class AsExam9_35 extends Sprite
	{
        [Embed(source="assets/okjaemin09.jpg")]
        public var Photo:Class;         
        private var bg:Bitmap = new Photo();
        // 마스크 객체
        private var myMask:Shape = new Shape();		
        
		public function AsExam9_35()
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
            // 알파채널 마스킹을 위해서는 cacheAsBitmap을 true로 
            this.cacheAsBitmap = true
            myMask.cacheAsBitmap = true;
            // 알파값 설정, 마우스무브핸들러에서도 알파값을 계속 바꿔줌
            myMask.alpha = 0.5;
            this.addChild(myMask);
            this.mask = myMask;
        }       
                
        private function addEventHandlers():void
        {
            stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);    
        }        	
        // 마우스가 움직이는 곳으로 마우수를 이동하고 알파값을 변경함
        private function mouseMoveHandler(event:MouseEvent):void
        {
            myMask.x = event.stageX;
            myMask.y = event.stageY;
            // 컬러트랜스폼에서 마우스 위치에 따라 알파값을 변환함
            var colorTransformer:ColorTransform = myMask.transform.colorTransform;
            colorTransformer.alphaMultiplier = (event.stageX / this.stage.width)*2;
            myMask.transform.colorTransform = colorTransformer;
        }        	
	}
}