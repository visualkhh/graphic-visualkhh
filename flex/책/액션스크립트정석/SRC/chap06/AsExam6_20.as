package 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	[SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
	
	public class AsExam6_20 extends Sprite 
	{
		public function AsExam6_20() 
		{
			drawOkGosuSquares();
		}
        // 24개의 AsExam6_20_SubSquare를 서로 꼬리에 꼬리를 물게끔 추가한다.
		private function drawOkGosuSquares():void 
		{
			var temp:Sprite = null;
			for(var i:uint=0; i<24; i++) 
			{
				var sp:AsExam6_20_SubSquare = new AsExam6_20_SubSquare(120);
				sp.x = sp.y = 10;
				// 임시 변수를 이용하여 클래스가 부모 자식관계로 추가되도록 한다.
				if(temp == null) 
				{
					this.addChild(sp);
					sp.x = sp.y = 250;
				} else {
					temp.addChild(sp);					
				}
				temp = sp;
			}			
		}
	}
}