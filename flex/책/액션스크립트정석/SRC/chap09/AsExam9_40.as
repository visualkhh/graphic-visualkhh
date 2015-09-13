package 
{
    import flash.display.Bitmap;
    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.MouseEvent;
    import flash.filters.ColorMatrixFilter;
        
    [SWF(backgroundColor=0xFFFFFF)]    
    public class AsExam9_40 extends Sprite 
    {
        [Embed(source="assets/jaemin-at-park.jpg")]
        public var Photo:Class;         
        private var bg:Bitmap = new Photo();                
        // 원본 이미지를 담을 sp
        private var spOrg:Sprite = new Sprite();
        // 필터를 적용할 이미지를 담을 sp
        private var spTar:Sprite = new Sprite();
        // 필터 이펙트 종류 선택 
        private var arr:Array = ["RED채널", "GREEN채널", "BLUE채널", "DIGITAL NEGATIVE", "GRAYSCALE", "BRIGHT", "CONTRAST", "SATURATION"];
        private var comboType:AsExam8_ComboBox = new AsExam8_ComboBox(arr, 150, 15, "");
        public function AsExam9_40() 
        {
        	displayMain();
        	addEventHandlers();
        }

        private function displayMain():void
        {
            stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.align = StageAlign.TOP_LEFT;               
            comboType.x = comboType.y = 10;
            spOrg.x = 10;
            spOrg.y = 30;
            spTar.x = 450;
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
        	switch(comboType.selectedData)
        	{
        		case "RED채널":
		            matrix = matrix.concat([1, 0, 0, 0, 0]); // red
		            matrix = matrix.concat([0, 0, 0, 0, 0]); // green
		            matrix = matrix.concat([0, 0, 0, 0, 0]); // blue
		            matrix = matrix.concat([0, 0, 0, 1, 0]); // alpha
        		  break;
        		case "GREEN채널":
		            matrix = matrix.concat([0, 0, 0, 0, 0]); // red
		            matrix = matrix.concat([0, 1, 0, 0, 0]); // green
		            matrix = matrix.concat([0, 0, 0, 0, 0]); // blue
		            matrix = matrix.concat([0, 0, 0, 1, 0]); // alpha
        		  break;
        		case "BLUE채널":
		            matrix = matrix.concat([0, 0, 0, 0, 0]); // red
		            matrix = matrix.concat([0, 0, 0, 0, 0]); // green
		            matrix = matrix.concat([0, 0, 1, 0, 0]); // blue
		            matrix = matrix.concat([0, 0, 0, 1, 0]); // alpha
        		  break;
        		case "DIGITAL NEGATIVE":
		            matrix = matrix.concat([-1, 0, 0, 0, 255]); // red
		            matrix = matrix.concat([0, -1, 0, 0, 255]); // green
		            matrix = matrix.concat([0, 0, -1, 0, 255]); // blue
		            matrix = matrix.concat([0, 0, 0, 1, 0]); // alpha
        		  break;
        		case "GRAYSCALE":
		            matrix = matrix.concat([0.33, 0.33, 0.33, 0, 0]); // red
		            matrix = matrix.concat([0.33, 0.33, 0.33, 0, 0]); // green
		            matrix = matrix.concat([0.33, 0.33, 0.33, 0, 0]); // blue
		            matrix = matrix.concat([0, 0, 0, 1, 0]); // alpha
        		  break;
        		case "BRIGHT":
		            var BRIGHT_AMOUNT:int = 2;// 1 ~ 10
		            matrix = matrix.concat([1, 0, 0, 0, BRIGHT_AMOUNT*50]); // red
		            matrix = matrix.concat([0, 1, 0, 0, BRIGHT_AMOUNT*50]); // green
		            matrix = matrix.concat([0, 0, 1, 0, BRIGHT_AMOUNT*50]); // blue
		            matrix = matrix.concat([0, 0, 0, 1, 0]); // alpha            
        		  break;
        		case "CONTRAST":
		            var CONTRAST_AMOUNT:Number = 10;// 1 ~ 10
		            var cNum:Number = CONTRAST_AMOUNT*11;
		            var oNum:Number = 63.5 - (CONTRAST_AMOUNT*698.5);
		            cNum = 1 + 0.06*CONTRAST_AMOUNT;
		            oNum = -3.82 * CONTRAST_AMOUNT; 
		            matrix = matrix.concat([cNum, 0, 0, 0, oNum]); // red
		            matrix = matrix.concat([0, cNum, 0, 0, oNum]); // green
		            matrix = matrix.concat([0, 0, cNum, 0, oNum]); // blue
		            matrix = matrix.concat([0, 0, 0, 1, 0]); // alpha
        		  break;
        		case "SATURATION":
		            var saturation:Number = 200; // -300 ~ 300
		            saturation /=  100;
		            var isValue: Number = 1-saturation;
		            var irlum: Number = isValue * 0.212671;
		            var iglum: Number = isValue * 0.715160;
		            var iblum: Number = isValue* 0.072169;
		            matrix =  [irlum + saturation,iglum, iblum, 0, 0,
		              irlum, iglum + saturation, iblum, 0, 0,
		                irlum, iglum, iblum + saturation, 0, 0,
		                0, 0, 0, 1, 0 ];
        		  break;
        	}
        	var filter:ColorMatrixFilter = new ColorMatrixFilter(matrix);
        	spTar.filters = [filter];
        }        
    }
}