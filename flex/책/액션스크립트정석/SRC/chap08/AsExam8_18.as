package
{
	import flash.display.Sprite;
	public class AsExam8_18 extends Sprite
	{
		public function AsExam8_18()
		{
			var tf:AsExam8_PromptTextField = new AsExam8_PromptTextField("아이디를 입력하세요", false);
            tf.y = 20;
            this.addChild(tf);
			var tf2:AsExam8_PromptTextField = new AsExam8_PromptTextField("암호를 입력하세요", true);
            tf2.y = 50;
            this.addChild(tf2);
		}
	}
}