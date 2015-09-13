package {
    import flash.display.BlendMode;
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    [SWF(backgroundColor=0x000000)]
    public class AsExam4_7 extends Sprite 
    {
    	// 화면에 추가되는 Sprite 객체를 담을 배열 
    	private var arr:Array = new Array();
        public function AsExam4_7() 
        {
        	displayMain();
        	addEventHandlers();
        }
        // 화면을 클릭했을 때 clickHandler 함수가 실행되도록 함
        private function addEventHandlers():void
        {
            stage.addEventListener(MouseEvent.CLICK, clickHandler);            
        }
        // 화면에 랜덤한 곳에 랜덤한 크기로 50개의 사각형을 그린다음 배열에 추가 
        private function displayMain():void
        {
            for(var i:int=0; i<50; i++)
            {
	            var sp:Sprite = new Sprite();
	            sp.blendMode = BlendMode.LIGHTEN;
	            sp.graphics.beginFill(Math.random()*0x1000000);
	            sp.graphics.drawRect(Math.random()*400, Math.random()*400, Math.random()*100, Math.random()*100);
	            this.addChild(sp);
	            arr.push(sp);
            }	
        }

        // 화면을 클릭할 때 마다 배열에 있는 Sprite를 캐스팅하여 다시 화면을 그린다. 
        private function clickHandler(event:MouseEvent):void 
        {
        	for(var i:int=0; i<arr.length; i++)
        	{
        		var sp:Sprite = arr[i] as Sprite;
        		sp.graphics.clear();
                sp.graphics.beginFill(Math.random()*0x1000000);
                sp.graphics.drawRect(Math.random()*400, Math.random()*400, Math.random()*100, Math.random()*100);
        	}
        }       
    }
}