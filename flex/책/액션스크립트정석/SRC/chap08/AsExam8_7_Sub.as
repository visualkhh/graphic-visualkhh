package
{
	import flash.display.Sprite;
	
	public class AsExam8_7_Sub extends Sprite
	{
		public var bgColor:int;
		public function AsExam8_7_Sub() 
		{
			bgColor = Math.random() * 0x1000000;
			this.graphics.lineStyle(1, 0xFFFFFF);
			this.graphics.beginFill(bgColor);
			this.graphics.drawRect(0, 0, 50, 50);
		}
	}
}