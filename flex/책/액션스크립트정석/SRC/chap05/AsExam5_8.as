package {
	import flash.display.Sprite;
	import flash.events.*;
	//홀짝수 로직을 이용한 체스판 만들기
	public class AsExam5_8 extends Sprite 
	{
        // 그리드 셀의 On/Off를 위한 Boolean 플래그 변수 
        private var myFlag:Boolean = true;
        // 그리드 셀 Sprite객체를 담는 배열 
        private var arrGridSpr:Array;

		public function AsExam5_8()
		{
            displayMain();
            drawBoxes(); 
        }
        // 배열에 Sprite를 가로 세로 크기 (20*20=400)만큼 생성하여 담아둠 
        private function displayMain():void
        {
            arrGridSpr = new Array(); 
            for(var j:Number=0; j<400; j++) 
            {
                var sp:Sprite = new Sprite();
                arrGridSpr.push(sp);
                this.addChild(sp);
            }
        }        
		// 홀수 번째와 짝수 번째를 번갈아 가면서 서로 다른 색깔로 사각형을 그려줌 
		private function drawBoxes():void 
		{
            // 그리드 픽셀의 크기
            var recSize:Number = 20;
            // 각 그리드 셀의 좌표 계산을 위한 변수  
            var posX:Number = 0;
            var posY:Number = 0;
            var pixelColor:uint=0x000000;
            // Sprite 카운트 변수 
            var cnt:int= 0;			
			for(var i:Number=0; i<recSize; i++) 
			{
				for(var j:Number=0; j<recSize; j++) 
				{
					var sp:Sprite = arrGridSpr[cnt];
                    cnt++;   
					sp.graphics.lineStyle(.1, 0xFFFFFF, 0.4);
					if(i%2 != 0) { // 가로행에서 홀수 
						if(j%2!=0) {// 세로열에서 홀수 
							pixelColor = 0xFF0000;
						} else {
							pixelColor = 0xFFFFFF;
						}
					} else {
						if(j%2==0) {// 세로열에서 짝수 
							pixelColor = 0xFF0000;
						} else {
							pixelColor = 0xFFFFFF;
						}							
					}
					sp.graphics.beginFill(pixelColor, (i*0.025 + j*0.025));
					sp.graphics.drawRect(5, 5, recSize, recSize);
				    sp.x = posX;
				    sp.y = posY;
				    posY += recSize;
				}
				posX += recSize;
				posY = 0;
			}
		}
	}
}