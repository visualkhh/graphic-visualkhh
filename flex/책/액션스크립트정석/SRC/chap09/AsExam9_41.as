package 
{
    import flash.display.Sprite;
    import flash.events.MouseEvent
    import flash.filters.ConvolutionFilter;
    import flash.display.Bitmap;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;  
    [SWF(backgroundColor=0xFFFFFF)]   
    public class AsExam9_41 extends Sprite 
    {
        [Embed(source="assets/okjaemin08.jpg")]
        public var Photo:Class;         
        private var bg:Bitmap = new Photo();                
        // 원본 이미지를 담을 sp
        private var spOrg:Sprite = new Sprite();
        // 필터를 적용할 이미지를 담을 sp
        private var spTar:Sprite = new Sprite();
        // 필터 채널 선택 
        private var arr:Array = ["BRIGHTNESS", "SHARPNESS", "EMBOSSING", "EDGECHECK", "OUTLINE"];
        private var comboType:AsExam8_ComboBox = new AsExam8_ComboBox(arr, 150, 15, "");
        
        public function AsExam9_41() 
        {
            displayMain();
            addEventHandlers();
            propertyChangedHandler(null);
        }

        private function displayMain():void
        {
            stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.align = StageAlign.TOP_LEFT;        	
            comboType.x = comboType.y = 10;
            spOrg.x = 10;
            spOrg.y = 30;
            spTar.x = 500;
            spTar.y = 30;
            spOrg.addChild(bg);
            // bg에 추가된 비트맵데이터를 복제한다.
            spTar.addChild(new Bitmap(bg.bitmapData.clone()));
            this.addChild(spOrg);
            this.addChild(spTar);
            this.addChild(comboType);
            // 콤보박스는 sp보다 뒤에 추가해야 메뉴가 화면위에 나타남
        }

        private function addEventHandlers():void
        {
            comboType.addEventListener("comboChanged", propertyChangedHandler);
        }
        
        // 필터 속성 조절 컨트롤의 바뀐 값을 필터에 반영하여 화면에 적용한다. 
        private function propertyChangedHandler(event:MouseEvent):void
        {
            var matrix:Array = new Array();
            var matrixX:Number = 3;
            var matrixY:Number = 3;
            var divisor:Number = 9;
            var val:Number = 0;
            switch(comboType.selectedData)
            {
            	case "BRIGHTNESS":
		           val = 1.5;
            	   divisor = 0;
		           matrix = [val, val, val, val, 0, val, val, val, val];
		           matrix = [0, 0, 0, 0, val, 0, 0, 0, 0];                                
            	   break;
            	case "SHARPNESS":
                   val = 7;
                   divisor = val/2;
		           matrix = [0, -1, 0, -1, val, -1, 0, -1, 0];
            	   break;
            	case "EMBOSSING":
				   val = 4;
				   divisor = 1;
				   matrix = [-val, val, 0, -val, val, 0, -val, val, 0];
                   matrix = [-(val*val), -val, 0,-val, val, val, 0, val, val*val];
            	   break;
            	case "EDGECHECK":
		           var mul:Number = 2.5;// 2 ~ 4
                   val = 1;
                   divisor = 0;
		           matrix = [0, val, 0, val, -(val*mul), val, 0, val, 0];
            	   break;
            	case "OUTLINE":
				   val = 10;
                   divisor = 1;
				   matrix = [-val, val, 0, -val, val, 0, -val, val, 0];
            	   break;
            }
            var filter:ConvolutionFilter = new ConvolutionFilter(matrixX, matrixY, matrix, divisor);
            spTar.filters = [filter];
        }
    }
}	