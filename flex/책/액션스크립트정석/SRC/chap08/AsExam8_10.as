package 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
    [SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
	public class AsExam8_10 extends Sprite 
	{
        // 일반 텍스트를 보여주는 TextField
        private var titleTxtFld:TextField = new TextField();
        // html을 보여주는 TextField
        private var contentTxtFld:TextField = new TextField();
        private var txtTitle:String = "TextField 클래스";
        private var txtContent:String = "<b>문자열</b>을 화면에 보여주거나 입력 받을 수 있도록 하는 클래스다.<br/><br/>" + 
        		"<ul><li>텍스트의 모양이나 색상은 <font color='#FF0000'>TextFormat</font> 클래스를 이용한다.</li>" + 
        		"<li>또한 html형태의 텍스트도 가능하다.</li></ul>" + 
        		"<br><a href='http://okgosu.net'><u>okgosu.net</u></a>" + 
        		"<br><a href='http://okgosu.tistory.com'><u>okgosu.tistory.com</u></a>" + 
        		"<br><a href='http://acornpub.co.kr'><u>에이콘출판사</u></a>" + 
        		"<img src='http://www.acornpub.co.kr/images/acorn_title.gif'/>";
		
		public function AsExam8_10()
		{
            makeTitle();
            setTitleTextFormat();
            makeContent();
		}
		// 제목을 보여주는 일반 텍스트 추가
		private function makeTitle():void 
		{
            titleTxtFld.width = 300;
            titleTxtFld.x = 20;
            titleTxtFld.y = 10;			
            titleTxtFld.text = txtTitle;
            addChild(titleTxtFld);
		}
		// 제목에 텍스트 포맷을 적용함 
		private function setTitleTextFormat():void
		{
            var format:TextFormat = new TextFormat();
            format.font = "굴림체";
            format.color = 0x0000FF;
            format.size = 15;
            format.underline = true;		
            format.bold = true;
            format.bullet = true;
            format.align = "left";
            titleTxtFld.setTextFormat(format);
		}
        // html 텍스트 추가 
        private function makeContent():void 
        {
            contentTxtFld.width = 300;
            // 텍스트 내용에 맞게 텍스트필드 높이가 증가하며 텍스트는 좌측 정렬됨
            contentTxtFld.autoSize = TextFieldAutoSize.LEFT;
            contentTxtFld.background = true;
            contentTxtFld.backgroundColor = 0xCCCCCC;
            contentTxtFld.border = true;
            // 텍스트가 줄바꿈되도록 함  
            contentTxtFld.wordWrap =true;
            // 텍스트를 여러줄에 걸쳐 표시되도록 함           
            contentTxtFld.multiline = true;
            contentTxtFld.borderColor = 0x00FF00;
            contentTxtFld.x = 20;
            contentTxtFld.y = 40;
            addChild(contentTxtFld);
            // html 속성에 텍스트값을 설정함
            contentTxtFld.htmlText = txtContent;
        }
	}
}
