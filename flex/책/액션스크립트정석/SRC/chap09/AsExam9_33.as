package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	[SWF(backgroundColor=0xFFFFFF)]
	public class AsExam9_33 extends Sprite
	{
		// paletteMap을 적용하기 위한 비트맵
		private var bm:Bitmap;
		// RGB 기본 채널별 256단계 데이터 생성 (색상 팔레트)
        private var rArray:Array = new Array(256);
        private var gArray:Array = new Array(256);
        private var bArray:Array = new Array(256);
        // paletteMap 작동 변경을 위한 라디오 버튼 컨트롤
        private var radio1:AsExam8_RadioButton = new AsExam8_RadioButton("RGB값 스와핑", "radio1");
        private var radio2:AsExam8_RadioButton = new AsExam8_RadioButton("RGB값 뒤집기", "radio2");
        private var radio3:AsExam8_RadioButton = new AsExam8_RadioButton("RGB값 어둡게", "radio3");
        private var radio4:AsExam8_RadioButton = new AsExam8_RadioButton("RGB 색상감소", "radio4");
        
		public function AsExam9_33()
		{
			loadBitmapImage();
            displayMain();
            addEventHandlers();
		}
		// 라디오 버튼을 화면에 추가한다.
		private function displayMain():void
		{
            this.addChild(radio1);
            this.addChild(radio2);
            this.addChild(radio3);
            this.addChild(radio4);
            radio1.x = radio2.x = radio3.x = radio4.x = 150;
            radio2.y = 20;
            radio3.y = 40;          
            radio4.y = 60;          			
            radio1.setEnable(true);            
		}
        // 화면을 클릭하면 paletteMap 작동이 되도록 클릭 이벤트 핸들러 등록
        // 라디오버튼 이벤트 핸들러 등록		
		private function addEventHandlers():void
		{
            stage.addEventListener(MouseEvent.CLICK, clickHandler);     
            radio1.addEventListener("radioChecked", radioCheckedHandler);
            radio2.addEventListener("radioChecked", radioCheckedHandler);                   
            radio3.addEventListener("radioChecked", radioCheckedHandler);
            radio4.addEventListener("radioChecked", radioCheckedHandler);       			
		}
		// 화면을 클릭하면 체크된 라디오버튼에 해당하는 paletteMap 함수가 호출  
        private function clickHandler(event:MouseEvent):void
        {
        	if(radio1.radioEnabled) swapColors();
        	if(radio2.radioEnabled) reverseColors();
        	if(radio3.radioEnabled) darkenColors();
        	if(radio4.radioEnabled) reduceColors();
        }		
        // paletteMap에서 각 색상채널의 배열을 R->G->B로 서로 바꾼다.
        private function swapColors():void
        {
            for(var i:uint = 0; i < 256; i++) 
            {
                rArray[i] = i << 16;
                gArray[i] = i << 8;
                bArray[i] = i;                          
            }           
            bm.bitmapData.paletteMap(bm.bitmapData, bm.bitmapData.rect, new Point(0, 0), bArray, rArray, gArray);
        }		
		// paletteMap에서 각 색상채널의 밝기값을 감소시킨다.
		private var dark:Number=1.0;
        private function darkenColors():void
        {
        	trace('dark', dark);
            for(var i:uint = 0; i < 256; i++) 
            {
                rArray[i] = i*dark << 16;
                gArray[i] = i*dark << 8;
                bArray[i] = i*dark;                      
            }           
            bm.bitmapData.paletteMap(bm.bitmapData, bm.bitmapData.rect, new Point(0, 0), rArray, gArray, bArray);
            // dark 값을 0.01씩 감소한다.
            dark -= 0.01;
            // dark가 0.75에 이르면 화면이 완전히 검게 되므로 dark 값을 초기화하고 비트맵 다시 로드한다.
            if(dark < 0.75) 
            {
            	dark = 1.0;
            	loadBitmapImage();
            } 
        }
        // 비트맵이 사용할 색상수를 줄인다.
        private var colors:int = 64;
        public function reduceColors():void
        {
        	trace('colours', colors);
            var n:Number = 256 / ( colors / 3 );
            for (var i:int = 0; i < 256; i++)
            {
            	var c:Number = Math.floor(i / n) * n;
                rArray[i] = c << 16;
                gArray[i] = c << 8;
                bArray[i] = c;  
            }
            bm.bitmapData.paletteMap(bm.bitmapData, bm.bitmapData.rect, new Point(0, 0), rArray, gArray, bArray);
            // 색상수를 1/2씩 줄여 나간다.
            colors /=2;
            // colors가 0에 이르면 color 값 초기화 및 비트맵 다시 로드
            if(colors == 0) 
            {
            	colors = 64;
                loadBitmapImage();
            }
        }        
        // 배열의 끝부터 값을 채움으로써 각 색상의 밝기를 거꾸로 뒤집는다. 
        // 예) 256번째 값을 1번째로 
        private function reverseColors():void
        {
			for( var i:int = 256; --i>-1;)
			{
				rArray[255-i] = i << 16;
				gArray[255-i] = i << 8;
				bArray[255-i] = i;
			}           
            bm.bitmapData.paletteMap(bm.bitmapData, bm.bitmapData.rect, new Point(0, 0), rArray, gArray, bArray);
        }
        // radioChecked 이벤트가 발생하면 실행되는 함수 
        private function radioCheckedHandler(event:MouseEvent):void
        {
            var objName:String = event.currentTarget.name;
            // 한쪽이 선택되면 다른 쪽은 선택해제한다.
            if(radio1.name != objName)  radio1.drawUnchecked();
            if(radio2.name != objName)  radio2.drawUnchecked();
            if(radio3.name != objName)  radio3.drawUnchecked();
            if(radio4.name != objName)  radio4.drawUnchecked();
        } 
        // Loader에서 png 파일을 로드한다. 
        private function loadBitmapImage():void
        {
            var request:URLRequest = new URLRequest("assets/little-prince.png");
            var loader:Loader = new Loader();
            loader.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
            loader.load(request);
        }
        // 로드가 완료되면 Bitmap으로 화면에 추가한다.
        private function completeHandler(event:Event):void 
        {
            var loader:Loader = Loader(event.target.loader);
            bm = Bitmap(loader.content);
            this.addChild(bm);
        }	
	}
}