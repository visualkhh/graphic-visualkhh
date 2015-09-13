package 
{
	import flash.display.Sprite;
	import flash.geom.Point;
	
	[SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
	public class AsExam7_2 extends Sprite 
	{
		public function AsExam7_2() 
		{
			displayMain();
		}

		private function displayMain():void 
		{
			var temp:Sprite = null;
			for(var i:uint=0; i<24; i++) 
			{
				var sp:AsExam7_2_SubCircle = new AsExam7_2_SubCircle(5*i);
				var orgPoint:Point = new Point(10, 10)
				sp.x = orgPoint.x;
				sp.y = orgPoint.y;
				if(temp == null) {
					this.addChild(sp);
				} else {
					temp.addChild(sp);					
				}
				var trsPoint:Point = sp.localToGlobal(orgPoint);			
				temp = sp;
				trace('orgPoint.x:'+ orgPoint.x);
				trace('trsPoint.x:' + trsPoint.x);
			}			
		}
	}
}