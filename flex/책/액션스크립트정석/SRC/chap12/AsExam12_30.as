package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.KeyboardEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.Socket;
	import flash.text.TextField;
    [SWF(backgroundColor = 0xffffff)]
	public class AsExam12_30 extends Sprite
	{
		// 바이너리 소켓 
		private var socket:Socket = new Socket();
        private var msgTF:TextField = new TextField();  
        private var nameTF:TextField = new TextField();  
        private var textArea:TextField = new TextField();		
		public function AsExam12_30()
		{
			displayMain();
			addEventHandlers();
			connectSocket();
		}
        // 이름, 메시지, 채팅내용을 보여주기 위한 텍스트필드 추가 
        private function displayMain():void
        {
            nameTF.text = 'okgosu';
            nameTF.height = 20;
            nameTF.width = 80;
            nameTF.y = 10;
            nameTF.border = true;
            nameTF.background = true; 
            nameTF.type = "input";          
            this.addChild(nameTF);
            msgTF.text = '보낼 메시지';
            msgTF.height = 20;
            msgTF.width = 300;
            msgTF.border = true;
            msgTF.background = true; 
            msgTF.type = "input";          
            msgTF.x = 85;
            msgTF.y = 10;
            this.addChild(msgTF);
            textArea = new TextField();
            textArea.height = 200;
            textArea.width = 385;
            textArea.multiline = true;
            textArea.y = 35;
            textArea.type = "input";
            textArea.backgroundColor = 0x0FF0FF;
            textArea.background = true;
            textArea.border = true;       
            this.addChild(textArea);               	
        }	
        // 텍스트필드와 소켓 이벤트 핸들러 함수 등록
        private function addEventHandlers():void
        {
            msgTF.addEventListener(KeyboardEvent.KEY_DOWN, keyboardHandler);
        	socket.addEventListener(Event.CONNECT, socketConnectHandler);
        	socket.addEventListener(Event.CLOSE, socketCloseHandler);
        	socket.addEventListener(ProgressEvent.SOCKET_DATA, socketDataHandler);
        	socket.addEventListener(IOErrorEvent.IO_ERROR, socketIOErrorHandler);
        	socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
        }        
        // 소켓 서버에 접속
        private function connectSocket():void
        {
        	socket.connect("127.0.0.1", 8000);
        }
        // 소켓 데이터가 수신되면 텍스트필드에 추가한다.
        private function socketDataHandler(event:ProgressEvent):void
        {
            var str:String = socket.readMultiByte(socket.bytesAvailable, "unicode");
            textArea.appendText(str);          
        }
        // 엔터키를 누르면 소켓으로 메시지 전송
        private function keyboardHandler(evt:KeyboardEvent):void 
        {
            if(evt.keyCode == 13) 
            {
            	var msg:String = "[" + nameTF.text + "]" + msgTF.text;
            	trace(msg);
                socket.writeMultiByte(msg + "\n", "unicode");
                socket.flush();
                msgTF.text = '';
            }
        }
        // 소켓 연결 성공
        private function socketConnectHandler(event:Event):void
        {
        	textArea.appendText("소켓 연결 성공");
        }
        // 소켓 연결 종료
        private function socketCloseHandler(event:Event):void
        {
        	textArea.appendText("소켓 연결 종료");
        }
        // 소켓 Security Error         
        private function securityErrorHandler(event:SecurityErrorEvent):void
        {
            textArea.appendText(event.text);
        }
        // 소켓 IOError 
        private function socketIOErrorHandler(event:IOErrorEvent):void
        {
            textArea.appendText(event.text);
        }
	}
}