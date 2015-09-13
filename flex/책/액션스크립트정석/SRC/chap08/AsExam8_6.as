package
{
	import flash.display.Sprite;
	[SWF(backgroundColor=0xFFFFFF)]
	public class AsExam8_6 extends Sprite
	{
		private var sp:Sprite = new Sprite();
		public function AsExam8_6()
		{
			displayMain();
			layoutObject();
		}
		// Sprite의 이름을 sp로 설정하여 드랍타겟 확인에 사용한다.
		private function displayMain():void
		{
			sp.name = "sp";
			sp.graphics.beginFill(0xFF0000);
			sp.graphics.drawRect(100, 100, 100, 100);
			this.addChild(sp);
		}
		// 드래그앤드랍을 위한 AsExam8_6_Sub 객체를 4개 추가한다.
		private function layoutObject():void 
		{
			for(var i:int=0; i<4; i++) 
			{
				var drObj:AsExam8_6_Sub = new AsExam8_6_Sub();
				drObj.x = 220;
				drObj.y = 100 + (i * 25);
				this.addChild(drObj);
			}
		}
	}
}