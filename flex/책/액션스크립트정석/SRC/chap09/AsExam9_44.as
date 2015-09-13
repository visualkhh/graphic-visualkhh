package
{
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.BitmapDataChannel;
    import flash.display.GradientType;
    import flash.display.Shape;
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import flash.filters.DisplacementMapFilter;
    import flash.geom.Matrix;
    import flash.geom.Point;
    
    public class AsExam9_44 extends Sprite
    {
        [Embed(source="assets/jaemin-outdoor.jpg")]
        public var Photo:Class;         
        private var bg:Bitmap = new Photo();                
        private var sp:Sprite = new Sprite();
        // 필터의 x, y 축 이동량 
        private var nsOffsetX:AsExam8_NumericStepper = new AsExam8_NumericStepper(-100, 100, 10, "X방향 필터 이동량", "ns1", 10);
        private var nsOffsetY:AsExam8_NumericStepper = new AsExam8_NumericStepper(-100, 100, 10, "Y방향 필터 이동량", "ns2", 10);
        // 필터의 componentX, componentY값을 만들기 위한 Shape
        private var shapeX:Shape; 
        private var shapeY:Shape;
        // true면 확대 모드 false면 축소 모드 
        private var zoomMode:Boolean=true;
        public function AsExam9_44()
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
            stage.addEventListener(MouseEvent.CLICK, clickHandler);
        }
        // 마우스가 움직이는 위치에 100*100 사이즈의 DMF 필터를 생성한다. 
        private function mouseMoveHandler(event:MouseEvent):void
        {
            sp.filters = [createDMF(100, 100)];
        }
        // 마우스를 클릭하면 필터의 확대/축소 모드를 변경한다.
        private function clickHandler(event:MouseEvent):void
        {
        	if(event.type == 'click') zoomMode = !zoomMode;
        }
        // 필터크기를 입력받아 DMF 필터를 생성한다.
        private function createDMF(fWidth:Number, fHeight:Number):DisplacementMapFilter
        {
            // 필터를 적용할 비트맵 영역 
            var filterArea:BitmapData = createMapdata(fWidth, fHeight);
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

        private function createMapdata(fWidth:Number, fHeight:Number):BitmapData
        {
        	// X축 방향으로 RED 채널에 그라데이션이 적용된 Shape 생성후 비트맵 영역에 적용 
        	shapeX = createComponentXY(fWidth, fHeight, 0xFF0000, 0);
        	// Y축 방향으로 BLUE 채널에 그라데이션이 적용된 Shape 생성후 비트맵 영역에 적용
        	shapeY = createComponentXY(fWidth, fHeight, 0x0000FF, Math.PI/2);
            var mapX:BitmapData = new BitmapData(fWidth, fHeight);
            mapX.draw(shapeX);
            var mapY:BitmapData = new BitmapData(fWidth, fHeight); 
            mapY.draw(shapeY);
            // X축맵과 Y축맵을 하나의 비트맵으로 합친다. (Y축은 BLUE채널이어서 BLUE채널을 카피한다.) 
            mapX.copyChannel(mapY, mapY.rect, new Point(0, 0), BitmapDataChannel.BLUE, BitmapDataChannel.BLUE);
            mapY.dispose();         
            // X축, Y축에 대한 Shape를 확인할 수 있도록 화면에 추가한다.
            drawShapes();
            // X축맵과 Y축맵을 합친 비트맵을 리턴한다. 
            return mapX;         
        }        
        // 지정된 크기, 색상, 각도로 그라데이션이 적용된 Shape를 생성해, componentX, componentY 값에 적용
        private function createComponentXY(fWidth:Number, fHeight:Number, color:uint, ang:Number):Shape
        {
        	var sh:Shape = new Shape();
            var matrix:Matrix = new Matrix();
            matrix.createGradientBox(fWidth, fHeight, ang);
            if(zoomMode) // 확대 모드
            {
	            sh.graphics.beginGradientFill(GradientType.LINEAR, [color, 0x000000], [1, 1], [0, 255], matrix);
            }
            else // 축소 모드
            {
	            sh.graphics.beginGradientFill(GradientType.LINEAR, [0x000000, color], [1, 1], [0, 255], matrix);
            }
            sh.graphics.drawRect(0, 0, fWidth, fHeight);
            return sh;
        }
		// X축, Y축에 대한 Shape를 확인할 수 있도록 화면에 추가한다.
        private function drawShapes():void
        {
            this.addChild(shapeX);
            shapeX.x = 420;
            shapeX.y = 60;   
            this.addChild(shapeY);
            shapeY.x = 420;
            shapeY.y = 160;   
        }
    }
}