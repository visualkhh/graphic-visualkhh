package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	[Event(name="sliderChanged", type="flash.events.MouseEvent")]
	public class AsExam8_Slider extends Sprite
	{  
		// 슬라이더의 조절바를 그리기 위한 Sprite
		public var thumb:Sprite = new Sprite();
		// 슬라이더의 막대를 그리기 위한 Sprite
		public var bar:Sprite = new Sprite();
		// 슬라이더의 길이
		public var barLength:Number;
		// 슬라이더 값 
		public var scrollAmount:Number;
		// 슬라이더 최소값
		public var minVal:Number;
		// 슬라이더 최대값
		public var maxVal:Number;
		// 슬라이더 증가량
		public var moveUnit:uint=10;
		// 슬라이더 길이, 최소값, 최대값, 증가량, 커서의 위치(0~1사이)
		public function AsExam8_Slider(barLength:Number,  minVal:Number, maxVal:Number, moveUint:uint=10, cur:Number=0)
		{
			this.barLength = barLength;
			this.minVal = minVal;
			this.maxVal = maxVal;
			this.moveUnit = moveUnit;
			// 슬라이더 바를 그린다.
			drawBar();
			// 슬라이더 조절바을 그린다.			
			drawThumb(cur);
			// 이벤트 핸들러 등록 
			addEventHandlers();
		}
		
		private function addEventHandlers():void
		{
			// 조절바에 마우스 업, 다운 이벤트 핸들러를 등록한다. 
			thumb.addEventListener(MouseEvent.MOUSE_DOWN, startDragging);
			thumb.addEventListener(MouseEvent.MOUSE_UP, stopDragging);
			// 슬라이더 바에 클릭 이벤트 핸들러를 등록한다.						
            bar.addEventListener(MouseEvent.CLICK, controlThumb);
		}
        // 슬라이더의 길이만큼 사각형을 그린다.
        private function drawBar():void
        {
            bar.graphics.lineStyle(1, 0xCCCCCC);
            bar.graphics.beginFill(0x0000FF);
            // 약간의 길이 조정이 필요함
            bar.graphics.drawRect(-10, 0, barLength+20, 4);
            bar.graphics.endFill();
            bar.buttonMode = true;
            this.addChild(bar);
        }		
		// 슬라이더 조절바를 그린다.
		private function drawThumb(cur:Number):void 
		{
			// 알파값 0로 실제 조절바 보다 크게 원을 그린다.
			// 이는 조절바 마우스 드래그를 쉽게 하기 위함 
			thumb.graphics.beginFill(0xFFFFFF, 0);
			thumb.graphics.drawCircle(0, 0, 30);
			thumb.graphics.lineStyle(1, 0xCCCCCC);
			thumb.graphics.beginFill(0xFF0000, 1);
			thumb.graphics.drawCircle(0, 0, 8);
			thumb.graphics.endFill();
			thumb.buttonMode = true;
			this.addChild(thumb);
			// 조절바를 cur 위치에 둔다. 상대값이므로 barLength를 곱한다.
			thumb.x = cur*barLength;
		}
        // 슬라이더 바를 클릭하거나 조절바를 드래그 할 때 실행
		private function controlThumb(event:MouseEvent):void
		{
			// 조절바를 현재 마우스 위치로 이동한다.
            thumb.x = event.stageX;
            // 조절바의 위치가 벗어나지 않도록 한다. 
            if(thumb.x <0) thumb.x = 0;
            if(thumb.x > barLength) thumb.x = barLength;
            // 슬라이더바 길이에 대한 조절바의 위치값을 0~1 사이 값으로 환산
            var tempPos:Number = Math.ceil(thumb.x);
            scrollAmount = minVal + (maxVal-minVal)*(tempPos/barLength);
            trace(scrollAmount);
            // 화면을 먼저 업데이트하고 이벤트를 처리하도록 함으로써 부드러운 화면 처리가 되도록 함
            event.updateAfterEvent();
            // sliderChanged 이벤트 디스패치
            event.currentTarget.dispatchEvent(new MouseEvent("sliderChanged"));
		}
        // 조절바를 드래그 & 드랍하기 위한 이벤트 핸들러 함수 
		private function startDragging(event:MouseEvent):void 
		{
			 thumb.addEventListener(MouseEvent.MOUSE_MOVE, controlThumb);
		}
		private function stopDragging(event:MouseEvent):void 
		{
			thumb.removeEventListener(MouseEvent.MOUSE_MOVE, controlThumb);
		}		
	}
}