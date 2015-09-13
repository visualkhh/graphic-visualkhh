package
{
	import flash.display.Shape;
	import flash.display.Sprite;
    [SWF(backgroundColor=0x000000)]
	public class AsExam4_5 extends Sprite
	{
		public function AsExam4_5()
		{
			displayMain();
		}
		
		private function displayMain():void
		{
            var sh1:AsExam4_5_1 = new AsExam4_5_1();
            var sh2:AsExam4_5_1 = new AsExam4_5_1();
            var sh3:AsExam4_5_1 = new AsExam4_5_1();
            this.addChild(sh1);
            this.addChild(sh2);
            this.addChild(sh3);
			sh1.x += (sh2.x += (sh3.x += 10));
			trace(sh1.x, sh2.x, sh3.x); // 40, 30, 20
			sh1.y += (sh2.y += (sh3.y += 10));
			trace(sh1.y, sh2.y, sh3.y); // 40, 30, 20
		}
	}
}

import flash.display.Shape;
class AsExam4_5_1 extends Shape
{
	public function AsExam4_5_1()
	{
		this.graphics.lineStyle(1, 0xFFFFFF);
		this.graphics.beginFill(Math.random()*0x1000000);
		this.graphics.drawRect(0, 0, 100, 100);
		this.x = this.y = 10;
	}
}