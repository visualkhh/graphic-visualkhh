package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.filters.BevelFilter;
	import flash.filters.BlurFilter;
	import flash.filters.DropShadowFilter;
	import flash.filters.GlowFilter;
    import flash.display.Bitmap;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;    
    [SWF(backgroundColor=0xFFFFFF)]
	public class AsExam9_38 extends Sprite
	{
        [Embed(source="assets/okjaemin03.jpg")]
        public var Photo:Class;         
        private var bg:Bitmap = new Photo();        
		private var sp:Sprite = new Sprite();
		// 적용할 필터(BevelFilter, BlurFilter, DropShadowFilter, GlowFilter)를 선택하기 위한 체크박스
        private var checkBox1:AsExam8_CheckBox = new AsExam8_CheckBox("BevelFilter적용", "ch1");          
        private var checkBox2:AsExam8_CheckBox = new AsExam8_CheckBox("BlurFilter적용", "ch2");
        private var checkBox3:AsExam8_CheckBox = new AsExam8_CheckBox("DropShadowFilter적용", "ch3");
        private var checkBox4:AsExam8_CheckBox = new AsExam8_CheckBox("GlowFilter적용", "ch4");
		// BevelFilter, BlurFilter, DropShadowFilter, GlowFilter의 공통 속성인 
		// blurX, blurY, quality의 값을 변경하기 위한 숫자 입력기
		private var nsBlurX:AsExam8_NumericStepper = new AsExam8_NumericStepper(1, 10, 1, "blurX값", "ns1", 1);
		private var nsBlurY:AsExam8_NumericStepper = new AsExam8_NumericStepper(1, 10, 1, "blurY값", "ns2", 1);
		private var nsQuality:AsExam8_NumericStepper = new AsExam8_NumericStepper(1, 10, 1, "quality값", "ns3", 1);
		
		public function AsExam9_38()
		{
			displayMain();
			layoutCheckBoxes();
			layoutNumericSteppers();
			addEventHandlers();
		}
		// 이미지를 화면에 추가하고, 화면이 확대되지 않도록 stage의 스케일모드를 설정한다. 
		private function displayMain():void
		{
            stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.align = StageAlign.TOP;      			
			sp.addChild(bg);
			sp.buttonMode=true;
			this.addChild(sp);
		}
		// 체크박스를 추가하고 위치가 겹치지 않도록 수직으로 배열한다.
        private function layoutCheckBoxes():void
        {
            this.addChild(checkBox1);
            this.addChild(checkBox2);
            this.addChild(checkBox3);
            this.addChild(checkBox4);
            checkBox1.x = checkBox2.x = checkBox3.x = checkBox4.x = 270;
            checkBox2.y = 20;
            checkBox3.y = 40;
            checkBox4.y = 60;
        }
        // 숫자입력기를 추가하고 위치가 겹치지 않도록 수직으로 배열한다. 
		private function layoutNumericSteppers():void
		{
			this.addChild(nsBlurX);									
			this.addChild(nsBlurY);
			this.addChild(nsQuality);
			nsBlurX.x = nsBlurY.x = nsQuality.x = 270;
			nsBlurX.y = 80;
			nsBlurY.y = 100;
			nsQuality.y = 120;													
		}
        // 숫자입력기와 체크박스에 이벤트 핸들러를 등록한다.
        private function addEventHandlers():void
        {
            nsBlurX.addEventListener("numberChanged", clickHandler);                        
            nsBlurY.addEventListener("numberChanged", clickHandler);
            nsQuality.addEventListener("numberChanged", clickHandler);
            checkBox1.addEventListener("checkboxChecked", clickHandler);                     
            checkBox2.addEventListener("checkboxChecked", clickHandler);
            checkBox3.addEventListener("checkboxChecked", clickHandler);
            checkBox4.addEventListener("checkboxChecked", clickHandler);
        }
        // 체크박스 또는 숫자입력기의 값이 바뀌면 적용할 핉터와 blurX, blurY, quality 값을 적용한다.
		private function clickHandler(event:MouseEvent):void
		{
			var bf:BevelFilter = new BevelFilter();
			var bl:BlurFilter = new BlurFilter();
			var ds:DropShadowFilter = new DropShadowFilter();
			var gf:GlowFilter = new GlowFilter();
			bf.blurX = bl.blurX = ds.blurX = gf.blurX = nsBlurX.selectedNumber;
			bf.blurY = bl.blurY = ds.blurY = gf.blurY = nsBlurY.selectedNumber;
			bf.quality = bl.quality = ds.quality = gf.quality = nsQuality.selectedNumber;				
            // 선택된 체크박스에 해당하는 필터만 배열에 담아 sp에 반영한다. 			
			var arr:Array = new Array();
			if(checkBox1.checkboxEnabled) arr.push(bf);
			if(checkBox2.checkboxEnabled) arr.push(bl);
			if(checkBox3.checkboxEnabled) arr.push(ds);
			if(checkBox4.checkboxEnabled) arr.push(gf);
			sp.filters = arr;
		}
	}
}