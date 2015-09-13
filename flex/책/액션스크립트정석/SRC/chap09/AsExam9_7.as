package
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	
	[SWF(backgroundColor=0xFFFFFF)]
	public class AsExam9_7 extends Sprite
	{
		// 사진을 담아 변환을 적용하기 위한 Sprite 
		private var sp:Sprite = new Sprite();
		// 재민이 사진을 추가한다.
		[Embed(source="assets/jaemin.jpg")]
		public var Photo:Class;
		// switch 문에서 사용할 case 값 		
		private var swNum:int;
		public function AsExam9_7()
		{
			displayMain();
			addEventHandlers();
		}
		// 사진을 화면에 나타낸다.
		private function displayMain():void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			// 사진을 화면에 첨부한다.
			var photo:Bitmap = new Photo();
			sp.addChild(photo);			
			// 회전의 중심을 맞추기 위해 좌표를 좌상단 1/2지점으로 이동한다.
			photo.x = -photo.width/2;
			photo.y = -photo.height/2;
			addChild(sp);
			sp.buttonMode = true;
		}
		// 클릭 이벤트와 엔터프레임 이벤트 핸들러 함수를 등록한다.
		private function addEventHandlers():void
		{
			sp.addEventListener(MouseEvent.CLICK, clickHandler);
			sp.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
		// 마우스가 움직이는 위치에 따라 기울기 변환을 적용한다.
		private function enterFrameHandler (event:Event):void
		{
			var skewX:Number = (mouseX - stage.stageWidth / 2) * .0025;
			var skewY:Number = (mouseY - stage.stageHeight / 2) * .0025;
			sp.transform.matrix = new Matrix(1, skewY, skewX, 1,  stage.stageWidth/2,  stage.stageHeight/2);
		}
	    // 이미지를 마우스로 클릭하면 swNum에 따라 각 색상채널에 반전을 적용하는 ColorTranform을 적용한다 
		private function clickHandler(event:MouseEvent):void 
		{
			switch(swNum) 
			{
				case 0:
				    // R(빨간색) 채널이 반전된 이미지
					sp.transform.colorTransform = new ColorTransform(1, -1, -1, 1, 255, 255, 255, 0);
					break;
				case 1:
				    // G(녹색) 채널이 반전된 이미지
					sp.transform.colorTransform = new ColorTransform(-1, 1, -1, 1, 255, 255, 255, 0);
					break;
				case 2:
				    // B(파란색) 채널이 반전된 이미지
					sp.transform.colorTransform = new ColorTransform(-1, -1, 1, 1, 255, 255, 255, 0);	
					break;
				case 3: 
				    // RGB 모두 반전된 이미지
					sp.transform.colorTransform = new ColorTransform(-1, -1, -1, 1, 255, 255, 255, 0);
					break;
				case 4: 
				    // 정상 이미지
					sp.transform.colorTransform =  new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);;
					break;
			}
			trace(swNum);
			swNum++;
			// swNum이 5가 넘으면 다시 0으로 리셋한다.
			if(swNum > 5) swNum = 0;
		}
	}
}