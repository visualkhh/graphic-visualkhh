package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import mx.events.ModuleEvent;
   [Event(name="checkboxChecked", type="flash.events.MouseEvent")]

	public class AsExam8_CheckBox extends Sprite
	{
		public var checkboxEnabled:Boolean;
		public var checkboxText:String;
		private var checkboxTextField:TextField=new TextField();
		private var checkBoxArea:Sprite = new Sprite();
		private var checkBoxHitArea:Sprite = new Sprite();
		
		public function AsExam8_CheckBox(checkboxText:String, insName:String)
		{
			this.name = insName;
			this.checkboxText = checkboxText;
			initCheckBox();
		}
		
		private function initCheckBox():void 
		{
			drawUnchecked();
			drawHitarea();
			drawTextField();
			checkBoxArea.addEventListener(MouseEvent.CLICK, clickHandler);
			this.addChild(checkBoxArea);
		}
		
		public function setCheckBoxText(txt:String):void
		{
			checkboxTextField.text = txt;
		}
		
		private function drawTextField():void 
		{
            checkboxTextField.x = 16;
            checkboxTextField.y = 0;
            checkboxTextField.text = checkboxText;
            checkboxTextField.autoSize = "left";
			this.addChild(checkboxTextField);
		}
		
		private function drawHitarea():void 
		{
			checkBoxHitArea.graphics.beginFill(0xFFFF00, 0);
			checkBoxHitArea.graphics.drawRect(2, 2, 14, 14);
			checkBoxHitArea.graphics.endFill();
			checkBoxArea.buttonMode = true;
			checkBoxArea.hitArea = checkBoxHitArea; 
			checkBoxHitArea.mouseEnabled = false;
			this.addChild(checkBoxHitArea);
		}
		
		private function drawChecked():void 
		{
			checkBoxArea.graphics.clear();
			checkBoxArea.graphics.lineStyle(1, 0x000000);
			checkBoxArea.graphics.drawRect(2, 2, 14, 14);

			checkBoxArea.graphics.lineStyle(3, 0x000000);
			checkBoxArea.graphics.moveTo(5, 5);
			checkBoxArea.graphics.lineTo(8, 13);
			checkBoxArea.graphics.lineTo(14, 4);
			checkBoxArea.graphics.endFill();
		}
		private function drawUnchecked():void 
		{
			checkBoxArea.graphics.clear();
			checkBoxArea.graphics.lineStyle(1, 0x000000);
			checkBoxArea.graphics.drawRect(2, 2, 14, 14);
			checkBoxArea.graphics.endFill();
		}
		
		private function clickHandler(event:MouseEvent):void 
		{
			if(!checkboxEnabled) 
			{
				drawChecked();
				checkboxEnabled = true;
			}
			else
			{
				drawUnchecked();
				checkboxEnabled = false;
			}
		//	this.dispatchEvent(new AsExam8_CheckBoxEvent("checkboxChecked", checkboxEnabled));
			event.currentTarget.dispatchEvent(new MouseEvent("checkboxChecked"));
		}
	}
}