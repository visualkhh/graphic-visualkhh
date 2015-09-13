package
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.text.TextField;	
    [SWF(backgroundColor = 0xffffff)]
	public class AsExam12_21 extends Sprite
	{
		// SWF를 로드하기 위한 Loader
		private var ldr:Loader = new Loader();
		// AsExam12_22 에서 참조하므로 protected로 선언
		protected var tf:TextField = new TextField();
		// AsExam12_22 에서 참조하므로 protected로 선언
		protected var comboBox:AsExam8_ComboBox; 
		// 로드하려는 SWF의 URL 배열 
	    private var comboArr:Array = ["AsExam12_21_Sub.swf", 
	       "http://okgosu.net/book/AsExam12_21_Sub.swf", 
	       "http://swexperts.org/public/AsExam12_21_Sub.swf"];
		private var ns:AsExam8_NumericStepper = new AsExam8_NumericStepper(1, 3, 0.2, "scaleY", "ns", 1);
		public function AsExam12_21()
		{
			displayMain();
			addEventHandlers();
			drawBG();
		}
		
		private function displayMain():void
		{
			// 텍스트필드 추가
            tf.width = 300;
            tf.height = 20;		
            tf.x = 20;
            tf.y = 40;  	
            tf.border = true;
            tf.background = true; 
            tf.type = "input";			
			this.addChild(tf);
            // 숫자 선택기 추가
            ns.x = 250;
            ns.y = 10;
            this.addChild(ns);
            // 콤보박스 추가
            addComboBox();
        }
        // AsExam12_52 에서 재정의하므로 protected로 선언 
        protected function addComboBox():void
        {
            comboBox = new AsExam8_ComboBox(comboArr, 230, 15, "");
            this.addChild(comboBox);
            comboBox.x = 10;
            comboBox.y = 10;
		}
		
		private function addEventHandlers():void
		{
			tf.addEventListener(KeyboardEvent.KEY_DOWN, keyboardHandler);
            comboBox.addEventListener("comboChanged", comboChangedHandler);
            ns.addEventListener("numberChanged", numberChangedHandler);
		}
		// 콤보박스의 값이 바뀌면 다른 SWF를 로딩한다.
        private function comboChangedHandler(event:MouseEvent):void
        {
            var c:AsExam8_ComboBox = event.currentTarget as AsExam8_ComboBox; 
            loadSWF(c.selectedData);
            this.addChild(comboBox);
        }     		
        // 특정 URL의 SWF를 로딩함
        private function loadSWF(url:String):void
        {
            if(ldr.content != null) ldr.unload();
            ldr.load(new URLRequest(url));
            ldr.contentLoaderInfo.addEventListener(Event.COMPLETE, loadCompleteHandler);
        }        
        // 로드가 완료되면 Loader를 화면에 추가한다.
        protected function loadCompleteHandler(event:Event):void
        {
            trace('로드 완료');
            this.addChildAt(ldr, 1);
            ldr.y = 60;
        }        
		// 숫자입력기의 값을 바꾸면 로드된 SWF의 scaleY값을 변경함
		protected function numberChangedHandler(event:MouseEvent):void
		{
			var ns:AsExam8_NumericStepper = event.currentTarget as AsExam8_NumericStepper;
            if(ldr.content != null) 
            {
 			    var sp:AsExam12_21_Sub = ldr.content as AsExam12_21_Sub;
		      	sp.scaleY = ns.selectedNumber;
            }
            else
            {
            	trace('swf not loaded');
            }
		}
		// 텍스트필드에 값을 입력하고 엔터키를 치면 로드된 SWF의 텍스트필드 값을 변경한다.
        protected function keyboardHandler(evt:KeyboardEvent):void 
        {
            if(evt.keyCode == 13) 
            {
                var sp:AsExam12_21_Sub = ldr.content as AsExam12_21_Sub;
                sp.tf.text = "[AsExam12_21]:" + tf.text;
                sp.drawBG();
            }
        }        
	    // 사각형 테두리를 그려준다. 외부에서 호출할 수 있도록 public으로 선언한다
        public function drawBG():void
        {
            this.graphics.beginFill(Math.random()*0x1000000);
            this.graphics.drawRect(10, 30, 320, 40);    
        }		
	}
}