package
{
	import flash.display.GradientType;
	import flash.display.InterpolationMethod;
	import flash.display.SpreadMethod;
	import flash.geom.Matrix;
	
	public class MyStar extends MyBall
	{
		public function MyStar(r:Number=20, color:uint=0xFF0000)
		{
			this.radius = r;
			this.color = color;
			drawMyBall(r, color);
		}
		
		override public function drawMyBall(radius:Number=20, color:uint=0xFFFFFF):void 
		{
			graphics.clear();
			var gb:Matrix = new Matrix();
			gb.createGradientBox(radius*2, radius*2, 0, -radius, -radius);
			var ipm:String = InterpolationMethod.RGB;  
			// 별의 외곽에 빛나는 부분을 원형 그라데이션으로 칠한다. 
			this.graphics.beginGradientFill(GradientType.RADIAL, [0xFFFFFF, color], 
            [1, 0.7], [100, 255], gb, SpreadMethod.PAD, ipm);
            // 별의 중심부 
			this.graphics.drawCircle(0, 0, radius);
		}		
	}
}