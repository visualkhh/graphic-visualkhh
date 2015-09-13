package 
{
	import flash.display.BlendMode;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	[SWF(width=800,height=800,backgroundColor=0xFFFFFF)]
	public class AsExam7_5 extends Sprite 
	{

		private var sp:Sprite;
		private var tf:TextField = new TextField();
		private var rNum:int = 0;
		private var rainbowColors:Array = [0xff0000, 0xffa500, 0xffff00, 0x008000, 0x0000ff, 0x4B0082, 0x800080];

  		public function AsExam7_5()	
  		{
  			displayMain();
  			addEventHandlers();
  		}
  		private function displayMain():void
  		{
			drawFlowers(BlendMode.NORMAL);
			drawTextField();
  		}
  		// 마우스를 클릭하면 블랜드모드를 바꿔서 다시 그리도록 함
  		private function addEventHandlers():void
  		{
			this.addEventListener(MouseEvent.CLICK, reDraw);
		}
		
		private function drawTextField():void 
		{
			tf.width = 150;
			tf.x = 100;
			tf.y = 270;
			tf.text = "[BlendMode]:" + BlendMode.NORMAL;
			this.addChild(tf);
		}
		// 7가지 무지개빛 날개를 그린다.
		private function drawFlowers(mode:String):void 
		{
			sp = new Sprite();
			this.addChild(sp);
			for(var i:uint=0; i<7; i++) 
			{
				var item:Sprite = new Sprite();
	            item.graphics.beginFill(rainbowColors[i]);
				item.graphics.drawEllipse(0, 0, 50, 120);
	            item.graphics.endFill();
	            // 날개를 순서에 따라 회전시킴
				item.rotation = 360/7*i;
				item.x = item.y = 150;
				item.blendMode = mode;
				item.buttonMode = true;
				sp.addChild(item);
			}	
		}
		
		private function reDraw(evt:MouseEvent):void 
		{
			var blendModeStr:String = null;
			if(rNum > 13) rNum = 0;
			// rNum에 따라 블랜드 모드를 계속 바꿔나감 
			switch(rNum) 
			{
				case 0:
				blendModeStr = BlendMode.ADD;
					break;
				case 1:
				blendModeStr = BlendMode.ALPHA;
					break;
				case 2:
				blendModeStr = BlendMode.DARKEN;
					break;
				case 3:
				blendModeStr = BlendMode.DIFFERENCE;
					break;
				case 4:
				blendModeStr = BlendMode.ERASE;
					break;
				case 5:
				blendModeStr = BlendMode.HARDLIGHT;
					break;
				case 6:
				blendModeStr = BlendMode.INVERT;
					break;
				case 7:
				blendModeStr = BlendMode.LAYER;
					break;
				case 8:
				blendModeStr = BlendMode.LIGHTEN;
					break;
				case 9:
				blendModeStr = BlendMode.MULTIPLY;
					break;
				case 10:
				blendModeStr = BlendMode.NORMAL;
					break;
				case 11:
				blendModeStr = BlendMode.OVERLAY;
					break;
				case 12:
				blendModeStr = BlendMode.SCREEN;
					break;
				case 13:
				blendModeStr =BlendMode.SUBTRACT;
					break;
			}
			rNum++;
			tf.text =  "[BlendMode]:" +  blendModeStr;
			drawFlowers(blendModeStr);		
		}
	}
}