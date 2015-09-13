package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	[SWF(backgroundColor=0xFFFFFF)]
	public class AsExam8_23 extends Sprite
	{
		// 라디오 버튼 2개를 생성한다.
		private var radio1:AsExam8_RadioButton = new AsExam8_RadioButton("", "radio1");
		private var radio2:AsExam8_RadioButton = new AsExam8_RadioButton("", "radio2");
		
		public function AsExam8_23()
		{
			// 라디오 버튼을 화면에 추가한 다음 radioChecked이벤트 핸들러를 등록한다.
			this.addChild(radio1);
			this.addChild(radio2);
			radio1.addEventListener("radioChecked", radioCheckedHandler);
			radio2.addEventListener("radioChecked", radioCheckedHandler);
			radio2.x = 20;
		}
		// radioChecked 이벤트가 발생하면 실행되는 함수 
		private function radioCheckedHandler(event:MouseEvent):void
		{
			var objName:String = event.currentTarget.name;
			// 한쪽이 선택되면 다른 쪽은 선택해제한다.  
			if(objName == 'radio1')
			{
				if(radio1.radioEnabled) radio2.drawUnchecked();
			} 
			if(objName == 'radio2')
			{
				if(radio2.radioEnabled)  radio1.drawUnchecked();
			}
		}		
	}
}