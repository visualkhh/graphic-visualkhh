package
{
	import flash.display.SimpleButton;
	// SimpleButton을 확장하여 정의
	public class AsExam8_ToggleButton extends SimpleButton
	{
		// 토글 상태를 저장
		public var toggled:Boolean;
		// 토글 스킨은 2가지만 있으면됨
		private var baseState:AsExam8_ToggleButtonSkin;
		private var onState:AsExam8_ToggleButtonSkin;
		// 토글 버튼 이름, 크기, 아이콘, 기본색상, 토글 색상, 모서리 둥글기
		public function AsExam8_ToggleButton(insName:String, tbWidth:Number, tbHeight:Number, iconURL:String, baseColor:int=0xFFFFFF, togggleColor:int=0xCCCCCC,conerRadius:Number=2)
		{
			this.name = insName;
			baseState =  new AsExam8_ToggleButtonSkin(baseColor, tbWidth, tbHeight,  iconURL, conerRadius);
			onState =  new AsExam8_ToggleButtonSkin(togggleColor, tbWidth, tbHeight,  iconURL, conerRadius);
			displayBaseState();	
		}
		// 토글 상태가 바뀌면 스킨을 바꿔줌
		public function setToggled():void 
		{
			if(toggled)
			{
				displayBaseState();
			}
			else
			{
		  		displayToggleState();
			}
		}
		// 토글된 상태의 스킨 지정
		public function displayToggleState():void
		{
	        downState       = onState;
	        overState       = onState;
	        upState         = onState;
	        hitTestState    = onState;				
			toggled = true;			
		}
		// 기본 상태의 스킨 지정
		public function displayBaseState():void 
		{
	        downState        = baseState;
	        overState        = baseState;
	        upState          = baseState;
	        hitTestState     = baseState;		
			toggled = false;			
		}
	}
}