package 
{
    import flash.display.Sprite;
    import flash.events.MouseEvent;

	[SWF(backgroundColor=0x000000)]
    public class AsExam9_9 extends Sprite 
    {
        public function AsExam9_9() 
        {
            // 선 굵기 10으로 하얀 직선을 그리기 시작
            graphics.lineStyle(10, 0xFFFFFF, 1);
            // 화면의 중심에서 그리기 시작함
            graphics.moveTo(stage.stageWidth/2, stage.stageHeight/2);
            // 마우스 다운 이벤트 핸들러 함수를 등록 
            stage.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
        }
	    // 마우스를 누른 지점까지 직선을 그린다
        private function mouseDownHandler(event:MouseEvent):void 
        {
            graphics.lineTo(event.stageX, event.stageY);
        }
    }
}