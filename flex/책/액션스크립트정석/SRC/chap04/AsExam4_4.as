package
{
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
    [SWF(backgroundColor=0xFFFFFF)]
	public class AsExam4_4 extends Sprite
	{
		// 정답이될 숫자변수
		private var quizNumber:int;
		// 답변 시도 횟수
		private var guessCount:int;
		// 숫자를 입력받는 텍스트필드
        private var ansTF:TextField = new TextField();
		private var label:TextField = new TextField();
		public function AsExam4_4()
		{
			displayMain();
			addEventHandlers();
		}
		// 안내문과 숫자를 입력받을 텍스트필드를 화면에 추가한다.
		private function displayMain():void
		{
			quizNumber = Math.random() * 100;
			this.addChild(label);
			label.text = '0~99까지의 숫자를 입력한 후 엔터키를 치시오.';
			label.autoSize = "left";
	        label.x = 40;
	        label.y = 10;
	        this.addChild(ansTF);
	        ansTF.type = "input";
	        ansTF.border = true;
	        ansTF.background = true;
	        ansTF.width = 30;
	        ansTF.height = 20;
	        // 글자수 입력은 3자 이내
	        ansTF.maxChars = 3;
	        ansTF.y = 10;
	        // 숫자만 입력되도록 제한 
	        ansTF.restrict = "0-9";
		}
		
		// 숫자 입력창에 키보드 이벤트 핸들러 함수를 추가함
		private function addEventHandlers():void
		{
	        ansTF.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
		}
		
		// 엔터키 입력이 들어오면 숫자값을 비교해서 메시지를 보낸다.
		private function keyDownHandler(event:KeyboardEvent):void
		{
			if(event.keyCode == 13) 
			{
				guessCount++;
				trace(ansTF.text, quizNumber);
				label.text = "입력한 숫자는 " + ansTF.text + "이며";
				var num:int = int(ansTF.text);
				if(num > quizNumber)
				{
					label.text = "정답보다 크구료. [" + guessCount + "]번째 도전" ;
				} 
				else if(num < quizNumber)
				{
					label.text = "정답보다 적구료. [" + guessCount + "]번째 도전" ;
				}
				else if(num == quizNumber)
				{
				    label.text = "[" + guessCount + "]번째 도전만에" + quizNumber + "를 맞췄소.";
				    // 정답을 맞추면 숫자를 다시 랜덤으로 생성한다.
				    quizNumber = Math.random() * 100;
				    guessCount = 0;
				}
			}
		}
	}
}