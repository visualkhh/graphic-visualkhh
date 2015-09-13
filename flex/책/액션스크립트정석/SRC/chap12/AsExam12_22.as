package
{
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.events.KeyboardEvent;
    [SWF(backgroundColor = 0xffffff)]
    public class AsExam12_22 extends AsExam12_21
    {
        private var remoteObj:AsExam12_22_Sub;
        
        public function AsExam12_22()
        {
        }
        // 로드할 SWF의 URL을 바꿔서 로딩한다.
        override protected function addComboBox():void
        {
            var comboArr:Array = ["AsExam12_22_Sub.swf", "http://okgosu.net/book/AsExam12_22_Sub.swf", 
           "http://swexperts.org/public/AsExam12_22_Sub.swf"];          
            // 콤보박스 추가
            comboBox = new AsExam8_ComboBox(comboArr, 230, 15, "");
            this.addChild(comboBox);
            comboBox.x = 10;
            comboBox.y = 10;            
        }
        // 숫자입력기의 값을 바꾸면 로드된 SWF의 scaleY값을 변경함
        override protected function numberChangedHandler(event:MouseEvent):void
        {
           var ns:AsExam8_NumericStepper = event.currentTarget as AsExam8_NumericStepper;           
           remoteObj.scaleY = ns.selectedNumber;
        }       
        // 로드가 완료되면 실행된다.
        override protected function loadCompleteHandler(event:Event):void
        {
            trace('로드 완료!');
            if(remoteObj != null) this.removeChild(remoteObj);
            var Remote:Class = loaderInfo.applicationDomain.getDefinition("AsExam12_22_Sub") as Class;
            remoteObj = new Remote(); 
            this.addChildAt(remoteObj, 1);
            remoteObj.y = 60;
        }        
        // 텍스트필드에 값을 입력하고 엔터키를 치면 로드된 SWF의 텍스트필드 값을 변경한다.
        override protected function keyboardHandler(evt:KeyboardEvent):void 
        {
            if(evt.keyCode == 13) 
            {
                remoteObj.tf.text =  "[AsExam12_22]:" + tf.text;
                remoteObj.drawBG();
            }            
        }           
    }
}