package
{
	import flash.display.Sprite;
	import flash.display.GradientType;
	import flash.geom.Matrix;	

	public class AsExam9_15_MyBall extends Sprite
	{
		// 반지름 기본값은 20
	    public var radius:Number=20;
	    // 색상은 빨간색이 기본
	    public var color:uint=0xFF0000;
	    // 반지름과 색상을 입력받는 생성자 함수
	    public function AsExam9_15_MyBall(r:Number=20, color:uint=0xFF0000)
	    {
	        this.radius = r;
	        this.color = color;
	        drawMyBall(r, color);
	    }
	    // 그라데이션을 이용하여 입체볼을 그린다.
	    public function drawMyBall(radius:Number=20, color:uint=0xFF0000):void 
	    {
	        this.graphics.clear();
	        // 흰색과 입력받은 색상으로 배열을 생성
	        var colors:Array = [0xFFFFFF, color];
	        var matrix:Matrix = new Matrix();
	        // 매트릭스 변환을 적용하여 그라데이션을 90도 회전하고, 반지름에 따라 크기를 변경하여 
	        // 흰색 그라데이션이 원의 좌상단으로 가도록 한다.   
	        matrix.createGradientBox(-250*(radius/100), -250*(radius/100), Math.PI/2, radius, radius*0.8);
	        // 공모양에 맞게 원형 그라데이션을 적용한다.
	        this.graphics.beginGradientFill(GradientType.RADIAL, colors, [1, 1], [0, 255], matrix);
	        // 지정된 반지름크기로 원을 그린다.   
	        this.graphics.drawCircle(0, 0, radius);
	    }       
	}
}
