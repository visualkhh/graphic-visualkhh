package
{
	import flash.display.Sprite;
    [SWF(width=800,height=600,backgroundColor=0x000000)]
	public class AsExam10_6 extends Sprite
	{
		public function AsExam10_6()
		{
			for(var i:int=0; i< 300; i++)
			{
				var sp:Sprite = new Sprite();
				sp.graphics.beginFill(Math.random()*0x1000000);
				// 화면의 width, height에 대해 랜덤한 값을 만들어 화면의 1/4분면에 골고루 분포하게 함
				sp.graphics.drawCircle(Math.random()*stage.stageWidth/2, Math.random()*stage.stageHeight/2, 10);
				this.addChild(sp);
			}
		}
	}
}