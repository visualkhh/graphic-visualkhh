package 
{
	import flash.display.Sprite;
	[SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
	public class AsExam9_14 extends Sprite 
	{
		public function AsExam9_14() 
		{
			showPixelHinting();
			showCaps();
			showLineScaleMode();
			showJoints();
		}
		// 픽셀힌팅 설정 차이를 보여준다.
        private function showPixelHinting():void 
        {
        	// 픽셀힌팅 설정
			this.graphics.lineStyle(1, 0xFF0000, 1, true);
			this.graphics.drawRoundRect(10, 10, 100, 100, 30, 30);
			// 픽셀힌팅 설정 안함
			this.graphics.lineStyle(1, 0xFF0000, 1, false);
			this.graphics.drawRoundRect(127, 10, 100, 100, 30, 30);
        }		
		
		private function showLineScaleMode():void 
		{
			// 스케일모드 vertical로 설정
			var circleSprite:Sprite = new Sprite();
			circleSprite.graphics.lineStyle(2, 0xFF0000, 1, true, "vertical");
			circleSprite.graphics.drawCircle(0, 0, 30); 
			this.addChild(circleSprite);
			circleSprite.x = 40;
			circleSprite.y = 200;
			
			var circleSprite2:Sprite = new Sprite();
			circleSprite2.graphics.lineStyle(2, 0x00FF00, 1, true, "vertical");
			circleSprite2.graphics.drawCircle(0, 0, 30);
			// y축으로 2배 확대
			circleSprite2.scaleY = 2;
			this.addChild(circleSprite2);
			circleSprite2.x = 110;
			circleSprite2.y = 200;
			
			var circleSprite3:Sprite = new Sprite();
			circleSprite3.graphics.lineStyle(2, 0x0000FF, 1, true, "vertical");
			circleSprite3.graphics.drawCircle(0, 0, 30);
			// x축으로 2배 확대
			circleSprite3.scaleX = 2;
			this.addChild(circleSprite3);			
			circleSprite3.x = 210;
			circleSprite3.y = 200;
		}

		private function showCaps():void 
		{
			// 캡스 스타일 none
			this.graphics.moveTo(250, 20);
			this.graphics.lineStyle(20, 0xFF0000, 1, true, "normal", "none");
			this.graphics.lineTo(350, 20);
            // 캡스 스타일 round
			this.graphics.moveTo(250, 60);
			this.graphics.lineStyle(20, 0x00FF00, 1, true, "normal", "round");
			this.graphics.lineTo(350, 60);
            // 캡스 스타일 square
			this.graphics.moveTo(250, 100);
			this.graphics.lineStyle(20, 0x0000FF, 1, true, "normal", "square");
			this.graphics.lineTo(350, 100);
		}
		
		private function showJoints():void 
		{
			var jointSprite1:Sprite = new Sprite();			
			jointSprite1.graphics.moveTo(20, 300);
			// 조인트 스타일 round
			jointSprite1.graphics.lineStyle(20, 0xFF0000, 1, true, "normal", "none", "round");
			jointSprite1.graphics.lineTo(100, 300);
			jointSprite1.graphics.lineTo(20, 400);
			this.addChild(jointSprite1);

			var jointSprite2:Sprite = new Sprite();			
			jointSprite2.graphics.moveTo(120, 300);
			// 조인트 스타일 miter 
			jointSprite2.graphics.lineStyle(20, 0x00FF00, 1, true, "normal", "none", "miter");
			jointSprite2.graphics.lineTo(200, 300);
			jointSprite2.graphics.lineTo(120, 400);
			this.addChild(jointSprite2);
            // 조인트 스타일 bevel
			var jointSprite3:Sprite = new Sprite();			
			jointSprite3.graphics.moveTo(230, 300);
			jointSprite3.graphics.lineStyle(20, 0x0000FF, 1, true, "normal", "none", "bevel");
			jointSprite3.graphics.lineTo(310, 300);
			jointSprite3.graphics.lineTo(230, 400);
			this.addChild(jointSprite3);					
		}
	}
}