package
{
    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.events.KeyboardEvent;
    import flash.events.MouseEvent;
    import flash.events.StatusEvent;
    import flash.net.LocalConnection;
    import flash.text.TextField;
    [SWF(backgroundColor = 0xffffff)]
    public class AsExam12_25_Sub extends Sprite
    {
        private var tf:TextField = new TextField();     
        // LocalConnection Caller  
        private var lc:LocalConnection;
        private var btn:AsExam8_SimpleButton = new AsExam8_SimpleButton("LocalConnection 종료", 120);
        public function AsExam12_25_Sub()
        {
            displayMain();
            connectLocalConnection();
            tf.addEventListener(KeyboardEvent.KEY_DOWN, keyboardHandler);
            btn.addEventListener(MouseEvent.CLICK, clickHandler);
        }
        
        private function displayMain():void
        {
            stage.align = StageAlign.TOP_LEFT;
            tf.text = 'AsExam12_25_Sub';
            tf.height = 20;     
            tf.width = 400;
            tf.x = tf.y = 10;
            tf.border = true;
            tf.background = true; 
            tf.type = "input";          
            this.addChild(tf);
            btn.x = 420;
            btn.y = 10;
            this.addChild(btn);
        }       
        // AsExam12_25의 LocalConnection에 연결
        private function connectLocalConnection():void
        {
            try 
            {  
                lc = new LocalConnection(); 
                lc.connect("MyLocalConnection"); 
                lc.addEventListener(StatusEvent.STATUS, statusHandler);
            } 
            catch (error:Error) 
            { 
                trace("error:: MyLocalConnection already connected"); 
            }             
        }        
        // LocalConnection 상태변화에 따른 이벤트 출력함수
        private function statusHandler(event:StatusEvent):void 
        {
            switch (event.level) 
            {
                case "status":
                    trace("LocalConnection.send() succeeded");
                    break;
                case "error":
                    trace("LocalConnection.send() failed");
                    break;
            }
        }        
        // 텍스트필드에 값을 입력하고 엔터를 치면 로컬커넥션으로 AsExam12_55의 sendLocalMsg 함수 호출
        private function keyboardHandler(event:KeyboardEvent):void 
        {
            if(event.keyCode == 13) 
            {
                lc.send("MyLocalConnection", "sendLocalMsg", tf.text);
            }
        }
        
        private function clickHandler(event:MouseEvent):void
        {
            lc.send("MyLocalConnection", "closeConnection");
        }
    }
}