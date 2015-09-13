package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
    [SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
	public class AsExam10_10 extends Sprite
	{
		private var amount:int = 400;
		public function AsExam10_10()
		{
        	stage.addEventListener(MouseEvent.CLICK, clickHandler);
        }		
        // 마우스를 클릭하는 위치에 입자를 원형으로 분포시킨다.
        private function clickHandler(event:MouseEvent):void
        {
            var ang:Number = 0;
            // 중심과의 거리
            var radius:Number = 200;
            var dx:Number = 0;
            var dy:Number = 0;
            this.graphics.clear();
            // 각도를 0~360도로 돌아가며 랜덤한 곳에 화면을 그린다.
            for(var a:int = 0; a<=360; a++)
            {
	            this.graphics.lineStyle(2, Math.random()*0x1000000);
	            this.graphics.beginFill(Math.random()*0x1000000);
                ang = a*Math.PI/180;
                // 중심과의 거리도 랜덤하게 만든다.
                dx = Math.cos(ang) * Math.random()*radius;
                dy = Math.sin(ang) * Math.random()*radius;
                this.graphics.drawCircle(event.stageX + dx, event.stageY + dy, 5);
            } 
        }        
	}
}