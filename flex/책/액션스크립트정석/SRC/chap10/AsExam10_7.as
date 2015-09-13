package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
    [SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
	public class AsExam10_7 extends Sprite
	{
		private var tf:TextField = new TextField();
		public function AsExam10_7()
		{
			displayMain();
			addEventHandlers();
		}
		// 거리값을 표시하기 위한 텍스트필드 추가
		private function displayMain():void
		{
		    this.addChild(tf);
		    tf.autoSize = "left";
		}
        
        private function addEventHandlers():void
        {
        	stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
        }
        // 중심점에서 마우스 위치까지 선을 그리고 거리를 계산한다.
        private function mouseMoveHandler(event:MouseEvent):void
        {
        	this.graphics.clear();
        	// 마우스 중심점으로 그리기 시작점 이동
        	this.graphics.moveTo(stage.stageWidth/2, stage.stageHeight/2);
        	this.graphics.lineStyle(5, Math.random() * 0x1000000);
        	// 마우스 위치까지 선그리기
        	this.graphics.lineTo(event.stageX, event.stageY);
        	// 피타고라스의 정리를 이용하여 거리 계산
        	var dx:Number = event.stageX - stage.stageWidth/2;
        	var dy:Number = event.stageY - stage.stageHeight/2;
        	var distance:Number = Math.sqrt(dx*dx + dy*dy);
        	tf.text = "거리: " + distance;
        }		
	}
}