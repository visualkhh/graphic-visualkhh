package
{
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	
	public class AsExam8_ComboBoxTriangleButton extends SimpleButton
	{
		public function AsExam8_ComboBoxTriangleButton(comboWidth:Number)
		{
			var sp:Sprite = new Sprite();
			sp.graphics.lineStyle(1, 0xCCCCCC);
			sp.graphics.beginFill(0xFF0000);
			sp.graphics.moveTo(0, 0);
			sp.graphics.lineTo(comboWidth, 0);
			sp.graphics.lineTo(comboWidth/2, comboWidth);
			sp.graphics.lineTo(0, 0);
			sp.graphics.endFill();

			var sp2:Sprite = new Sprite();
			sp2.graphics.lineStyle(1, 0xCCCCCC);
			sp2.graphics.beginFill(0x0000FF);
			sp2.graphics.moveTo(0, 0);
			sp2.graphics.lineTo(comboWidth, 0);
			sp2.graphics.lineTo(comboWidth/2, comboWidth);
			sp2.graphics.lineTo(0, 0);
			sp2.graphics.endFill();
			
			this.downState    = sp2;
	        this.overState      = sp2;
	        this.upState        = sp;
	        this.hitTestState   = sp;

		}
	}
}