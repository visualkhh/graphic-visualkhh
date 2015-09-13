package {
	import flash.display.Sprite;
	// 마우스 이벤트 처리를 위한 클래스 import 
	import flash.events.MouseEvent;	
	// 그래픽 객체간 겹치는 방법 설정을 위한 클래스 import
	import flash.display.BlendMode;
	[SWF(backgroundColor=0x000000)]
	public class AsExam3_7 extends Sprite 
	{
		// 그래픽 객체 선언 		
		private var circleSpr:Sprite;
		public function AsExam3_7() {
			
			displayMain();
			addEventHandlers();
		}
		private function displayMain():void
		{
			//그래픽 객체 인스턴스화 
			circleSpr = new Sprite();  
			//화면에 보이도록 그래픽 객체 추가			
			this.addChild(circleSpr);
			circleSpr.graphics.beginFill(0x000000);
			circleSpr.graphics.drawRect(0, 0, 500, 500);
			circleSpr.blendMode= BlendMode.LIGHTEN;
        }
        private function addEventHandlers():void
        {
			//마우스를 클릭할 때 실행될 함수(mouseClickHandler)지정 
			stage.addEventListener(MouseEvent.CLICK, mouseClickHandler);			
		}
		// 화면을 클릭할 때 마다 AsExam3_6의 인스턴스를 만들어 화면에 추가 
		private function mouseClickHandler(event:MouseEvent):void {
			var sp:AsExam3_6 = new AsExam3_6(this.mouseX, this.mouseY);
			sp.blendMode = BlendMode.LIGHTEN;
			circleSpr.addChild(sp);
			// 인스턴스 변수의 호출 방법 
			trace("sp.radius: " + sp.radius);
			// static 변수의 호출 방법 
			trace("AsExam3_6.randomColor: " +  AsExam3_6.randomColor);

			// radius는 인스턴스변수이므로 static으로는 호출 안됨
			// trace("AsExam3_6.radius: " +  AsExam3_6.radius);
			// randomColor는 static이므로 인스턴스 변수 방식으로는 호출 안됨 
			// trace("sp.randomColor: " +  sp.randomColor);
		}		
	}
}