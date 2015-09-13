package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.filters.BitmapFilterType;
	import flash.filters.GradientBevelFilter;
	import flash.filters.GradientGlowFilter;
    import flash.display.Bitmap;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;  
    [SWF(backgroundColor=0xFFFFFF)]    
	public class AsExam9_39 extends Sprite
	{
        [Embed(source="assets/okjaemin02.jpg")]
        public var Photo:Class;         
        private var bg:Bitmap = new Photo();        		
		private var sp:Sprite = new Sprite();
		// 필터의 distance, strength 속성 컨트롤
		private var nsDistance:AsExam8_NumericStepper = new AsExam8_NumericStepper(1, 10, 1, "distance값", "ns1", 1);
		private var nsStrength:AsExam8_NumericStepper = new AsExam8_NumericStepper(1, 10, 1, "strength값", "ns2", 1);
		// 필터의 그라데이션 색상 조절
		private var cpGrdColor1:AsExam8_ColorPanel = new AsExam8_ColorPanel(10, 8, "Gradation Color 1", 0xFF0000);
		private var cpGrdColor2:AsExam8_ColorPanel = new AsExam8_ColorPanel(10, 8, "Gradation Color 2", 0x00FF00);
		private var cpGrdColor3:AsExam8_ColorPanel = new AsExam8_ColorPanel(10, 8, "Gradation Color 3", 0x0000FF);
		// 필터의 그라데이션 색상의 비율 조절
		private var nsGrdColor1ratio:AsExam8_NumericStepper = new AsExam8_NumericStepper(1, 10, 1, "", "ns3", 1);
		private var nsGrdColor2ratio:AsExam8_NumericStepper = new AsExam8_NumericStepper(128, 255, 10, "", "ns4", 128);
		private var nsGrdColor3ratio:AsExam8_NumericStepper = new AsExam8_NumericStepper(255, 255, 1, "", "ns5", 255);
		// 필터의 3가지 타입, outer, inner, full
		private var arr:Array = [BitmapFilterType.OUTER, BitmapFilterType.INNER, BitmapFilterType.FULL];
		private var comboType:AsExam8_ComboBox = new AsExam8_ComboBox(arr, 100, 15, "");
		// 필터 종류 선택 : GradientBevelFilter, GradientGlowFilter
		private var radio1:AsExam8_RadioButton = new AsExam8_RadioButton("GradientBevelFilter", "radio1");
		private var radio2:AsExam8_RadioButton = new AsExam8_RadioButton("GradientGlowFilter", "radio2");
		
		public function AsExam9_39()
		{
            displayMain();
			layoutControls();		
			addEventHandlers();
			propertyChangedHandler(null);
		}		
		
		private function displayMain():void
		{
            stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.align = StageAlign.TOP;               
            sp.addChild(bg);
            sp.buttonMode=true;
            this.addChild(sp);
		}
		// 필터의 속성조절을 위한 컨트롤 배치
		private function layoutControls():void
		{
			this.addChild(nsDistance);
			this.addChild(nsStrength);				
			this.addChild(nsGrdColor1ratio);				
			this.addChild(nsGrdColor2ratio);				
			this.addChild(nsGrdColor3ratio);				
			this.addChild(cpGrdColor3);
			this.addChild(cpGrdColor2);
			this.addChild(cpGrdColor1);
			this.addChild(comboType);
			this.addChild(radio1);
			this.addChild(radio2);
			nsDistance.x = nsStrength.x = cpGrdColor3.x = cpGrdColor2.x = cpGrdColor1.x = comboType.x = radio1.x = radio2.x = 330;
			nsGrdColor1ratio.x = nsGrdColor2ratio.x = nsGrdColor3ratio.x = 440;
			nsDistance.y = 0;						
			nsStrength.y = 20;			
			nsGrdColor1ratio.y = 75;			
			nsGrdColor2ratio.y = 95;			
			nsGrdColor3ratio.y = 115;			
			cpGrdColor3.y = 120;									
			cpGrdColor2.y = 100;									
			cpGrdColor1.y = 80;									
			comboType.y = 60;			
			radio1.y = 150;
			radio2.y = 170;
			radio1.setEnable(true);
		}
		// 필터 속성 조절 컨트롤에 대한 이벤트 핸들러 함수 추가
		private function addEventHandlers():void
		{
            nsDistance.addEventListener("numberChanged", propertyChangedHandler); 
            nsStrength.addEventListener("numberChanged", propertyChangedHandler); 
            nsGrdColor1ratio.addEventListener("numberChanged", propertyChangedHandler);   
            nsGrdColor2ratio.addEventListener("numberChanged", propertyChangedHandler);   
            nsGrdColor3ratio.addEventListener("numberChanged", propertyChangedHandler);   
            cpGrdColor1.addEventListener("colorSelected", propertyChangedHandler);
            cpGrdColor2.addEventListener("colorSelected", propertyChangedHandler);
            cpGrdColor3.addEventListener("colorSelected", propertyChangedHandler);
            radio1.addEventListener("radioChecked", propertyChangedHandler);
            radio2.addEventListener("radioChecked", propertyChangedHandler);          
            comboType.addEventListener("comboChanged", propertyChangedHandler);
		}
		// 필터 속성 조절 컨트롤의 바뀐 값을 필터에 반영하여 화면에 적용한다. 
		private function propertyChangedHandler(event:MouseEvent):void
		{
			if(event != null)
			{
				var objName:String = event.currentTarget.name;
				if(objName == 'radio1')
				{
					if(radio1.radioEnabled) radio2.drawUnchecked();
				} 
				if(objName == 'radio2')
				{
					if(radio2.radioEnabled)  radio1.drawUnchecked();
				}
			}
			var colorArr:Array = [cpGrdColor1.selectedColor, cpGrdColor2.selectedColor, cpGrdColor3.selectedColor];
			var colorRatioArr:Array = [nsGrdColor1ratio.selectedNumber, nsGrdColor2ratio.selectedNumber, nsGrdColor3ratio.selectedNumber];
			// GradientBevelFilter를 선택한 경우
			if(radio1.radioEnabled)
			{
				var bf:GradientBevelFilter = new GradientBevelFilter();
				bf.colors = colorArr;
				bf.ratios = colorRatioArr;
				bf.alphas = [1, 1, 1];
				bf.distance = nsDistance.selectedNumber;
				bf.strength = nsStrength.selectedNumber;
				bf.type = comboType.selectedData;
				sp.filters = [bf];
			} 
			else // GradientGlowFilter를 선택한 경우
			{
				var bf2:GradientGlowFilter = new GradientGlowFilter();
				bf2.colors = colorArr;
				bf2.ratios = colorRatioArr;
				bf2.alphas = [1, 1, 1];
				bf2.distance = nsDistance.selectedNumber;
				bf2.strength = nsStrength.selectedNumber;
				bf2.type = comboType.selectedData;
				bf2.blurX = 10;
				bf2.blurY = 10;
				sp.filters = [bf2];
			} 
		}
	}
}