package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.net.SharedObject;
    [SWF(backgroundColor = 0xffffff)]
	public class AsExam12_17 extends Sprite
	{
        private var tfNameSO:AsExam8_PromptTextField = new AsExam8_PromptTextField("name값을 입력하세요", false);
        private var tfBookSO:AsExam8_PromptTextField = new AsExam8_PromptTextField("book값을 입력하세요", false);
        private var readBtn:AsExam8_SimpleButton = new AsExam8_SimpleButton("READ", 40);
        private var saveBtn:AsExam8_SimpleButton = new AsExam8_SimpleButton("SAVE", 40);
        private var deleteBtn:AsExam8_SimpleButton = new AsExam8_SimpleButton("DELETE", 50);
        
		public function AsExam12_17()
		{
			displayMain();
			addEventHandlers();
		}
		// 버튼과 텍스트필드를 추가한다.
		private function displayMain():void
		{
            this.addChild(tfNameSO);
            this.addChild(tfBookSO);
            tfNameSO.y = 20;
            tfBookSO.y = 50;
            this.addChild(readBtn);
            this.addChild(saveBtn);
            this.addChild(deleteBtn);
            readBtn.y = saveBtn.y = deleteBtn.y = 90;
            saveBtn.x = 50;
            deleteBtn.x = 100;
		}
        
        private function addEventHandlers():void
        {
        	readBtn.addEventListener(MouseEvent.CLICK, clickHandler);
        	saveBtn.addEventListener(MouseEvent.CLICK, clickHandler);
        	deleteBtn.addEventListener(MouseEvent.CLICK, clickHandler);
        }
        
        private function clickHandler(event:MouseEvent):void
        {
        	switch (event.target.lblStr)
        	{
        		case "READ":
        		  readSO();
        		  break;
                case "SAVE":
                  saveSO();
                  break;
                case "DELETE":
                  deleteSO();
                  break;
        	}
        }
        // SO를 저장
        private function saveSO():void
        {
        	var so:SharedObject = SharedObject.getLocal("mySO", "/");
        	so.data.name = tfNameSO.text == null? "" : tfNameSO.text;
        	so.data.book = tfBookSO.text == null? "" : tfBookSO.text;
            var flushResult:Object = so.flush();
            trace("flushResult: " + flushResult);
        }
        // 저장된 SO를 읽어 온다.
        private function readSO():void
        {
        	var so:SharedObject = SharedObject.getLocal("mySO", "/");
            tfNameSO.text = so.data.name == null? "" : so.data.name;
            tfBookSO.text = so.data.book == null? "" : so.data.book;
            trace("okgosu SharedObject name:", so.data.name);
            trace("okgosu SharedObject book:", so.data.book);
        }
        // 저장된 SO를 삭제한다.
        private function deleteSO():void
        {
        	var so:SharedObject = SharedObject.getLocal("mySO", "/");
        	so.clear();
        }
	}
}