package
{
    import flash.display.Sprite;
    import flash.text.TextField;
    import flash.text.TextFormat;
    
    [SWF(width=800, height=800, backgroundColor=0xffffff)]
    public class AsExam4_8 extends Sprite
    {
    	// 텍스트필드들을 담을 Sprite 객체 
        private var sp:Sprite = new Sprite();
        public function AsExam4_8()
        {
        	displayMain();
        	addChars();
        }
        // Sprite를 화면에 추가
        private function displayMain():void
        {
        	sp.x = 500;
            this.addChild(sp);
        }
        // 텍스트필드 200개를 Sprite에 추가
        private function addChars():void
        {
            for(var i:int = 0; i < 200; i++)
            {
                var tf:TextField = new TextField();
                tf.defaultTextFormat = new TextFormat("Arial", 35, Math.random()*0x1000000);
                // 한글 유니코드 범위에 있는 값을 무작위로 추출  
                tf.text = String.fromCharCode(Math.random() * 5000 + 45000);
                //tf.text = String.fromCharCode(65 + Math.random() * 25); // 알파벳 
                tf.x = Math.random() * 500 - 250;
                tf.y = Math.random() * 500 - 250;
                // 입체감을 주기 위해 z 좌표 추가
                tf.z = Math.random() * 1000;
                sp.addChild(tf);
            }
        }
    }
}