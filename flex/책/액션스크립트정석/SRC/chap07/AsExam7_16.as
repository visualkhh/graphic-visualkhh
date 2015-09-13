package
{
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import flash.geom.Rectangle;
    import flash.ui.Mouse; 
    import flash.text.engine.*;
    [SWF(backgroundColor=0xFFFFFF)]
    public class AsExam7_16 extends Sprite
    {
        private var msg:String = "코드의 로직은 머리에서 코드의 입력은 타이핑에서 완성된다.";
        private var textBlock:TextBlock = new TextBlock(); 
        private var textLine:TextLine;
        private var charIndex:int = 0;
        private var charBox:Sprite = new Sprite();
        public function AsExam7_16()
        {
            // TextBlock을 생성한다. 
            makeTextBlock();
            makeTextLine();
            addEventHandlers();
        }
        private function addEventHandlers():void
        {
            stage.addEventListener(MouseEvent.CLICK, clickHandler);
            textLine.addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler); 
            textLine.addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler); 
        }

        private function makeTextBlock():void
        {
            var fontDescription:FontDescription = new FontDescription("휴먼편지체, 맑은 고딕, 궁서체");
            var format:ElementFormat = new ElementFormat(fontDescription, 20, 0x0000FF);
            var textElement:TextElement = new TextElement(msg, format); 
            textBlock.content = textElement; 
            
        }
        // TextBlock으로부터 TextLine을 생성한 다음 화면에 추가한다.
        private function makeTextLine():void
        {
            textLine = textBlock.createTextLine(null, 600); 
            this.addChild(textLine); 
            textLine.x = textLine.y = 50;           
            showAtom(textLine, 0);
        } 
        
        private function clickHandler(event:MouseEvent):void
        {
        	if(charIndex > msg.length-1) charIndex = 0;
        	 showAtom(textLine, charIndex++);
        }
        
        private function mouseOverHandler(event:MouseEvent):void 
        { 
            Mouse.cursor = "button"; 
        } 
 
        private function mouseOutHandler(event:MouseEvent):void 
        { 
            Mouse.cursor = "arrow"; 
        }        
        
        private function showAtom(textLine:TextLine, i:int):void
        {
            charBox.graphics.clear();
            var bounds:Rectangle = textLine.getAtomBounds(i);
            charBox.graphics.lineStyle(3, Math.random()*0x1000000);
            charBox.graphics.drawRect(bounds.left, bounds.top, bounds.width, bounds.height);
            textLine.userData = textLine.addChild(charBox);
        }  
    }
}