package
{
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    [SWF(backgroundColor=0x000000)]
    public class AsExam8_27 extends Sprite
    {
        // 컬러 패널을 생성한다. (컬러패널 크기, 각 색상 셀의 크기 지정) 
        private var cp:AsExam8_ColorPanel = new AsExam8_ColorPanel(20, 20);
        public function AsExam8_27()
        {
            this.addChild(cp);
            cp.x = cp.y = 10;
            // 컬러가 선택되었을 때 실행될 이벤트 핸들러 등록
            cp.addEventListener("colorSelected", colorSelectedHandler);
        }
        // 선택한 색상값을 트레이스 로그로 출력 
        private function colorSelectedHandler(event:MouseEvent):void
        {
            trace("0x" + cp.selectedColor.toString(16));
        }
    }
}
