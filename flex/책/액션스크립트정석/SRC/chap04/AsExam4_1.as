package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;

    [SWF(backgroundColor=0x000000)]
	public class AsExam4_1 extends Sprite
	{
		// 막대 그래프의 길이 
		private var barHeight:int = 100;
		// 막대 그래프를 그리기 위한 디스플레이 오브젝트
		private var sp:Sprite = new Sprite();
		public function AsExam4_1()
		{
			displayMain();
			drawBar();
			addEventHandlers();
		}
		private function displayMain():void
		{
			// 버튼 모드로 설정
		    sp.buttonMode = true;
		    // 화면에 디스플레이 오브젝트 추가
			this.addChild(sp);
		}
		
		private function addEventHandlers():void
		{
			// 디스플레이 오브젝트를 클릭했을 때 실행될 함수 지정
			sp.addEventListener(MouseEvent.CLICK, clickHandler);
		}
		
		private function clickHandler(event:MouseEvent):void
		{
			// 막대그래프의 길이를 1씩 증가시킴
			barHeight++;
			drawBar();
		}
		
		// 흰색 테두리에 랜덤으로 색깔이 바뀌는 사각형을 그려주는 함수
        private function drawBar():void
        {
            sp.graphics.clear();
            sp.graphics.lineStyle(2, 0xCCCCCC);
            sp.graphics.drawRect(50, 100, 200, 50);
            sp.graphics.beginFill(Math.random()*0x1000000, 0.5);
            sp.graphics.drawRect(50, 100, barHeight, 50);
        }
	}
}