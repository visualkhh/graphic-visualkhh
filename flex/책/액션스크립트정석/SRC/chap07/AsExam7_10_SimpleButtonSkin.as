package 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	public class AsExam7_10_SimpleButtonSkin extends Sprite 
	{
		// 입력받은 라벨값을 표시할 텍스트 필드
		private var btnLabel:TextField = new TextField();
		// 라벨값, 배경색, 사이즈를 입력받아 스킨을 그린다.
		public function AsExam7_10_SimpleButtonSkin(lblStr:String, bg:int, size:int)
		{
	    	btnLabel.text = lblStr;
	    	btnLabel.x = 2;
	    	btnLabel.height = 20;
	    	btnLabel.width = size;
	    	this.addChild(btnLabel);            
	        graphics.beginFill(bg);
	        // size에 따라 모서리가 둥근 사각형을 그린다. 
        	graphics.drawRoundRect(0, 0, size, 20, 10, 10);				
	        graphics.endFill();
		}
	}
}