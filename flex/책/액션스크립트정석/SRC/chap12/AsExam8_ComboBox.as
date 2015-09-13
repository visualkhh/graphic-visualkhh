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
		public var selectedData:String;
		public var comboLength:int;
		public var comboDataArray:Array;
		private var comboObjectArray:Array;
		private var comboWidth:Number;
		private var comboHeight:Number;			
		private var fieldName:String;	
		private var showFlag:Boolean;
		private var baseTF:TextField = new TextField();
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
		private function drawComboBox():void
		{
 			baseTF.defaultTextFormat = comboTextFormat;
			baseTF.selectable = false;
			baseTF.border = true;
			baseTF.borderColor = 0xCCCCCC;
			baseTF.background = true;
			baseTF.backgroundColor = 0xFFFFFF;
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

		private function drawTriangleButton():void 
		{
			var th:Number = comboHeight-2;
			var sBtn:AsExam8_ComboBoxTriangleButton = new AsExam8_ComboBoxTriangleButton(th);
			sBtn.x = comboWidth - th;
			sBtn.y = 2;
			this.addChild(sBtn);
			sBtn.addEventListener(MouseEvent.CLICK, triangleClickHandler);
		}
		
		private function clickHandler(event:MouseEvent):void
		{
			var tempTF:TextField = event.target as TextField;
			if(!showFlag)
			{
				showComboBox();
				showFlag = true;
			} else
			{
				hideComboBox();
				showFlag = false;
				baseTF.text = tempTF.text;
				this.selectedData = tempTF.text;
				event.currentTarget.dispatchEvent(new MouseEvent("comboChanged"));
			}
		}
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

		private function overHandler(event:MouseEvent):void
		{
			var tempTF:TextField = event.target as TextField;
			tempTF.backgroundColor = 0x0000FF;
		}
		private function outHandler(event:MouseEvent):void
		{
			var tempTF:TextField = event.target as TextField;
			tempTF.backgroundColor = 0xFFFFFF;
		}
		
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
				comboTF.addEventListener(MouseEvent.CLICK, clickHandler);
				comboTF.addEventListener(MouseEvent.MOUSE_OVER, overHandler);
				comboTF.addEventListener(MouseEvent.MOUSE_OUT, outHandler);
				comboObjectArray[i] = comboTF;
			}
		}

		public function showComboBox():void
		{
			if(comboObjectArray == null) initComboBox();
			for(var idx:int = 0; idx<comboObjectArray.length; idx++)
			{
				var tf:TextField = comboObjectArray[idx] as TextField;
				tf.visible = true;
			} 
		}
		
		public function hideComboBox():void
		{
			for(var idx:int = 0; idx<comboObjectArray.length; idx++)
			{
				var tf:TextField = comboObjectArray[idx] as TextField;
				tf.visible = false;
			} 
		}
	}
}