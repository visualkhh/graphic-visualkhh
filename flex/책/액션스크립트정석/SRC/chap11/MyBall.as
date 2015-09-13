package
{
	import flash.display.GradientType;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	
	public class MyBall extends Sprite
	{
		public var vx:Number=0;      // x축 방향 속도 
		public var vy:Number=0;      // y축 방향 속도
		public var vz:Number=0;      // z축 방향 속도(3D 모션에서 사용)
		public var radius:Number=20; // 공의 반지름
		public var color:uint;       // 공의 색상
		public var m:Number = 1;     // 공의 질량
		public var aff:Number = 1;   // 인력 척력
		public var ang:Number = 0;   // 공의 회전 각도 
		public function MyBall(r:Number=20, color:uint=0x1BE955, showTail:Boolean=false)
		{
			this.radius = r;
			this.color = color;
			drawMyBall(r, color);
			if(showTail) drawTail();
		}
		// 그라데이션을 적용하여 입체감을 부여한다.
		public function drawMyBall(radius:Number=20, color:uint=0x1BE955):void 
		{
            this.graphics.clear();
            var colors:Array = [0xFFFFFF, color];
            var matrix:Matrix = new Matrix();
            matrix.createGradientBox(-250*(radius/100), -250*(radius/100), Math.PI/2, radius, radius*0.8);
            this.graphics.beginGradientFill(GradientType.RADIAL, colors, [1, 1], [0, 255], matrix);
            this.graphics.drawCircle(0, 0, radius);			
		}		
		// showTail 플래그가 true면 공에 꼬리를 그린다.
		private function drawTail():void
		{
			this.graphics.lineStyle(2, 0xFF0000);
			this.graphics.moveTo(-radius, 0);
			this.graphics.lineTo(-radius-10, 0);
		}
	}
}