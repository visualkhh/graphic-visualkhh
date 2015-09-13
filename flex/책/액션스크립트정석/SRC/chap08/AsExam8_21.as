package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	[SWF(backgroundColor=0xFFFFFF)]
	public class AsExam8_21 extends Sprite
	{
		private var toggledBtn:AsExam8_ToggleButton;
		public function AsExam8_21()
		{
			// 토글 버튼 생성 (이름, 크기, 아이콘, 기본색상, 토글 색상, 모서리 둥글기) 
			toggledBtn = new AsExam8_ToggleButton("tbAL", 130, 130, "assets/tree_big.png", 
			                                       Math.random()*0x1000000, 0xCCCCCC, 10);
			this.addChild(toggledBtn);
			toggledBtn.x = toggledBtn.y = 50;
			toggledBtn.addEventListener(MouseEvent.CLICK, clickHandler);
			// 토글 버튼에 그림자 효과 필터 적용 
			toggledBtn.filters = [new DropShadowFilter()];
		}
		// 토글 버튼을 클릭하면 실행되는 함수
		private function clickHandler(event:MouseEvent):void
		{
			// 토글 버튼을 토글 시킴 
			toggledBtn.setToggled();
			if(toggledBtn.toggled) 
			{
				trace("토글 버튼 On ");
			}
			else
			{
				trace("토글 버튼 Off");
			}
		}				
	}
}