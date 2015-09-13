package 
{
	import flash.display.Shape;
	import flash.display.Sprite;
	[SWF(backgroundColor=0xFFFFFF)]
	public class AsExam9_11 extends Sprite 
	{
		public function AsExam9_11() 
		{
            drawLuckyStar(200);
		}
		// 일정한 크기의 럭키스타를 그린다.
		private function drawLuckyStar(size:int):void 
		{
			var luckyStar:Shape = new Shape();
            luckyStar.graphics.beginFill(Math.random()*0x1000000);
            luckyStar.graphics.lineStyle(5, Math.random()*0x1000000);
            luckyStar.graphics.moveTo(0, size);
            // 컨트롤 포인트는 모두 동일하다.
            luckyStar.graphics.curveTo(size, size, size, 0);
            luckyStar.graphics.curveTo(size, size, size*2, size);
            luckyStar.graphics.curveTo(size, size, size, size*2);
            luckyStar.graphics.curveTo(size, size, 0, size);
            luckyStar.graphics.endFill();
            this.addChild(luckyStar);            
		}
	}
}