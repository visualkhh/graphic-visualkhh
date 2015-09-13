package
{
	import flash.display.Sprite;
	import flash.system.Security;
	import flash.text.TextField;

	public class AsExam12_21_Sub extends Sprite
	{
		public var tf:TextField = new TextField();
		public function AsExam12_21_Sub()
		{
			displayMain();
			drawBG(); 
			//Security.allowDomain("http://okgosu.net");
		}
		
		private function displayMain():void
		{
			this.addChild(tf);
			tf.width = 300;
			tf.height = 20;
			tf.x = tf.y = 20;
			tf.border = true;
			tf.background = true; 
			tf.text = 'AsExam12_21_Sub:';
		}
		
		public function drawBG():void
		{
		    this.graphics.beginFill(Math.random()*0x1000000);
		    this.graphics.drawRect(10, 10, 320, 40); 	
		}
	}
}