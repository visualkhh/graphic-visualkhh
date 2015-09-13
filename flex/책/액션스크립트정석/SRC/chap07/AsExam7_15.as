package
{
    import flash.display.Sprite;
    import flash.text.engine.*;
    [SWF(backgroundColor=0xcea66b)]
    public class AsExam7_15 extends Sprite
    {
        private var msg:String =  "나랏말ㅆㆍ미中듕國귁에달아\n" +
        "文字와로서르ㅅㆍㅁㆍㅅ디아니ㅎㆍㄹㅆㆎ\n" +
        "이런젼ㅊㆍ로어린百백姓셩이\n" +
        "니르고져홀배이셔도\n" + // 홇 
        "ㅁㆍㅊㆍㅁ내 제ㅳㅡ들시러펴디\n" +
        "못ㅎㆍㅭ 노미하니라\n" + // 몯
        "내이ㄹㆍㄹ爲윙ㅎㆍ야어엿비너겨\n" +
        "새로스믈여덟字짜ㄹㆍㄹ맹ㄱㆍ노니\n" + // 듧
        "사ㄹㆍㅁ마다ㅎㆎㆀㅕ수ㅸㅣ니겨날로ㅄㅜ메\n" +
        "便安케 ㅎㆍ고져 ㅎㆍㅭㅼㆍㄹㆍ미니라"; // 킈        	
        private var textBlock:TextBlock = new TextBlock();
        public function AsExam7_15()
        {
            // TextBlock을 생성한다. 
            makeTextBlock();
            // TextBlock으로부터 TextLine을 생성한다.
            makeTextLine();        	
        }
        
        private function makeTextBlock():void
        {
            var fontDescription:FontDescription = new FontDescription("휴먼옛체");
            var format:ElementFormat = new ElementFormat();
            format.fontSize = 15;
            format.fontDescription = fontDescription;
            format.kerning = Kerning.ON; 
            format.trackingLeft = -1; 
            format.trackingRight = -1; 
            var textElement:TextElement = new TextElement(msg, format); 
            textBlock.content = textElement;
            // 텍스트블록을 90도 회전한다.
            textBlock.lineRotation = TextRotation.ROTATE_90;
        }
        
        private function makeTextLine():void
        {
            // 세로 라인의 시작 위치 
            var linePosition:Number = this.stage.stageWidth - 120;
            var previousLine:TextLine = null;
            while (true) 
            {
            	// 300픽셀 단위로 잘라서 
                var textLine:TextLine = textBlock.createTextLine(previousLine, 300);
                if (textLine == null) break;
                textLine.y = 30;    
                textLine.x = linePosition;
                // -24픽셀씩 이동하여 다음 라인을 배치한다. 
                linePosition -= 24;
                addChild(textLine);                
                previousLine = textLine;
            } 
        } 
    }
}