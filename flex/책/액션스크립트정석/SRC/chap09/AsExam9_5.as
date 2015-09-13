package 
{
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.geom.Matrix;
	import flash.filters.DropShadowFilter;
	[SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
	public class AsExam9_5 extends Sprite 
	{
		public function AsExam9_5()	
		{
            var sh1:Shape = createRectangle(50, 150, 0xFF0000);
            var sh2:Shape = createRectangle(50, 150, 0x00FF00);
            var sh3:Shape = createRectangle(50, 150, 0x0000FF);
            var sh4:Shape = createRectangle(50, 150, 0xFFFF00);
			// 200, 100 이동 변환 
			var mt1:Matrix = new Matrix(1, 0, 0, 1, 200, 100);
			sh1.transform.matrix = mt1;
			// 45도 (Math.PI/4) 회전 변환, 200, 100 씩 이동 변환 
			var mt2:Matrix = new Matrix(Math.cos(Math.PI/4), Math.sin(Math.PI/4), -Math.sin(Math.PI/4), Math.cos(Math.PI/4), 200, 100);
			sh2.transform.matrix = mt2;
			// 90도 (Math.PI/2) 회전 변환, 200, 100 씩 이동 변환
			var mt3:Matrix = new Matrix();
			mt3.rotate(Math.PI/2);
			mt3.translate(200, 100);
			sh3.transform.matrix = mt3;
			// 30도 기울임 변환, 200, 100 씩 이동 변환 
            var mt4:Matrix = new Matrix(1, Math.tan(Math.PI/6), Math.tan(Math.PI/6), 1, 200, 100);
			sh4.transform.matrix = mt4;
		}

        // Shape를 이용하여 사각형을 그린 다음 화면에 추가한다.
        private function createRectangle(w:Number, h:Number, color:uint):Shape 
        {
            var rect:Shape = new Shape();
            rect.graphics.beginFill(color);
            rect.graphics.drawRect(0, 0, w, h);
            rect.filters = [new DropShadowFilter()];
            addChild(rect);
            return rect;
        }	
	}
}