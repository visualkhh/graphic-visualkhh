package
{
	import flash.display.Bitmap;
	import flash.display.GradientType;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	import flash.filters.BevelFilter;
	import flash.filters.BitmapFilterType;
	import flash.filters.BlurFilter;
	import flash.filters.DropShadowFilter;
	import flash.filters.GlowFilter;
	import flash.filters.GradientBevelFilter;
	import flash.filters.GradientGlowFilter;
	import flash.text.TextField;
    [SWF(backgroundColor=0xFFFFFF)]
	public class AsExam9_37 extends Sprite
	{
        [Embed(source="assets/okjaemin07.jpg")]
        public var Photo:Class;         
        private var bg:Bitmap = new Photo();		
		private var sp:Sprite = new Sprite();
		private var tf:TextField = new TextField();
		private var filterChoice:uint = 0;
		public function AsExam9_37()
		{
			displayMain();
			addEventHandlers();
		}
		// sp에 이미지를 추가하고, 텍스트필드를 화면에 추가한다.
		private function displayMain():void
		{
            stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.align = StageAlign.TOP;      			
			sp.addChild(bg);
			sp.y = 20;
			sp.buttonMode=true;
			this.addChild(sp);
			tf.text = "필터 예제";
			tf.autoSize = "center";
			this.addChild(tf);
			tf.x = 100;
		}

		private function addEventHandlers():void
		{
			sp.addEventListener(MouseEvent.CLICK, clickHandler);
		}
		// 마우스를 클릭하면 filterChoice값에 따라 필터의 종류가 바뀌도록 한다.
		private function clickHandler(event:MouseEvent):void 
		{
			switch(filterChoice)
			{
				case 0:
					sp.filters = [new BevelFilter()];
					tf.text = "BevelFilter";
					break;
				case 1:
					sp.filters = [new BlurFilter()];
					tf.text = "BlurFilter";
					break;
				case 2:
					sp.filters = [new DropShadowFilter()];
					tf.text = "DropShadowFilter";
					break;
				case 3:
					sp.filters = [new GlowFilter()];
					tf.text = "GlowFilter";
					break;
				case 4:
					var gradientBevel:GradientBevelFilter = new GradientBevelFilter();
					gradientBevel.colors = [0xFF0000, 0x00FF00, 0x0000FF];
					gradientBevel.alphas = [1, 1, 1];
					gradientBevel.ratios = [0, 128, 255];
					gradientBevel.type = BitmapFilterType.OUTER;
					sp.filters = [gradientBevel];
					tf.text = "GradientBevelFilter";
					break;
				case 5:
					var gradientGlow:GradientGlowFilter = new GradientGlowFilter();
					gradientGlow.colors = [0x00FF00, 0xFF0000];
					gradientGlow.alphas = [1, 1];
					gradientGlow.ratios = [0, 255];
					gradientGlow.type = BitmapFilterType.OUTER;
					sp.filters = [gradientGlow];
					tf.text = "GradientGlowFilter";
					break;
			}
			filterChoice++;
			if(filterChoice==6) filterChoice = 0;
		}
	}
}