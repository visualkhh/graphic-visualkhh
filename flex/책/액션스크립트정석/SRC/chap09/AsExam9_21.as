package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	[SWF(backgroundColor=0xFFFFFF)]
	public class AsExam9_21 extends Sprite
	{
		// locking, dispose를 위한 체크박스 추가
		private var cbLock:AsExam8_CheckBox = new AsExam8_CheckBox("Locking 여부", "ch_lock");
		private var chDisp:AsExam8_CheckBox = new AsExam8_CheckBox("Dispose 여부", "ch_disp");
		// locking, dispose 테스트를 위한 비트맵 객체 
		private var bm:Bitmap;
		public function AsExam9_21()
		{
            displayMain();
            addEventHandlers();
        }
        // 녹색 바탕의 비트맵을 화면에 추가한다.  
        private function displayMain():void
        {
        	// 알파값은 1, 색상은 Green인 비트맵 생성
			var bmd:BitmapData = new BitmapData(100, 100, true, 0xFF00FF00);
			bm = new Bitmap(bmd);
			this.addChild(bm);
			// 체크박스를 화면에 추가함
			this.addChild(cbLock);
			this.addChild(chDisp);
			cbLock.x = 100; 
			chDisp.x = 100;
			chDisp.y = 20;  
        }
        // 마우스클릭, 체크박스 체크 이벤트 핸들러 함수를 등록한다.
        private function addEventHandlers():void
        {
			stage.addEventListener(MouseEvent.CLICK, clickHandler);
			cbLock.addEventListener("checkboxChecked", checkBoxClickHandler);			
			chDisp.addEventListener("checkboxChecked", checkBoxClickHandler);			
		}
		// 화면을 클릭하면 그 픽셀을 색상을 빨간색으로 변경함
		private function clickHandler(event:MouseEvent):void
		{
			try
			{
			   bm.bitmapData.setPixel(event.stageX, event.stageY, 0xFFFF0000);
			}
			catch(ae:ArgumentError)
			{
				// dispose 체크박스가 체크되어 있으면 ArgumentError가 발생함.
    			trace('BitmapData는 dispose됐소이다', ae);
			}
		}
		// 체크박스를 클릭하면 실행되는 이벤트 핸들러 함수
		private function checkBoxClickHandler(event:MouseEvent):void
		{
			var ch:AsExam8_CheckBox = event.currentTarget as AsExam8_CheckBox;
			if(ch.name == 'ch_lock' && !chDisp.checkboxEnabled) 
			{
				// lock 체크박스가 체크되면 비트맵 데이터를 locking 한다.
				if(cbLock.checkboxEnabled) 
				{
					bm.bitmapData.lock();
				} 
				else // 체크가 해제되면 unlock 한다.
				{
					bm.bitmapData.unlock();
				}
			}
			
			if(ch.name == 'ch_disp')
			{
				// dispose 체크박스가 체크되면 비트맵 데이터를 dispose한다. (버린다.)
				if(chDisp.checkboxEnabled)
				{
					bm.bitmapData.dispose();
				} 
				else
				{
					bm.bitmapData  = new BitmapData(100, 100, true, 0xFF00FF00);
				}
			}
		}		
	}
}