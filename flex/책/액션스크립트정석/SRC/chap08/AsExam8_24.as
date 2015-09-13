package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
    import flash.display.Loader;
    import flash.net.URLRequest;
    [SWF(backgroundColor=0xFFFFFF)]        
	public class AsExam8_24 extends Sprite
	{
		// 숫자 입력기 생성, 시작값은 1, 최고값은 10
		private var ns:AsExam8_NumericStepper = new AsExam8_NumericStepper(1, 10);
        // 이미지를 하나 로드한다.
        private var ld:Loader = new Loader();
		public function AsExam8_24()
		{
            ld.load(new URLRequest("assets/okjaemin3.jpg"));
            this.addChild(ld);		
            ld.x = 50;	
            // 이미지가 커서 크기를 적당히 줄임
            ld.scaleX = ld.scaleY = 0.1;
			// 숫자 입력기를 화면에 추가
			this.addChild(ns);
			// 숫자 입력이벤트 핸들러 등록
			ns.addEventListener("numberChanged", numberChangedHandler);
		}
		
		private function numberChangedHandler(event:MouseEvent):void
		{
			// 숫자 입력기 값에 따라 로드한 이미지를 아래위로 이동함
			// 방향을 맞춰 주기 위해 -1을 곱하고, 움직이는 간격을 크게 하기 위해 10을 곱함 
		    ld.y = -ns.selectedNumber*10; 
		}
	}
}