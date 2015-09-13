package
{
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import flash.events.TimerEvent;
    import flash.external.ExternalInterface;
    import flash.utils.Timer;
    
    public class AsExam12_20 extends Sprite
    {
        private var cp:AsExam8_ColorPanel = new AsExam8_ColorPanel(20, 15);
        private var tf:AsExam8_PromptTextField = new AsExam8_PromptTextField("자바스크립트로부터의 메시지 출력", false);
        public function AsExam12_20()
        {
            displayMain();
            cp.addEventListener("colorSelected", colorSelectedHandler);     
            initETF();
        }
         
        private function displayMain():void
        {
            this.addChild(tf);
            tf.width = 300;
            tf.height = 200;
            tf.y = 40;        	
            tf.x = 40;
            this.addChild(cp);
            cp.y = 40;
        }
        // 자바스크립트의 통신 준비 여부를 체크하여 자바스크립트가 호출할 액션스크립트 함수 등록
        private function initETF():void
        {
            if (ExternalInterface.available) 
            {
                try {
                	// 자바스크립트가 호출할 액션스크립트 함수 등록
                    ExternalInterface.addCallback("callActionScript", callActionScriptETF);
                    if (!ExternalInterface.call("isReady")) {
                        var readyTimer:Timer = new Timer(100, 0);
                        readyTimer.addEventListener(TimerEvent.TIMER, timerHandler);
                        readyTimer.start();
                    }
                } catch (error:SecurityError) {
                    trace("A SecurityError occurred: " + error.message + "\n");
                } catch (error:Error) {
                    trace("An Error occurred: " + error.message + "\n");
                }
            }        	
        }
        // 자바스크립트가 통신 준비가 되었는지 타이머 이벤트 핸들러에서 0.1초 단위로 체크한다.
        private function timerHandler(event:TimerEvent):void 
        {
            if (ExternalInterface.call("isReady")) 
            {
                Timer(event.target).stop();
            }
        }        
        // 컬러 선택기에서 색상을 선택하면 자바스크립트를 호출하여 html의 색상을 변경함
        private function colorSelectedHandler(event:MouseEvent):void
        {
	        var js:String = "function() { document.getElementById('mydiv').style.backgroundColor = 0x" + cp.selectedColor.toString(16) + ";}";
	        ExternalInterface.call(js);
                  
        }
        // 자바스크립트에서 액션스크립트의 텍스트필드 값을 변경함
        private function callActionScriptETF(msg:String):void
        {
            trace(msg);	
            tf.text = msg;
        }
    }
}