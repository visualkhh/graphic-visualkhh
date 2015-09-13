package 
{
	import flash.display.Sprite;

	public class AsExam7_6_Sub extends Sprite{

		public function AsExam7_6_Sub()	
		{
			drawParticles();
		}
		// 200개의 사각형 둥글게 배치한다. 
		private function drawParticles():void 
		{
			var maxleaves:Number = 200;
			var G:Number = 1/1.618033989;
			var GA:Number = 360 - 360*G - 300;
			var rad:Number = 30;
			var rgrowth:Number = 1.005;
			var cur:Number = maxleaves;
			var rot:Number = 0;
			
			while (cur > 0) 
			{
				cur--;
				rot += GA;
				rot -= int(rot/360)*360;
				rad *= rgrowth;
				var x:Number = Math.cos(rot*Math.PI/180)*rad;
				var y:Number = Math.sin(rot*Math.PI/180)*rad;
				var size:int = 4;
				var sp:Sprite = new Sprite();
				sp.graphics.lineStyle(1, Math.floor(Math.random() * 0x1000000), .8);
				sp.graphics.drawRect(0, 0, size, size);
				sp.rotation = rot;
			    sp.x = x + 100;
			    sp.y = y + 100;
				this.addChild(sp);			
			}
		}
	}
}
