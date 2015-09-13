package 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	
	[SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
	public class AsExam7_7 extends Sprite 
	{
		public function AsExam7_7()	
		{
			displayMain();
            applySkew();
		}
		// 사각형을 36개 그려준다.
		private function displayMain():void 
		{
			var rt:int = 0;
			for(var i:uint=0; i<36; i++) 
			{
				var sp:Sprite = new Sprite();
				sp.graphics.beginFill(Math.floor(Math.random() * 0x1000000));
	            sp.graphics.lineStyle(1, 0xFFFFFF, 1);			
				sp.graphics.drawRect(20, 20, 50, 150);
				// 사각형에 마우스를 올렸을 때 rollOverHandler 함수가 실행된다.
				sp.addEventListener(MouseEvent.ROLL_OVER, rollOverHandler);
				// 사각형을 클릭하면 clickHandler 함수가 실행된다.
				sp.addEventListener(MouseEvent.CLICK, clickHandler);
				this.addChild(sp);
				// 사각형을 10도씩 회전하면서 화면에 추가한다.
				sp.rotation += rt;
				rt += 10;
				sp.x = 400;
				sp.y = 200;
				sp.buttonMode = true;
			}				
		}
		// 현재 화면을 -0.5 정도 기울인다. 
		private function applySkew():void 
		{
            var skewMatrix:Matrix = new Matrix();
            skewMatrix.c = -0.5;
            var tempMatrix:Matrix = this.transform.matrix;
            tempMatrix.concat(skewMatrix);
            this.transform.matrix = tempMatrix;					
		}
		// 마우스를 올리면 디스플레이 오브젝트 컨테이너의 제일 위로 올라 오도록 한다.
		private function rollOverHandler(event:MouseEvent):void 
		{
		    var sp:Sprite = Sprite(event.target);
		    var idx:int = this.getChildIndex(sp);
		    trace('바뀌기전 idx:' + idx);
		    this.setChildIndex(sp, this.numChildren - 1);
		    idx = this.getChildIndex(sp);
		    trace('바뀐다음 idx:' + idx);				
		}
		// 마우스를 클릭하면 그 객체를 제거한다.
		private function clickHandler(event:MouseEvent):void 
		{
		    var sp:Sprite = Sprite(event.target);
		    this.removeChild(sp);
		}
	}
}