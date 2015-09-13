package 
{
	import flash.display.SimpleButton;
	public class AsExam7_10_SimpleButton extends SimpleButton 
	{
		public var lblStr:String;
		// 버튼 라벨값과 사이즈를 받는 생성자 함수
		public function AsExam7_10_SimpleButton(lblStr:String, size:int)
		{
			this.lblStr = lblStr;
			// 랜덤한 컬러로 4가지의 버튼 스킨을 생성한다.
	        downState      = new AsExam7_10_SimpleButtonSkin(lblStr, Math.random() * 0x1000000, size);
	        overState      = new AsExam7_10_SimpleButtonSkin(lblStr, Math.random() * 0x1000000, size);
	        upState        = new AsExam7_10_SimpleButtonSkin(lblStr, Math.random() * 0x1000000, size);
	        hitTestState   = new AsExam7_10_SimpleButtonSkin(lblStr, Math.random() * 0x1000000, size);
			useHandCursor  = true;
	    }		
	}
}