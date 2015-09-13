package 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.filters.DropShadowFilter;
	[SWF(backgroundColor=0xFFFFFF)]
	public class AsExam9_6 extends Sprite 
	{
		private var sp1:Sprite;
		private var sp2:Sprite;
		private var flag1:Boolean;
		private var flag2:Boolean;
		public function AsExam9_6()
		{
			// 사각형을 파란, 빨간색으로 그린다.
			sp1 = createSprite(0x0000FF);
			sp2 = createSprite(0xFF0000);
            // sp1과 겹치지 않도록 x좌표를 이동한다.
            sp2.x = 100;			
			// 각기 클릭 이벤트 핸들러 함수를 등록한다.
			sp1.addEventListener(MouseEvent.CLICK, clickHandler1);
			sp2.addEventListener(MouseEvent.CLICK, clickHandler2);	
		}
		// 지정된 색상으로 Sprite를 생성한 다음 화면에 추가한다.
		private function createSprite(color:uint):Sprite
		{
			var sp:Sprite = new Sprite();
            sp.graphics.beginFill(color);
            sp.graphics.drawRect(0, 0, 100, 100);	
            sp.buttonMode = true;		
            sp.filters = [new DropShadowFilter()];
			this.addChild(sp);
			return sp;
		}
		// 첫번째 사각형을 클릭하면 실행되는 함수로서 단위 행렬변환을 적용한다.
		private function clickHandler1(evt:MouseEvent):void
		{
			var mt:Matrix = new Matrix();
			// 45도 회전 변환 적용
			mt.rotate(Math.PI/4);
			// flag1값이 true면 초기 행렬값으로 변환
			if(flag1) 
			{
	  			mt.identity();
	  		} 	
	  		flag1 = !flag1;				
	  		// 변환한 매트릭스값 적용
	        sp1.transform.matrix = mt;
		}
        // 두번째 사각형을 클릭하면 실행되는 함수로서 역행렬 변환을 적용한다.
		private function clickHandler2(evt:MouseEvent):void 
		{
			// 45도 회전 변환 적용. 
			var mt1:Matrix = new Matrix(Math.cos(Math.PI/9), Math.sin(Math.PI/9), -Math.sin(Math.PI/9), Math.cos(Math.PI/9), 0, 0);
			// 2배로 스케일 변환
			var mt2:Matrix = new Matrix(2, 0, 0, 2, 0, 0);
			// 두 개의 행렬을 합친다.
			mt1.concat(mt2);
			// flag2값이 true면 역행렬로 변환한다.
			if(flag2) 
			{
	  			mt1.invert();
	  		} 				
	  		flag2 = !flag2;	
	  		// 변환한 매트릭스값을 적용 
	        sp2.transform.matrix = mt1;
	        // sp1과 겹치지 않도록 x좌표를 이동한다.
	        sp2.x = 100;
		}		
	}
}