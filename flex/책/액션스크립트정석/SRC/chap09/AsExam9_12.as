package
{
	import flash.display.Sprite;
	import flash.geom.Point;
	
	[SWF(backgroundColor=0xFFFFFF)]
	public class AsExam9_12 extends Sprite
	{
		// 자유 곡선을 그리는 횟수
		private var curveCounts:int = 300;
		public function AsExam9_12()
		{
			drawCurves();
		}
        // curveCounts 만큼 자유 곡선을 계속 이어서 그린다.	
		private function drawCurves():void
		{
			// 앵커포인트 좌표정보를 curveCounts 만큼 랜덤으로 생성하여 배열에 담는다.
			var pointArr:Array = new Array();
			for (var i:int = 0; i < curveCounts; i++)
			{
				pointArr[i] = new Point();
				pointArr[i].x = Math.random() * stage.stageHeight;
				pointArr[i].y = Math.random() * stage.stageHeight;
			}
            // 최초 컨트롤 포인트는 맨처음 앵커포인트와 맨마지막 앵커포인트의 중간지점으로 설정한다.			
			var cpX0:Number = (pointArr[0].x + pointArr[curveCounts - 1].x) / 2;
			var cpY0:Number = (pointArr[0].y + pointArr[curveCounts - 1].y) / 2;
			// 그리기 시작점을 이동한다.
			graphics.moveTo(cpX0, cpY0);
            // 선색상을 랜덤으로 지정하고 
            // 2번째부터 맨 뒤에서 2번째 앵커포인트의 중간지점을 컨트롤포인트로 설정하여 curveTo호출  
			for (i = 0; i < curveCounts - 1; i ++)
			{
				graphics.lineStyle(1, Math.random()*0x1000000);
				var cpX:Number = (pointArr[i].x + pointArr[i + 1].x) / 2;
				var cpY:Number = (pointArr[i].y + pointArr[i + 1].y) / 2;
				graphics.curveTo(pointArr[i].x, pointArr[i].y, cpX, cpY);
			}
			// 마지막 앵커포인트와 최초 컨트롤포인트를 이용하여 곡선을 마무리 한다. 
			graphics.curveTo(pointArr[i].x, pointArr[i].y, cpX0, cpY0);
		}
	}
}
