package
{
	import flash.display.Sprite;
	import flash.text.engine.TextBlock;
	import flash.text.engine.TextElement;
	import flash.text.engine.TextLine;
	import flash.text.engine.ElementFormat;
	import flash.text.engine.FontDescription;
	import flash.text.engine.Kerning;
	[SWF(backgroundColor=0xFFFFFF)]
	public class AsExam7_14 extends Sprite
	{
        private var msg:String = "플래시플레이어10의 플래시 텍스트 엔진을 사용했소.";
        private var textBlock:TextBlock = new TextBlock(); 
		public function AsExam7_14()
		{
			// TextBlock을 생성한다. 
			makeTextBlock();
			// TextBlock으로부터 TextLine을 생성한다.
			makeTextLine();
		}
		// TextBlock의 content는 텍스트포맷과 텍스트엘리먼트로 구성된다.
        // TextElement에 텍스트 내용과 ElementFormat을 설정한다.
		private function makeTextBlock():void
		{
			var fontDescription:FontDescription = new FontDescription("휴먼옛체");
            var format:ElementFormat = new ElementFormat(fontDescription, 10, 0x0000FF);
			// 글자 간격 지정
			format.kerning = Kerning.ON; 
			format.trackingLeft = 0.1; 
			format.trackingRight = 0.1;             
            var textElement:TextElement = new TextElement(msg, format); 
            textBlock.content = textElement; 
        }
        // TextBlock으로부터 TextLine을 생성한 다음 화면에 추가한다.
        private function makeTextLine():void
        {
            var textLine:TextLine = textBlock.createTextLine(null, 400); 
            this.addChild(textLine); 
            textLine.x = textLine.y = 10; 			
		} 
	}
}