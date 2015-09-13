package 
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.filters.DropShadowFilter;
	import flash.geom.Matrix;
	[SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
	public class AsExam9_4 extends Sprite	
	{
		public function AsExam9_4() 
		{
			var sh0:Shape = createRectangle(50, 50, 0xFF0000);
			var sh1:Shape = createRectangle(50, 50, 0x00FF00);
			var sh2:Shape = createRectangle(50, 50, 0x0000FF);
			
			// scaleX=2, scaleY=2 후 x축으로 100, y축으로 100 이동 변환
			// var mt1:Matrix = new Matrix(2, 0, 0, 2, 100, 100); 와 같은 의미를 가짐
			var mt1:Matrix = new Matrix();
			mt1.scale(2, 2);
			mt1.translate(100, 100);
			sh1.transform.matrix = mt1;
            // x축으로 100, y축으로 100 이동 변환 후 scaleX=2, scaleY=2 (행렬 연산 결과가 달라짐) 
            var mt2:Matrix = new Matrix();
            mt2.translate(100, 100);
            mt2.scale(2, 2);
            sh2.transform.matrix = mt2;
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