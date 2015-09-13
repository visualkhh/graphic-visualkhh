package 
{
	import flash.display.Sprite;
	// 사용자 정의 이벤트 클래스 import 
	import GosuEvent;
	import flash.text.TextField;
	public class AsExam6_23 extends Sprite 
	{
		private var tf:TextField;
		private var sHand:HandSprite;
		private var rHand:HandSprite;
		private var pHand:HandSprite;
		
		public function AsExam6_23()	
		{ 
			sHand = new HandSprite('1'); //가위
			this.addChild(sHand);
			sHand.x = 50;

			rHand = new HandSprite('2');//바위 
			this.addChild(rHand);
			rHand.x = 120;

			pHand = new HandSprite('3');//보 
			this.addChild(pHand);
			pHand.x = 190;
			
			tf = new TextField();
			tf.x = 90;
			tf.y = 100;
			tf.width = 200;
			this.addChild(tf);
            this.addEventListener('okgosu', actionHandler);
		}
		// 가위바위보 이미지를 선택했을 때 실행되는 함수
		private function actionHandler(event:GosuEvent):void 
		{
            if(event.hand == "1") 
            {
            	tf.text = '가위를 선택하셨습니다.';
            	rHand.restore();
            	pHand.restore();
            } else if(event.hand == "2") {
            	tf.text = '바위를 선택하셨습니다.';
            	sHand.restore();
            	pHand.restore();
            } else if(event.hand == "3") {
            	tf.text = '보를 선택하셨습니다.';
            	sHand.restore();
            	rHand.restore();
            } else {
            	trace('error');
            }
        }
	}
}
