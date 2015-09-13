package
{
    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.text.TextField;    
    import flash.net.LocalConnection;
    import flash.system.fscommand; 
    import flash.events.KeyboardEvent;
    [SWF(backgroundColor = 0xffffff)]
    public class AsExam12_25 extends Sprite
    {
        private var tf:TextField = new TextField();     
        // LocalConnection Client
        private var lc:LocalConnection;
        public function AsExam12_25()
        {
            displayMain();
            readyLocalConnection();
        }
        
        private function displayMain():void
        {
            stage.align = StageAlign.TOP_LEFT;
            tf.text = 'AsExam12_25';
            tf.height = 20;
            tf.width = 400;
            tf.x = tf.y = 10;
            tf.border = true;
            tf.background = true; 
            this.addChild(tf);
        }        
        // MyLocalConnection이란 이름으로 접속 대기
        public function readyLocalConnection():void
        { 
            try 
            {  
                lc = new LocalConnection();
                lc.connect("MyLocalConnection"); 
                lc.client = this; 
            } 
            catch (error:Error) 
            { 
                trace("error:: MyLocalConnection already connected"); 
            } 
        } 
        // AsExam12_25_Sub가 호출하는 함수이므로 public으로 선언
        public function sendLocalMsg(msg:String):void 
        { 
            trace("[AsExam12_25_Sub로부터 메시지]: " + msg);
            tf.text = "[AsExam12_25_Sub로부터 메시지]: " + msg;
        }   
        // LocalConnection을 종료한다.
        public function closeConnection():void 
        { 
            trace("closing LocalConnection"); 
            lc.close(); 
        } 
    }
}