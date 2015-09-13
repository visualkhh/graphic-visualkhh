package 
{
	import flash.display.Sprite;
	import flash.events.*;
	[SWF(width=100,height=100,backgroundColor=0x00FFFF)]
	public class AsExam6_19_SubTriangle extends Sprite 
	{
		public function AsExam6_19_SubTriangle(inColor:uint)
		{
			var triangleHeight:Number = 100;
			var triangleWidth:Number = 80;
			// 화면에 삼각형을 그린다.
			this.graphics.beginFill(inColor);
			this.graphics.lineStyle(.5, 0xFFFFFF, .8);
			this.graphics.moveTo(triangleWidth/2,0); // 꼭지점 1
			this.graphics.lineTo(triangleWidth, triangleHeight);// 꼭지점 2
			this.graphics.lineTo(0, triangleHeight);// 꼭지점 3
			this.graphics.lineTo(triangleWidth/2, 0);//다시 꼭지점 1으로	
			this.addEventListener(MouseEvent.CLICK, remove);	
		}
        // 자신을 클릭했을 때 화면에서 제거하는 함수
        private function remove(event:Event):void 
        {
            if(event.target == event.currentTarget) 
            {
                var target:Sprite = Sprite(event.target);
                target.parent.removeChild(target);
            }
            event.stopImmediatePropagation();
        }		
	}
}

