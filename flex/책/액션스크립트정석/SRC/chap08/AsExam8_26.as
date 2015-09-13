package 
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import flash.net.URLRequest;
	
	[SWF(backgroundColor=0xFFFFFF)]
	public class AsExam8_26 extends Sprite	
	{
		// 슬라이더 객체
		private var slider:AsExam8_Slider;
		// 이미지 로딩 위한 Loader
		private var ld:Loader = new Loader();
		public function AsExam8_26()	
		{
			displayMain();
			addSlideControl();
		}
		// Loader에서 이미지를 로드하여 화면에 추가
		private function displayMain():void
		{
			stage.align = StageAlign.TOP_LEFT;
			ld.load(new URLRequest("assets/okjaemin4.jpg"));
			// 이미지가 커서 크기를 30%로 축소함
			ld.scaleX = ld.scaleY = 0.3;
            // 알파값은 일단 0.5로 조정
            ld.alpha = 0.5;		
			this.addChild(ld);
		}
		// 슬라이더 컨트롤을 화면에 추가한다.
		private function addSlideControl():void
		{
			// 슬라이더 길이, 시작값, 종료값, 간격, 초기설정값
            slider = new AsExam8_Slider(470, 0, 1, 0.1, 0.5);
            // 슬라이더 위치 설정
            slider.y = 355;
            this.addChild(slider);
            // 슬라이더값이 바뀌었을 때 실행될 이벤트 핸들러 등록
            slider.addEventListener("sliderChanged", changeDisp);
		}
		
        private function changeDisp(event:MouseEvent):void
        {
        	// 슬라이더의 현재값을 읽어와
            var th:Number = slider.scrollAmount;
            // ColorTransformer를 이용하여 Loader의 알파값을 변경함
			var colorTransformer:ColorTransform = ld.transform.colorTransform;
			colorTransformer.alphaMultiplier = th;
			ld.transform.colorTransform = colorTransformer;
        }       		
	}
}