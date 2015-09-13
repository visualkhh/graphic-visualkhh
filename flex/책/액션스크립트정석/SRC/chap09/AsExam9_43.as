package
{
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.BitmapDataChannel;
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import flash.filters.DisplacementMapFilter;
    import flash.filters.DisplacementMapFilterMode;
    import flash.geom.Point;

    public class AsExam9_43 extends Sprite
    {
        [Embed(source="assets/jaemin-outdoor.jpg")]
        public var Photo:Class;         
        private var bg:Bitmap = new Photo();                
        private var sp:Sprite = new Sprite();
        // 필터 모드 종류 선택 
        private var arr:Array = [DisplacementMapFilterMode.CLAMP, DisplacementMapFilterMode.COLOR, DisplacementMapFilterMode.IGNORE, DisplacementMapFilterMode.WRAP];
        private var comboType:AsExam8_ComboBox = new AsExam8_ComboBox(arr, 100, 15, "");

        public function AsExam9_43()
        {
            displayMain();
            addEventHandlers(); 
        }
        // 화면에 이미지를 추가한다.       
        private function displayMain():void
        {
            sp.addChild(bg);
            this.addChild(sp);  
            this.addChild(comboType);
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
            var scaleXVal:Number = 50; 
            var scaleYVal:Number = 50; 
            // 마우스의 위치에 필터를 적용하도록 함 
            var pt:Point = new Point(stage.mouseX, stage.mouseY); 
            var dmf:DisplacementMapFilter = new DisplacementMapFilter(
                filterArea, pt,
                BitmapDataChannel.RED,// X방향 
                BitmapDataChannel.BLUE,// Y방향 
                scaleXVal, scaleYVal,
                comboType.selectedData // 필터 모드 선택
                );        
            return dmf;             
        }
    }
}