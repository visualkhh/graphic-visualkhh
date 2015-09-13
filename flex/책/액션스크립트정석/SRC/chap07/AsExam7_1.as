package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	[SWF(width=400,height=400,backgroundColor=0xCCCCCC)]	
	public class AsExam7_1 extends Sprite 
	{
		// 프레임레이트를 위한 변수
		private var frNum:int=2;		
		// 디스플레이 모드를 표시하는 텍스트
		private var tf:TextField = new TextField();
		// 회전할 날개 생성
		private var wing1:AsExam7_1_Wing = new AsExam7_1_Wing(0xFF0000);
		private var wing2:AsExam7_1_Wing = new AsExam7_1_Wing(0x0000FF);
		
		public function AsExam7_1() 
		{
			displayMain();
			addEventHandlers();
		}
		
		private function displayMain():void
		{
			this.stage.frameRate = frNum;
			this.addChild(wing1);
			this.addChild(wing2);
			this.addChild(tf);
			trace('frameRate: ' + this.stage.frameRate);
			wing1.x = 200;
			wing1.y = 150;
			wing2.x = 200;
			wing2.y = 150;
			wing2.rotation = 180;
			tf.text = this.stage.scaleMode;
			tf.x = 200;
			tf.y = 150;
		}
		
		private function addEventHandlers():void
		{
			// 빨간 날개를 클릭하면 프레임레이트를 올려서 회전 속도를 증가시킴
			wing1.addEventListener(MouseEvent.CLICK, clickHandler);
			wing2.addEventListener(MouseEvent.CLICK, fullSizeHandler);
			stage.addEventListener(Event.ENTER_FRAME, rotateWings);		
		}
		// 엔터프레임 이벤트가 발생하면 날개를 회전시킨다.
		private function rotateWings(evt:Event):void 
		{
			wing1.rotation += 5;	
			wing2.rotation += 5;
		}
		// 파란 날개를 클릭하면 디스플레이 모드를 바꿈
		private function fullSizeHandler(evt:MouseEvent):void 
		{
            switch(stage.displayState) 
            {
                case "normal":
                    stage.displayState = "fullScreen";   
                    break;
                case "fullScreen":
                    stage.displayState = "normal";    
                    break;
            }			
            var rNum:int = Math.random() * 4;
            switch(rNum) 
            {
            	case 0:
                    stage.scaleMode = "exactFit";
            		break;
            	case 1:
                   	stage.scaleMode = "showAll";
            		break;
            	case 2:
                    stage.scaleMode = "noScale";
            		break;
            	case 3:
                   	stage.scaleMode = "noBorder";
            		break;
            }
            tf.text = this.stage.scaleMode;
            trace('stage.scaleMode: ' + stage.scaleMode);
            trace('stage.displayState: ' + stage.displayState);
		}
		// 회전 속도 증가
		private function clickHandler(evt:MouseEvent):void 
		{
			trace('frameRate: ' + this.stage.frameRate);
			frNum+= 5;
			this.stage.frameRate = frNum; 
			trace('frameRate: ' + this.stage.frameRate);
		}
	}
}