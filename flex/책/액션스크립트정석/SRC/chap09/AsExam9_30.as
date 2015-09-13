package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.Timer;	
	[SWF(backgroundColor=0xFFFFFF)]
	public class AsExam9_30 extends Sprite
	{
		// 원본 이미지 비트맵
        [Embed(source="assets/little-prince.png")]
        public var Photo:Class;         
        private var bg:Bitmap = new Photo();
        // 디졸브 모드 플래그 
        private var dissoveFlag:Boolean=true;	
		// 비트맵 데이터 생성
		private var bmd:BitmapData = new BitmapData(220, 220, false, 0xCCCCCC);
		// 타이머 객체 생성
		private var timer:Timer = new Timer(20);

		public function AsExam9_30()
		{
			displayMain();
		    addEventHandlers();	
		}
        // 회색바탕의 150*150 비트맵을 생성하여 화면에 추가 		
		private function displayMain():void
		{
			var bitmap:Bitmap = new Bitmap(bmd);
    		this.addChild(bitmap);
    		
            stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.align = StageAlign.TOP;          		
		}
		// 픽셀디졸브 이펙트를 작동시키는 타이머이벤트 핸들러 함수 호출 
		private function addEventHandlers():void
		{
			timer.start();
			timer.addEventListener(TimerEvent.TIMER, timerHandler);
			stage.addEventListener(MouseEvent.CLICK, clickHandler);
		}
		
		private function clickHandler(event:MouseEvent):void
		{
		    dissoveFlag = !dissoveFlag;	
		}
		
        // 타이머이벤트가 발생할 때 마다 랜덤하게 디졸브이펙트를 발생시킴
		private function timerHandler(event:TimerEvent):void 
		{
		    var randomNum:Number = Math.floor(Math.random() * int.MAX_VALUE);
		    dissolve(randomNum);
		}
		// 랜덤한 숫자값에 따라 픽셀디졸브 적용
		private function dissolve(randomNum:Number):void 
		{
		    var numberOfPixels:uint = 100;
		    if(dissoveFlag) // 원본이미지(bmd)를 다른(bg) 이미지로 변화시키는 픽셀디졸브
		    {
		      bmd.pixelDissolve(bg.bitmapData, bg.bitmapData.rect, new Point(0, 0), randomNum, numberOfPixels, 0xFFFF00);
		    } 
		    else // 노란색의 픽셀들이 나타나는 픽셀디졸브 적용
		    {
		      bmd.pixelDissolve(bmd, bmd.rect, new Point(0, 0), randomNum, numberOfPixels, 0xFFFFFF00);
		    }
		    // 픽셀디졸브가 적용된 크기 체크
		    checkDissolveAmount();
		}
		// getColorBoundsRect함수를 이용하여 회색 픽셀이 남은 양을 체크하여 타이머이벤트 핸들러를 정지시킴  
		private function checkDissolveAmount():void
		{
		    var grayRegion:Rectangle = bmd.getColorBoundsRect(0xFFFFFF, 0xCCCCCC, true);
		    if(grayRegion.width == 0 && grayRegion.height == 0)  timer.stop();
		}
	}
}	