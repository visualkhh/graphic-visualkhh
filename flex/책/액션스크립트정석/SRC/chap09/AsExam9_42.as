package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BitmapDataChannel;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.filters.DisplacementMapFilter;
	import flash.geom.Point;

	public class AsExam9_42 extends Sprite
	{
        [Embed(source="assets/jaemin-outdoor.jpg")]
        public var Photo:Class;         
        private var bg:Bitmap = new Photo();                
        private var sp:Sprite = new Sprite();
        // 필터의 x, y 축 이동량 
        private var nsOffsetX:AsExam8_NumericStepper = new AsExam8_NumericStepper(-100, 100, 10, "X방향 필터 이동량", "ns1", 10);
        private var nsOffsetY:AsExam8_NumericStepper = new AsExam8_NumericStepper(-100, 100, 10, "Y방향 필터 이동량", "ns2", 10);

		public function AsExam9_42()
		{
            displayMain();
            addEventHandlers();
		}
        // 화면에 이미지를 추가한다.		
		private function displayMain():void
		{
		    sp.addChild(bg);
		    this.addChild(sp);	
		    nsOffsetX.x = nsOffsetY.x = 420;
		    nsOffsetY.y = 25;
		    this.addChild(nsOffsetX);
		    this.addChild(nsOffsetY);
		}
		// 마우스가 움직이는 곳에 필터를 적용한다.
		private function addEventHandlers():void
		{
			stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
		}
		// 마우스가 움직이는 위치에 100*100 사이즈의 DMF 필터를 생성한다. 
		private function mouseMoveHandler(event:MouseEvent):void
		{
			sp.filters = [createDMF(100, 100)];
		}
		// 필터크기를 입력받아 DMF 필터를 생성한다.
		private function createDMF(fWidth:Number, fHeight:Number):DisplacementMapFilter
		{
            // 필터를 적용할 비트맵 영역으로 사이즈는 파라미터로 입력받는다. 
            var filterArea:BitmapData = new BitmapData(fWidth, fHeight, false);
            // 필터의 x, y축 방향 이동량
            var scaleXVal:Number = nsOffsetX.selectedNumber; 
            var scaleYVal:Number = nsOffsetY.selectedNumber; 
            // 마우스의 위치에 필터를 적용하도록 함 
            var pt:Point = new Point(stage.mouseX, stage.mouseY); 
            var dmf:DisplacementMapFilter = new DisplacementMapFilter(
                filterArea, pt,
                BitmapDataChannel.RED,// X방향 
                BitmapDataChannel.BLUE,// Y방향 
                scaleXVal, scaleYVal);        
            return dmf; 	        
		}
	}
}