package 
{
    import flash.display.Sprite;
    import flash.display.Graphics;
    import flash.events.MouseEvent;
	[SWF(width=800,height=600,backgroundColor=0x000000)]
    public class AsExam8_2 extends Sprite 
    {
        public function AsExam8_2() 
        {
        	// 그리기 선 속성 지정, 굵기는 10, 색상은 하얀색
            this.graphics.lineStyle(10, 0xFFFFFF);
            // 마우스다운, 마우스업 이벤트 핸들러 함수 추가
            stage.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
            stage.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
        }
        private function mouseDownHandler(event:MouseEvent):void 
        {
	        // 마우스를 누르면 직선 그리기의 위치를 이동함 
            this.graphics.moveTo(event.stageX, event.stageY);
            // 마우스움직이는 곳을 따라서 선을 그릴 수 있도록 마우스 무브 이벤트 핸들러 추가
            stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
        }
        // 마우스를 놓으면 mouseMoveHandler 함수 제거
        private function mouseUpHandler(event:MouseEvent):void 
        {
            stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
        }
        // 마우스를 움직이면 곳을 따라 직선을 그려줌 
        private function mouseMoveHandler(event:MouseEvent):void 
        {
            this.graphics.lineTo(event.stageX, event.stageY);
        }    
    }
}