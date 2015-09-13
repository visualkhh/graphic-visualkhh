package
{
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import flash.external.ExternalInterface;
    import flash.system.Capabilities;
    
    public class AsExam12_2 extends Sprite
    {
        public function AsExam12_2()
        {
        	showCapInfo();
            stage.addEventListener(MouseEvent.CLICK, clickHandler);
        }
        // 사용자의 language에 따른 os 정보를 자바스크립트 Alert로 보여준다
        private function showCapInfo():void 
        { 
        	var msg:String = '';
        	switch (Capabilities.language)
        	{
        		case "en":
        		  msg = 'Hello! you OS is ' + Capabilities.os;
        		  break;
        		case "ko":
        		  msg = '안녕하세요. 귀하의 운영체제는 ' + Capabilities.os + ' 입니다. 화면을 클릭하면 팝업이 생성됩니다.';
        		  break;
        		default:
        		  msg = 'Unsupported language!';
        		  break;
        	}
            var js:String = "alert('" + msg + "')";
            ExternalInterface.call(js);
        }
        // 화면을 클릭하면 사용자 PC의 해상도를 고려하여 모니터의 중앙지점에 팝업을 띄운다.
        private function clickHandler(event:MouseEvent):void
        {
            trace("language: " + Capabilities.language);
            trace("os: " + Capabilities.os);
            trace("screenResolutionX: " + Capabilities.screenResolutionX);
            trace("screenResolutionY: " + Capabilities.screenResolutionY);
            trace("version: " + Capabilities.version);
            var popX:Number = Capabilities.screenResolutionX/2-150;
            var popY:Number = Capabilities.screenResolutionY/2-150;
            var js:String = "function() {window.open('http://okgosu.net','popWin', 'width=300,height=300,left=" + popX +",top="+popY+"') }";
            ExternalInterface.call(js);
        }
        
    }
}