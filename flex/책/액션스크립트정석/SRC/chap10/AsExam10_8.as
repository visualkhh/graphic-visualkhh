package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
    [SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
	public class AsExam10_8 extends Sprite
	{
		public function AsExam10_8()
		{
			stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
		}
		
		private function mouseMoveHandler(event:MouseEvent):void
		{
			var ang:Number = 0;
			var radius:Number = 100;
			var dx:Number = 0;
			var dy:Number = 0;
			this.graphics.clear();
			this.graphics.moveTo(event.stageX, event.stageY);
			this.graphics.lineStyle(2, Math.random()*0x1000000);
			// 0도에서 360도까지 각도를 회전한다.
			for(var a:int = 0; a<=360; a++)
			{
				// 각도에 대한 라디안 값 계산
				ang = a*Math.PI/180;
				// 각도와 거리만큼 떨어진 좌표 계산
				dx = Math.cos(ang) * radius;
				dy = Math.sin(ang) * radius;
				// 마우스 위치에서 ang각도와 radius 만큼 떨어진 좌표에 선을 그림 
				this.graphics.lineTo(event.stageX + dx, event.stageY + dy);
			} 
		}
	}
}