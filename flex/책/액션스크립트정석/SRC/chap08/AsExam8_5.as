package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	   import flash.display.Bitmap;
	[SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
	public class AsExam8_5 extends Sprite
	{
        // 이미지를 임베드하기 위한 클래스 (Photo) 선언
        [Embed(source="assets/tree_cursor.png")]
        public var Photo:Class; 		
        // 커서 이미지를 로드하기 위한 비트맵
		private var cursor:Bitmap = new Photo();
		private var sp:Sprite = new Sprite();
		public function AsExam8_5()
		{
			displayMain();
			addEventHandlers();
		}
		// 화면에 원을 그리고 sp, cursor 객체를 추가한다. 
		private function displayMain():void 
		{
			sp.graphics.beginFill(Math.random()*0x1000000);
			sp.graphics.drawCircle(100, 100, 100)
			sp.x = sp.y = 100;
			this.addChild(sp);
			this.addChild(cursor);
			cursor.visible = false;
		}
        // 마우스오버와 마우스 아웃 이벤트 핸들러를 등록한다.
		private function addEventHandlers():void
		{
			sp.addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
			sp.addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
		}
		// 마우스 오버시 원래 커서를 숨기고 마우스가 움직일 때마다 mouseMoveHandler가 실행되게 한다.
		private function mouseOverHandler(event:MouseEvent):void 
		{
            Mouse.hide();
            cursor.visible = true;
            sp.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
		}
        // 마우스 아웃시 원래 커서를 보여주고 커스텀 커서는 숨기고 mouseMoveHandler는 제거한다.
		private function mouseOutHandler(event:MouseEvent):void 
		{
			Mouse.show();
			cursor.visible = false;
			sp.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
		}
        // 마우스가 움직일 때 마다 커스텀 커서를 마우스 위치에 보이도록 한다.
        private function mouseMoveHandler(event:MouseEvent):void 
        {
            cursor.x = event.stageX;
            cursor.y = event.stageY;
        }		
	}
}