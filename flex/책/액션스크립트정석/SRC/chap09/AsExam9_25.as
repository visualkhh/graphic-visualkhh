package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	public class AsExam9_25 extends Sprite
	{
		// merge 테스트를 위한 비트맵 객체
		private var bm1:Bitmap;
		private var bm2:Bitmap;
		// merge할 비트맵 영역에 해당하는 Rectangle 객체
		private var rect_square1:Rectangle = new Rectangle(0, 0, 100, 100);
		private var rect_square2:Rectangle = new Rectangle(0, 0, 100, 100);
		
		public function AsExam9_25()
		{
			displayMain();
			addEventHandlers();
		}
		// 비트맵데이터를 생성하여 비트맵으로 만들어 화면에 추가한다.  
		private function displayMain():void
		{
			var bmd1:BitmapData = new BitmapData(100, 100, true, 0xFF00FF00);
			var bmd2:BitmapData = new BitmapData(100, 100, true, 0xFFFF0000);
			bm1 = new Bitmap(bmd1);
			bm2 = new Bitmap(bmd2);
			bm2.x = 100;			
			this.addChild(bm2);
			// merge를 위해 bm1이 위에 오도록 뒤에 추가한다.
			this.addChild(bm1);
		}
		// bm2를 마우스에 따라 움직이도록 하기 위한 마우스무브 핸들러 함수 등록 
		private function addEventHandlers():void
		{
			stage.addEventListener(MouseEvent.MOUSE_MOVE, moveHandler);
		}
		// 마우스가 움직이는 동안 bm1과 bm2가 겹치는 영역에 대해 merge 연산 수행 
		private function moveHandler(event:MouseEvent):void
		{
			// bm2와 사각영역을 마우스 위치로 옮긴다. 
		    rect_square2.x = bm2.x = event.stageX;
		    rect_square2.y = bm2.y = event.stageY;
		    // bm1과 bm2에 대응하는 사각영역의 겹치는 부분이 있는지 체크한다.
			if(rect_square1.intersects(rect_square2)) 
			{
				// 겹치는 사각영역을 계산하고
				var rect_inter:Rectangle = rect_square2.intersection(rect_square1);
				// merge 시작점을 설정한다.
				var pt:Point = new Point(rect_inter.x, rect_inter.y);
				// 각 색상채널을 블랜드할 때 곱하는 비율로 0xFF는 100%, 0x80은 50%, 0은 0%가 됨
				var mult:uint = 0x80;
				// 기존에 merge된 색상을 지우기 위해 bm1의 비트맵데이터를 다시 생성한다.
				bm1.bitmapData = new BitmapData(100, 100, true, 0xFF00FF00);
				// bm1와 bm2를 머지하여 화면에 그린다. (노란색 영역)
				bm1.bitmapData.merge(bm2.bitmapData, rect_inter, pt, mult, 0, 0, 0);
				event.updateAfterEvent();
			}
		}
	}
}