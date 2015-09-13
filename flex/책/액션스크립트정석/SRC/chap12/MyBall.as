package
{
	import flash.display.GradientType;
	import flash.display.InterpolationMethod;
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	
	public class MyBall extends Sprite
	{
		public var aff:Number = 1; // 인력 척력
		public var m:Number = 1;//질량
		public var radius:Number=20;
		public var color:uint=0xFF0000;
		public var vx:Number=0; 
		public var vy:Number=0;
		public var vz:Number=0;		
		
		public var posX:Number=0;
		public var posY:Number=0;
		public var posZ:Number=0;
		
		public function MyBall(r:Number=20, color:uint=0xFF0000, showTail:Boolean=false)
		{
			this.radius = r;
			this.color = color;
			drawMagicBall(r, color);
			if(showTail) drawTail();
		}
		
		public function drawMagicBall(radius:Number=20, color:uint=0xFF0000):void 
		{
			graphics.clear();
			var fillType:String = GradientType.RADIAL;
			var colors:Array = [0xFFFFFF, color];
			var alphas:Array = [1, 1];
			var ratios:Array = [0x00, 0xFF];
			var matrix:Matrix = new Matrix();
			matrix.createGradientBox(-250*(radius/100), -250*(radius/100), Math.PI/2, radius, radius*0.8);
			var spreadMethod:String = SpreadMethod.PAD;
			var interpolation:String = InterpolationMethod.RGB
			graphics.beginGradientFill(GradientType.RADIAL, colors, alphas, ratios, matrix, spreadMethod,interpolation);  
			graphics.drawCircle(0, 0, radius);
		}		
		
		private function drawTail():void
		{
			graphics.lineStyle(2, 0xFF0000);
			graphics.moveTo(-radius, 0);
			graphics.lineTo(-radius-10, 0);
		}
	}
}