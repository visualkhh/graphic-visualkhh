package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	[SWF(backgroundColor=0xFFFFFF)]
	public class AsExam8_22 extends Sprite
	{
		public function AsExam8_22()
		{
			// 체크박스를 생성하여 화면에 추가한다.
			var checkBox:AsExam8_CheckBox = new AsExam8_CheckBox("체크박스", "ch");
			this.addChild(checkBox);
			// 체크박스 이벤트 (checkboxChecked)가 발생했을 때 checkBoxHandler함수가 실행되도록 한다
			checkBox.addEventListener("checkboxChecked", checkBoxHandler);			
		}

		private function checkBoxHandler(event:MouseEvent):void
		{
			var c:AsExam8_CheckBox = event.currentTarget as AsExam8_CheckBox;
			// 체크 박스의 상태에 따라 로직 실행
			if(c.checkboxEnabled) 
			{
				c.setCheckBoxText("체크됨");
			} 
			else 
			{
				c.setCheckBoxText("체크안됨");
			}
		}		
	}
}