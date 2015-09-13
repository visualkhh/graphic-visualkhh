package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.external.ExternalInterface;
	[SWF(backgroundColor = 0xffffff)]
	public class AsExam12_19 extends Sprite
	{
		private var tf:AsExam8_PromptTextField = new AsExam8_PromptTextField("자바스크립트에 보낼 메시지를 입력하세요", false);
		private var sendBtn:AsExam8_SimpleButton = new AsExam8_SimpleButton("SEND", 40);
		public function AsExam12_19()
		{
			displayMain();
        	sendBtn.addEventListener(MouseEvent.CLICK, sendClickHandler);
		}
		// 텍스트필드와 버튼을 추가한다.
        private function displayMain():void
        {
            this.addChild(tf);
            tf.width = 200;
            tf.y = 50;
            this.addChild(sendBtn);
            sendBtn.x = 210;
            sendBtn.y = 50;
        }
        // 텍스트필드의 값을 읽어 자바스크립트 alert 함수 호출 
        private function sendClickHandler(event:MouseEvent):void
        {
            var js:String = "alert('" + tf.text + "')";
            ExternalInterface.call(js);        	
        }
	}
}