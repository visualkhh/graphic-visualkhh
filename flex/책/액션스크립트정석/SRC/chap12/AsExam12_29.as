package
{
	import flash.display.Sprite;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.net.XMLSocket;
	import flash.text.TextField;
    [SWF(backgroundColor = 0xffffff)]
	public class AsExam12_29 extends Sprite
	{
		// 소켓으로 보내는 메시지를 위한 텍스트필드
        private var tf:TextField = new TextField();
        // 소켓으로부터 받은 메시지를 보여주는 텍스트필드  
        private var textArea:TextField = new TextField();
        // XML 소켓 선언
        private var xmlSocket:XMLSocket;
        
		public function AsExam12_29()
		{
			displayMain();
			createSocket();
		}
		// 텍스트필드를 추가한다.
		private function displayMain():void
		{
            tf.text = 'AsExam12_29';
            tf.height = 20;
            tf.width = 300;
            tf.y = 10
            tf.border = true;
            tf.background = true; 
            tf.type = "input";
            // 텍스트를 입력하면 메시지를 화면에 보여준다.          
            tf.addEventListener(KeyboardEvent.KEY_DOWN, keyboardHandler);
            this.addChild(tf);
            textArea = new TextField();
            textArea.height = 150;
            textArea.width = 300;
            textArea.multiline = true;
            textArea.y = 40;
            textArea.type = "input";
            textArea.backgroundColor = 0x0FF0FF;
            textArea.background = true;
            textArea.border = true;       
            this.addChild(textArea);                  
        }
        // 8000번 포트로 XML 소켓을 연결한다.
        private function createSocket():void
        {
			xmlSocket = new XMLSocket();
			xmlSocket.connect("127.0.0.1", 8000);
    		xmlSocket.addEventListener(DataEvent.DATA, onData); 
    		xmlSocket.addEventListener(Event.CONNECT, connectHandler);
    		xmlSocket.addEventListener(Event.CLOSE, closeHandler);
		}
        // 엔터키를 누르면 소켓으로 메시지를 전송한다.
        private function keyboardHandler(evt:KeyboardEvent):void 
        {
            if(evt.keyCode == 13) 
            {
            	var msg:String = "<msg>" + tf.text + "</msg>\n";
	    		xmlSocket.send(msg); 
	    		// 텍스트필드의 값은 지운다.
	    		tf.text = '';
            }
        }    
        // 소켓서버 접속 성공시 실행
        private function connectHandler(event:Event):void
        {
        	textArea.appendText("소켓서버 접속 성공\n");
        }
        // 소켓서버 접속 종료시 실행
        private function closeHandler(event:Event):void
        {
        	textArea.appendText("소켓서버 접속 종료\n");
        }
        // 소켓에서 메시지가 전송되면 텍스트필드에 출력한다.
		private function onData(event:DataEvent):void 
		{ 
		    trace("[" + event.type + "]" + event.data + event.data.length); 
		    if(event.data.length > 0) textArea.appendText(event.data + "\n");
		}
	}
}