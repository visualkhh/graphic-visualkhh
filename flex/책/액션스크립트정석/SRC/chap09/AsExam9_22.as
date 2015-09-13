package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import flash.geom.Rectangle;

	public class AsExam9_22 extends Sprite
	{
        // 회전 반경 
        private var circlRadius:Number = 200;  
        // 회전 각도
        private var currentDegrees:Number = 0;  
        // 비트맵 객체		
		private var bm:Bitmap;
		// 비트맵 데이터가 그릴 Shape 객체 
		private var sh:Shape = new Shape();
		public function AsExam9_22()
		{
			displayMain();
			addEventHandlers();
		}
		// 검정색의 비트맵 데이터와 Shape 객체를 생성하여 화면에 추가한다. 
		private function displayMain():void
		{
			var bmp:BitmapData = new BitmapData(stage.stageWidth, stage.stageHeight, false, 0x000000);
			bm = new Bitmap(bmp);
			this.addChild(bm);
			sh.graphics.beginFill(Math.random()*0x1000000);
			sh.graphics.drawRect(0, 0, 20, 20);
			sh.graphics.endFill();
			this.addChild(sh);
		}
		// 마우스무브와 엔터프레임 이벤트 핸들로 함수 등록 
		private function addEventHandlers():void
		{
			stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
			stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler); 
		}
		// 마우스가 움직이는 곳에 비트맵데이터 draw함수를 통해 Shape를 그려줌
		private function mouseMoveHandler(event:MouseEvent):void
		{
			// Shape를 마우스 위치로 이동
			sh.x = event.stageX;
			sh.y = event.stageY;
			// bitmapData에 draw & colorTransform수행
			drawBitmapData(event.stageX, event.stageY);
			// 화면을 먼저 처리하고 이벤트 처리함 
			event.updateAfterEvent();
		}
		// 애플리케이션이 실행되면 자동으로 회전하면서 비트맵데이터 draw를 실행함
		private function enterFrameHandler(event:Event):void 
		{
            // 회전 반경 라디언 값 계산  
            var radians:Number = currentDegrees * Math.PI / 180; 
            // 라디언값에 따른 회전된 좌표값 계산   
            var posX:Number = Math.sin(radians) * circlRadius + 250; 
            var posY:Number = Math.cos(radians) * circlRadius + 200; 
            // Shape를 회전된 좌표로 이동함
            sh.x = posX;
            sh.y = posY;
            // 각도를 3도씩 증가  
            currentDegrees += 3; 
            // 회전 반경을 0.3씩 감소 
            circlRadius -= 0.3; 
            // 회전반경이 0이하이면 그리기 중단           
            if(circlRadius < 0) stage.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
            // bitmapData에 draw & colorTransform수행 
            drawBitmapData(posX, posY);
        }
        // 비트맵데이터 draw함수와 colorTransform함수를 이용하여 화면을 변환함
        private function drawBitmapData(posX:Number, posY:Number):void
        {
            // bitmapData에 draw 수행 
            bm.bitmapData.draw(sh, sh.transform.matrix);
            // bitmapData에 colorTransform 수행
            var cTransform:ColorTransform = new ColorTransform();
            cTransform.redMultiplier = (posX / this.stage.width)*3;
            cTransform.greenMultiplier = (posY / this.stage.height)*3;
            // 지정된 위치에서 20*20크기 영역에 대해 colorTransform을 수행함
            var rect:Rectangle = new Rectangle(posX, posY, 20, 20);
            bm.bitmapData.colorTransform(rect, cTransform);
        }		
	}
}