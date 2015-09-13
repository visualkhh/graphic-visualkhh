package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	[SWF(backgroundColor=0xFFFFFF)]
	public class AsExam8_12 extends Sprite
	{
		public function AsExam8_12()
		{
			addTextField_ID();
			addTextField_PW();
			addTextField_EMAIL();
			addTextField_NAME();
			addSimpleButton("Reset", 40, 60, 190);     
		}

        private function addSimpleButton(lblStr:String, size:int, xPos:int, yPos:int):void 
        {
        	var btn:AsExam8_SimpleButton = new AsExam8_SimpleButton(lblStr, size);
        	btn.x = xPos;
        	btn.y = yPos;
        	btn.addEventListener(MouseEvent.CLICK, resetForm);
        	this.addChild(btn);
        }
        // 리셋 버튼이 눌려지면 화면에 추가된 TextField를 찾아 기본값을 보여주는 함수(displayDefaultText()를 호출한다.)
		private function resetForm(evt:MouseEvent):void 
		{
			for(var idx:int=0; idx<this.numChildren; idx++)
			{
				if(this.getChildAt(idx) is AsExam8_PromptTextField) 
				{
					var temp:AsExam8_PromptTextField = this.getChildAt(idx) as AsExam8_PromptTextField;
					temp.displayDefaultText();
				}
			}
		}        

		private function addTextField_ID():void 
		{
			var tf:AsExam8_PromptTextField = new AsExam8_PromptTextField("아이디를 입력하세요", false);
            tf.x = 10;
            tf.y = 70;
            tf.maxChars = 8;
            tf.restrict="0-9A-z";
            this.addChild(tf);
		}
		private function addTextField_PW():void 
		{
			var tf:AsExam8_PromptTextField = new AsExam8_PromptTextField("암호를 입력하세요", true);
            tf.x = 10;
            tf.y = 100;
            tf.maxChars = 8;
            this.addChild(tf);
		}
		private function addTextField_EMAIL():void 
		{
			var tf:AsExam8_PromptTextField = new AsExam8_PromptTextField("이메일을 입력하세요", false);
            tf.x = 10;
            tf.y = 130;
            tf.maxChars = 50;
            tf.restrict="0-9A-z.@_\\-^[-]`\\^";
            this.addChild(tf);
		}
		private function addTextField_NAME():void 
		{
			var tf:AsExam8_PromptTextField = new AsExam8_PromptTextField("이름을 입력하세요", false);
            tf.x = 10;
            tf.y = 160;
            tf.maxChars = 30;
            tf.restrict = "^[-`!-/:-@{-~" ;
            this.addChild(tf);
		}
	}	
}