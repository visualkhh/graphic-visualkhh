package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
    [SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
	public class AsExam10_9 extends Sprite
	{
		private var radius:Number = 200;
		private var ang:Number = 0;
		public function AsExam10_9()
		{
			stage.addEventListener(MouseEvent.CLICK, clickHandler);
		}
		
		private function clickHandler(event:MouseEvent):void
		{
			// 클릭할 때 마다 각도를 10도씩 회전한다. 
			ang += 10 * Math.PI/180;
			var dx:Number = Math.cos(ang)*radius;
			var dy:Number = Math.sin(ang)*radius;
            this.graphics.clear();
            this.graphics.moveTo(event.stageX, event.stageY);
            this.graphics.lineStyle(1, Math.random()*0x1000000);
            // 마우스 위치에서 radius만큼 떨어진곳과 연결 직선을 그린다.
            this.graphics.lineTo(dx+event.stageX, dy+event.stageY);
            this.graphics.beginFill(Math.random()*0x1000000);
            // 마우스 위치에서 radius만큼 떨어진 곳에 원을 그린다.
            this.graphics.drawCircle(dx+event.stageX, dy+event.stageY, 20);			
		}
	}
}