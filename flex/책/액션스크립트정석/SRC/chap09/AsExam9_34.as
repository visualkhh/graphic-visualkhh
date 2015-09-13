package
{
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;    
	[SWF(backgroundColor=0xFFFFFF)]
	public class AsExam9_34 extends Sprite
	{
        // 이미지를 임베드하기 위한 클래스 (Photo) 선언
        [Embed(source="assets/okjaemin04.jpg")]
        public var Photo:Class;         
        // 이미지를 로드하기 위한 비트맵
        private var bg:Bitmap = new Photo();
        // 마스크 객체
        private var myMask:Shape = new Shape();
        // 마스크 종류를 선택하기 위한 변수
        private var maskChoice:uint=1;
		public function AsExam9_34()
		{
			displayMain();
			addMask();
			addEventHandlers();
		}
		
		private function displayMain():void
		{
            stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.align = StageAlign.TOP;			
			this.addChild(bg);
		}
        // myMask에 그래픽을 그려서 화면에 추가한 다음 mask 설정을 함
        private function addMask():void
        {
        	myMask.graphics.beginFill(0xFF0000);
        	myMask.graphics.drawCircle(0, 0, 100);
			this.addChild(myMask);
        	this.mask = myMask;
        }		
        
        private function addEventHandlers():void
        {
            stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);   	
            stage.addEventListener(MouseEvent.CLICK, clickHandler);
        }
        // 화면을 클릭하면 마스크 모양이 바뀐다.
        private function clickHandler(event:MouseEvent):void
        {
        	myMask.graphics.clear();
        	myMask.graphics.beginFill(0xFF0000);
        	switch(maskChoice)
        	{
        		case 0:
                    myMask.graphics.drawCircle(0, 0, 100);        		
        		    break;
                case 1:
		        	myMask.graphics.drawRect(0, 0, 200, 200);
                    break;
                case 2: // 럭키스타
		            myMask.graphics.lineStyle(5, Math.random()*0x1000000);
		            myMask.graphics.moveTo(0, 150);
		            myMask.graphics.curveTo(150, 150, 150, 0);
		            myMask.graphics.curveTo(150, 150, 150*2, 150);
		            myMask.graphics.curveTo(150, 150, 150, 150*2);
		            myMask.graphics.curveTo(150, 150, 0, 150);
                    break;
                case 3: // 다윗의 별
		            myMask.graphics.moveTo(200/2, 0); 
		            myMask.graphics.lineTo(200, 200);
		            myMask.graphics.lineTo(0, 200);
		            myMask.graphics.lineTo(200/2, 0);      
		            myMask.graphics.moveTo(0, 60);
		            myMask.graphics.lineTo(200, 60);
		            myMask.graphics.lineTo(200/2, 200+60);
		            myMask.graphics.lineTo(0, 60); 
                    break;
        	}
        	// 마스크 초이스값 변경
        	maskChoice++;
        	if(maskChoice > 3) maskChoice = 0;
        }
        // 마우스가 움직이는 곳으로 마스크를 이동한다.
        private function mouseMoveHandler(event:MouseEvent):void
        {
        	myMask.x = event.stageX;
        	myMask.y = event.stageY;
        }
	}
}