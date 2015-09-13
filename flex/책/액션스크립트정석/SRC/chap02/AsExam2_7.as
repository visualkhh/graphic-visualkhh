package 
{
	import flash.display.Sprite;
	//마우스 이벤트 처리를 위한 클래스 import
	import flash.events.MouseEvent;
    //텍스트 추가를 위한 클래스 import
    import flash.text.TextField;
	public class AsExam2_7 extends Sprite 
	{
        private var tf:TextField = new TextField();
		public function AsExam2_7() 
		{
            // 텍스트 필드 문자열 지정  
            tf.text = "클릭한 좌표값:";
            // 텍스트 좌측 정렬후 크기 맞추기
            tf.autoSize = "left";
            // 화면에 텍스트 필드 추가 
            this.addChild(tf);			
			//마우스를 클릭할 때 실행될 함수(mouseClickHandler)지정 
			stage.addEventListener(MouseEvent.CLICK, mouseClickHandler);
		}
		private function mouseClickHandler(event:MouseEvent):void {
			// 트레이스 로그창으로 마우스의 x, y좌표값 출력
			trace('this.mouseX: ' + this.mouseX);
			trace('this.mouseY: ' + this.mouseY);			
			tf.text = "클릭한 좌표값: (" + this.mouseX + "," + this.mouseY + ")";
		}
	}
}