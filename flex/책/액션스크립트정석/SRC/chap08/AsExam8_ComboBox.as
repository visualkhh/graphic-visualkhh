package
{
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	[Event(name="comboChanged", type="flash.events.Event")]
	
	public class AsExam8_ComboBox extends Sprite
	{
		// 선택된 값을 저장하는 변수
		public var selectedData:String;
		// 콤보박스의 데이터 건수
		public var comboLength:int;
		// 콤보박스 배열값
		public var comboDataArray:Array;
		// 콤보박스 텍스트필드를 관리하기 위한 배열로서 텍스트필드를 보였다 감췄다 할 때 참조함 
		private var comboObjectArray:Array;
		// 콤보박스의 크기
		private var comboWidth:Number;
		private var comboHeight:Number;
		// 콤보박스 배열원소가 객체일 경우 그 데이터를 읽어오기 위한 필드갑			
		private var fieldName:String;	
		// 콤보박스 메뉴가 보이는 상태인지를 나타내는 변수
		private var showFlag:Boolean;
		// 콤보박스 기본 텍스트 필드
		private var baseTF:TextField = new TextField();
		// 콤보박스가 사용할 텍스트포맷 
		private var comboTextFormat:TextFormat = new TextFormat();
		
		public function AsExam8_ComboBox(arr:Array, comboWidth:Number, comboHeight:Number, fieldName:String)
		{
			this.comboDataArray = arr;
			this.fieldName = fieldName;
			this.comboWidth = comboWidth;
			this.comboHeight = comboHeight;
			this.comboLength = comboDataArray.length;
			comboTextFormat.size = 10;
			drawComboBox();
			drawTriangleButton();
		}
		// 콤보박스를 그린다.
		private function drawComboBox():void
		{
 			baseTF.defaultTextFormat = comboTextFormat;
			baseTF.selectable = false;
			baseTF.border = true;
			baseTF.borderColor = 0xCCCCCC;
			baseTF.background = true;
			baseTF.backgroundColor = 0xFFFFFF;
			// 콤보박스 배열에서 첫번째 값을 읽어와 화면에 나타냄 
			if(fieldName != "")
			{
				baseTF.text = comboDataArray[0].fontName;
			} 
			else
			{
				baseTF.text = comboDataArray[0];
			}
			baseTF.height = comboHeight;
			baseTF.width = comboWidth;
			this.addChild(baseTF);
			baseTF.addEventListener(MouseEvent.CLICK, clickHandler); 
		}
        // 콤보박스의 삼각형 버튼을 생성함
		private function drawTriangleButton():void 
		{
			var th:Number = comboHeight-2;
			var sBtn:AsExam8_TriangleButton = new AsExam8_TriangleButton(th);
			sBtn.x = comboWidth - th;
			sBtn.y = 2;
			this.addChild(sBtn);
			sBtn.addEventListener(MouseEvent.CLICK, triangleClickHandler);
		}
		// 콤보박스를 클릭하면 comboChanged 이벤트 디스패치
		private function clickHandler(event:MouseEvent):void
		{
			var tempTF:TextField = event.target as TextField;
			// 화면 디스플레이 상태에 따라 콤보박스 내용을 보이게 하거나 숨김
			if(!showFlag)
			{
				showComboBox();
				showFlag = true;
			} else
			{
				// 숨길 때는 선택된 값을 저장하고 comboChanged 이벤트 디스패치
				hideComboBox();
				showFlag = false;
				baseTF.text = tempTF.text;
				this.selectedData = tempTF.text;
				event.currentTarget.dispatchEvent(new MouseEvent("comboChanged"));
			}
		}
		// 삼각형 버튼만 클릭하면 콤보박스를 보이게 하거나 숨기기만 함
		private function triangleClickHandler(event:MouseEvent):void
		{
			if(!showFlag)
			{
				showComboBox();
				showFlag = true;
			}
			else
			{
				hideComboBox();
				showFlag = false;
			}
		}
        // comboObjectArray값의 텍스트필드를 화면에 보이도록 함
        public function showComboBox():void
        {
        	// 처음 실행될 경우는 initComboBox를 호출하여 텍스트필드를 새로 생성함
            if(comboObjectArray == null) initComboBox();
            for(var idx:int = 0; idx<comboObjectArray.length; idx++)
            {
                var tf:TextField = comboObjectArray[idx] as TextField;
                tf.visible = true;
            } 
        }
        // comboObjectArray값의 텍스트필드를 감춘다 
        public function hideComboBox():void
        {
            for(var idx:int = 0; idx<comboObjectArray.length; idx++)
            {
                var tf:TextField = comboObjectArray[idx] as TextField;
                tf.visible = false;
            } 
        }		
		// 배열값에 따라 텍스트필드를 생성하여 화면에 추가함
		public function initComboBox():void
		{
			comboObjectArray = new Array();
			for(var i:int=0; i<comboLength; i++) 
			{
				var comboTF:TextField = new TextField();
				comboTF.defaultTextFormat = comboTextFormat;
				comboTF.selectable = false;
				comboTF.border = true;
				comboTF.borderColor = 0xCCCCCC;
				comboTF.background = true;
				comboTF.backgroundColor = 0xFFFFFF;
				if(fieldName != "") 
				{
					comboTF.text = comboDataArray[i].fontName;// Font 에만 해당
				} 
				else
				{
					comboTF.text = comboDataArray[i];
				}
				comboTF.height = comboHeight;
				comboTF.width = comboWidth;
				comboTF.y = comboHeight + comboHeight*i;
				this.addChild(comboTF);
				// 콤보박스의 각 항목에 대한 이벤트 핸들러 함수 추가
				comboTF.addEventListener(MouseEvent.CLICK, clickHandler);
				comboTF.addEventListener(MouseEvent.MOUSE_OVER, overHandler);
				comboTF.addEventListener(MouseEvent.MOUSE_OUT, outHandler);
				comboObjectArray[i] = comboTF;
			}
		}
		// 마우스를 콤보박스 아이템 위에 가져가면 배겻생을 바꿔줌
        private function overHandler(event:MouseEvent):void
        {
            var tempTF:TextField = event.target as TextField;
            tempTF.backgroundColor = 0x0000FF;
        }
        // 마우스가 벗어나면 아이템 배경색을 원래대로 돌린다
        private function outHandler(event:MouseEvent):void
        {
            var tempTF:TextField = event.target as TextField;
            tempTF.backgroundColor = 0xFFFFFF;
        }
	}
}