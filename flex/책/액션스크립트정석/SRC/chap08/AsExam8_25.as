package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
    import flash.net.URLRequest;
	import flash.net.navigateToURL;
		
	public class AsExam8_25 extends Sprite
	{
		public function AsExam8_25()
		{
			// 콤보박스를 위한 배열 선언
			var comboArr:Array = ["okgosu.net", "okgosu.tistory.com", "acornpub.co.kr"];
            // 콤보박스 객체 생성 및 화면 추가
            var comboBox:AsExam8_ComboBox = new AsExam8_ComboBox(comboArr, 100, 15, "");
            this.addChild(comboBox);
            this.y = 50;
            // 콤보박스를 선택했을 때 발생하는 comboChanged 이벤트 핸들러 함수 추가
			comboBox.addEventListener("comboChanged", comboChangedHandler);
		}
        // 콤보박스를 선택하면 발생하는 이벤트 
		private function comboChangedHandler(event:MouseEvent):void
		{
			var c:AsExam8_ComboBox = event.currentTarget as AsExam8_ComboBox;
			// 콤보박스의 선택된 값을 읽어서 그 URL로 이동함  
			var req:URLRequest = new URLRequest("http://" + c.selectedData);
            navigateToURL(req);
		}		
	}
}