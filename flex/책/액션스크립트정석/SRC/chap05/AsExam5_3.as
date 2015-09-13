package {
	import flash.display.Sprite;
	import flash.events.*;
	import flash.text.TextField;
	//?: 문을 이용한 하이로우 게임
	public class AsExam5_3 extends Sprite 
	{
		private var tfMain:TextField = new TextField();//결과 메시지  텍스트필드
		private var cardHighNum:uint;// High 카드 숫자
		private var cardLowNum:uint; // Low 카드 숫자
		// 카드를 그려주는 내부 클래스를 생성
        private var cardHigh:AsExam5_3_Card = new AsExam5_3_Card(5, 25, 100, 170, "HIGH", 0xEFAE63);
        private var cardLow:AsExam5_3_Card = new AsExam5_3_Card(120, 25, 100, 170, "LOW", 0xC6DB94);		
		
		public function AsExam5_3()
		{
            displayMain();
            addEventHandlers();
		}
		// 카드를 2장 추가하고 메시지를 보여주는 텍스트 필드를 추가한다.
		private function displayMain():void
		{
			this.addChild(cardHigh);
			this.addChild(cardLow);
			this.addChild(tfMain);
			tfMain.x = 5;
			tfMain.y = 200;
			tfMain.width = 300;
			tfMain.text = "왼쪽은 High, 오른쪽은 Low 클릭하세요."; 	
		}
		// 카드를 클릭했을 때 실행될 함수를 지정한다.
		private function addEventHandlers():void
		{
			cardHigh.addEventListener(MouseEvent.CLICK, cardHighHandler);
			cardLow.addEventListener(MouseEvent.CLICK, cardLowHandler);
		}
		// High 패를 선택했을 때 실행
		private function cardHighHandler(event:MouseEvent):void 
		{
			shuffleCards();
			winCheck(1, cardHighNum, cardLowNum);
		}
		// Low 패를 선택했을 때 실행
		private function cardLowHandler(event:MouseEvent):void 
		{
			shuffleCards();
			winCheck(2, cardLowNum, cardHighNum);
		}	
		// 카드 패 번호를 섞어서 각 카드 1 ~ 10까지 번호를 배정 
		private function shuffleCards():void 
		{
			cardHighNum = Math.random() * 10 + 1;
			cardLowNum = Math.random() * 10 + 1;
			cardHigh.setMsg("High : [" + cardHighNum + "]");
			cardLow.setMsg("Low : [" + cardLowNum + "]");
		}
		// High냐 Low냐에 따라서 카드패 번호를 ? 연산자로 비교하여 결과 메시지 생성 
		private function winCheck(card:uint, yourNum:uint, comNum:uint):void 
		{
			var resMsg:String; //결과 메시지
			switch(card) {
				case 1: // high
					resMsg = yourNum > comNum ? "You win! " : "You lose"; 
					break;
				case 2: // low
					resMsg = yourNum < comNum ? "You win! " : "You lose";
					break;
			}
			tfMain.text = resMsg;
		}
	}
}

import flash.display.Sprite;
import flash.text.TextField;
// 카드를 그려주는 내부 클래스	
class AsExam5_3_Card extends Sprite
{
    private var tf:TextField = new TextField();
    // 카드의 좌표, 가로세로 크기, 메시지, 카드 색상을 입력받음
	public function AsExam5_3_Card(px:Number, py:Number, w:Number, h:Number, label:String, c:uint)
	{
		// 카드의 모양(사각형)을 그려줌
        this.graphics.beginFill(0xFFFFFF);
        this.graphics.drawRect(px, py, w, h);    
        this.graphics.beginFill(c);
        this.graphics.drawRect(px+2, py+2, w-4, h-4);
        this.graphics.endFill();		

        tf.text = label;
        tf.x = px + 30;
        tf.y = this.height/2;
        this.addChild(tf);        
	}
	// 카드에 표기될 메시지를 설정
	public function setMsg(msg:String):void
	{
		tf.text = msg;
	}
}