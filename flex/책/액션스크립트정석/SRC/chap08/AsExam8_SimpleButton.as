package 
{
	import flash.display.SimpleButton;

	public class AsExam8_SimpleButton extends SimpleButton 
	{
		public var lblStr:String;
		public var link:String;
		// 버튼 라벨, 핸드커서, 버튼활성화여부, 버튼크기를 입력 받는다.
		public function AsExam8_SimpleButton(lblStr:String, size:int, link:String="", handFlag:Boolean=true, enabledFlag:Boolean=true)
		{
			this.lblStr = lblStr;
			this.link = link;
            this.useHandCursor  = handFlag;
            this.enabled = enabledFlag;
            this.mouseEnabled = enabledFlag;
            this.trackAsMenu = true;			
            // 각 버튼 상태에 대한 스킨과 사이즈를 지정한다.
            // 스킨 색상은 랜덤하게 만들어진다.
	        downState      = new AsExam8_SimpleButtonSkin(lblStr, Math.random() * 0x1000000, size);
	        overState      = new AsExam8_SimpleButtonSkin(lblStr, Math.random() * 0x1000000, size);
	        upState        = new AsExam8_SimpleButtonSkin(lblStr, Math.random() * 0x1000000, size);
	        hitTestState   = new AsExam8_SimpleButtonSkin(lblStr, Math.random() * 0x1000000, size);
	    }		
	}
}