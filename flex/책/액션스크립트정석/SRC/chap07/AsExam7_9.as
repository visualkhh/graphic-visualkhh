package
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	public class AsExam7_9 extends Sprite 
	{
		private var sp:Sprite = new Sprite();
		private var sh:Shape = new Shape();
		
		public function AsExam7_9() 
		{
			drawSpriteCircle();
			drawShapeCircle();
			this.addChild(sp);		
			this.addChild(sh);				
		}
		// Sprite로부터 마우스 이벤트를 받아서 원을 그린다.
		private function drawSpriteCircle(evt:MouseEvent=null):void 
		{
			sp.graphics.beginFill(Math.random() * 0x1000000);
			sp.graphics.lineStyle(1, 0xFFFFFF, 1);
			sp.graphics.drawCircle(50, 100, 50);
			sp.graphics.endFill();
			sp.buttonMode = true;
			// 롤오버, 롤아웃 이벤트 핸들러를 추가한다.
			sp.addEventListener(MouseEvent.ROLL_OVER, drawSpriteCircle);
			sp.addEventListener(MouseEvent.ROLL_OUT, drawSpriteCircle);
		}
		// Shape로부터 원을 그린다.
		private function drawShapeCircle():void 
		{
			sh.graphics.beginFill(Math.random() * 0x1000000);
			sh.graphics.lineStyle(1, 0xFFFFFF, 1);
			sh.graphics.drawCircle(150, 100, 50);
			sh.graphics.endFill();
		}
	}
}