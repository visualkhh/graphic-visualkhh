package
{
    import flash.display.Sprite;
    import flash.text.*;
    import flash.events.Event;
    import flash.events.TextEvent;
    import flash.events.MouseEvent;
    import flash.net.URLRequest;
	import flash.net.navigateToURL;
	[SWF(backgroundColor=0xFFFFFF)]
    public class AsExam8_17 extends Sprite
    {
        private var contentTextField:TextField = new TextField();
        private var lineNumberTextField:TextField = new TextField();
        private var myText:String = "1. 내가 그의 이름을 불러 주기 전에는 \n" 
		+ "2. 그는 다만 \n"
		+ "3. 하나의 몸짓에 지나지 않았다. \n" 
		+ "4. \n"
		+ "5. 내가 그의 이름을 불러 주었을 때 \n"
		+ "6. 그는 나에게로 와서 \n"
		+ "7. 꽃이 되었다.  \n"
		+ "8. \n"
		+ "9. 내가 그의 이름을 불러 준 것처럼 \n"
		+ "10. 나의 이 빛깔과 향기에 알맞는 \n"
		+ "11. 누가 나의 이름을 불러 다오. \n"
		+ "12. 그에게로 가서 나도 \n"
		+ "13. 그의 꽃이 되고 싶다. \n"
		+ "14. \n"
		+ "15. 우리들은 모두 \n"
		+ "16. 무엇이 되고 싶다. \n"
		+ "17. 나는 너에게 너는 나에게 \n"
		+ "18. 잊혀지지 않는 하나의 의미가 되고 싶다. \n"
		+ "19. 김춘수, 꽃 "; 
		
        public function AsExam8_17()
        {
        	createContentTextField();
        	createLineTextField();
			createButtons(); 
        }
        // 내용이 들어갈 텍스트필드 생성
        private function createContentTextField():void
        {
            contentTextField.text = myText;
            contentTextField.y = 10;
            contentTextField.width = 200;
            contentTextField.height = 100;
            contentTextField.multiline = true;
            contentTextField.wordWrap = true;
            contentTextField.background = true;
            contentTextField.border = true;
            contentTextField.backgroundColor = 0xCCCCCC;
            contentTextField.borderColor = 0x00FF00;
            addChild(contentTextField);
            contentTextField.addEventListener(Event.SCROLL, scrollHandler);
        }
        // 라인번호를 보여줄 텍스트필드 생성
		private function createLineTextField():void
		{
            lineNumberTextField.x =40;
            lineNumberTextField.y =140;
            lineNumberTextField.text="라인번호: " + contentTextField.scrollV;
            addChild(lineNumberTextField);
		}
        // 라인이동을 위한 버튼 생성 & 추가 
        private function createButtons():void
        {
            this.addChild(makeSimpleButton("<<", 25, 40, 115))
            this.addChild(makeSimpleButton("<", 25, 70, 115));
            this.addChild(makeSimpleButton(">", 25, 100, 115));
            this.addChild(makeSimpleButton(">>", 25, 130, 115));            
        }
        // 버튼을 생성하여 클릭핸들러를 추가한 다음 리턴한다. 
        private function makeSimpleButton(lblStr:String, size:int, xPos:int, yPos:int):AsExam8_SimpleButton 
        {
        	var btn:AsExam8_SimpleButton = new AsExam8_SimpleButton(lblStr, size);
        	btn.x = xPos;
        	btn.y = yPos;
        	btn.addEventListener(MouseEvent.CLICK, clickHandler);
        	return btn;
        }
		
		// 버튼을 클릭했을 때 라인이 스크롤 되도록 한다.
		private function clickHandler(evt:MouseEvent):void 
		{
			switch(evt.target.lblStr) 
			{
				case "<<":
					trace('첫 라인');
					contentTextField.scrollV = -contentTextField.maxScrollV;
					break;
				case "<":
					trace('이전 라인');
					contentTextField.scrollV--;
					break;
				case ">":
					trace('다음 라인');
					contentTextField.scrollV++;
					break;
				case ">>":
					trace('최종 라인');
					contentTextField.scrollV = contentTextField.maxScrollV;
					break;
			}
		}
		// 텍스트필드가 스크롤될 때 라인번호를 텍스트필드에 나타낸다.
        public function scrollHandler(event:Event):void
        {
           lineNumberTextField.text="라인번호: " + contentTextField.scrollV;
        }
    }
}