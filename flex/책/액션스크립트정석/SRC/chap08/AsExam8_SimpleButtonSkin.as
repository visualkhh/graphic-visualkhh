package 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	// 스킨은 Shape로 해도 되지만 TextField를 표시해야하므로 Sprite로 한다.
	public class AsExam8_SimpleButtonSkin extends Sprite
	{
		// 버튼 라벨을 표시할 텍스트필드
		private var btnLabel:TextField;
		public function AsExam8_SimpleButtonSkin(lblStr:String, bg:int, size:int)
		{
			// 텍스트필드를 생성하여 화면에 추가한다.
	    	btnLabel = new TextField();
	    	btnLabel.text = lblStr;
	    	btnLabel.x = 2;
	    	// 기본적으로 텍스트필드의 높이는 20픽셀로 해놓는다.
	    	btnLabel.height = 20;
	    	// 텍스트필드의 길이는 버튼의 사이즈와 동일하게 한다.
	    	btnLabel.width = size;
	    	this.addChild(btnLabel);            
	    	// 버튼의 스킨을 그린다.
	        graphics.lineStyle(1, Math.random()*0x1000000);
	        graphics.beginFill(bg);
        	graphics.drawRoundRect(0, 0, size, 20, 10, 10);				
	        graphics.endFill();
		}
	}
}