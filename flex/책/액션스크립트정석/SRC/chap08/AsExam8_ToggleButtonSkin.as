package
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.net.URLRequest;
	
	public class AsExam8_ToggleButtonSkin extends Sprite
	{
		public function AsExam8_ToggleButtonSkin(skinColor:int, tbWidth:Number, tbHeight:Number,iconURL:String, conerRadius:Number=2)
		{
			this.graphics.beginFill(skinColor);
			this.graphics.lineStyle(0.3, 0x000000, 1, true);
			this.graphics.drawRoundRect(0, 0, tbWidth, tbHeight, conerRadius);
			this.graphics.endFill();
			if(iconURL != "") 
			{
				// 아이콘이 있으면 Loader에서 아이콘을 로드함 
				var ld:Loader = new Loader();
				ld.load(new URLRequest(iconURL));
				this.addChild(ld);
				// 아이콘의 스케일을 0.5로 줄임
				//ld.scaleX = ld.scaleY = 0.5;
			}
		}
	}
}