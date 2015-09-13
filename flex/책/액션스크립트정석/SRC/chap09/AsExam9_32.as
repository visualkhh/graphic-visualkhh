package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
    [SWF(backgroundColor=0xFFFFFF)]
	public class AsExam9_32 extends Sprite
	{
		// paletteMap을 적용하기 위한 비트맵
		private var bm:Bitmap;
		// RGB 기본 채널별 256단계 데이터 생성 (색상 팔레트)
        private var rArray:Array = new Array(256);
        private var gArray:Array = new Array(256);
        private var bArray:Array = new Array(256);
        // paletteMap 작동 변경을 위한 라디오 버튼 컨트롤
        private var radio1:AsExam8_RadioButton = new AsExam8_RadioButton("비트맵생성", "radio1");
        private var radio2:AsExam8_RadioButton = new AsExam8_RadioButton("이미지로드", "radio2");
                
		public function AsExam9_32()
		{
			createBitmap();
            displayMain();
            addEventHandlers();
        }
        // 비트맵을 생성한다.
        private function createBitmap():void
        {
        	// 기존의 비트맵이 있을 경우 삭제한다.
            if(bm != null && bm.bitmapData != null) bm.bitmapData.dispose();
            // 150*150의 노란색의 비트맵데이터 생성
            var bmd:BitmapData = new BitmapData(150, 150, false, 0xFFFF00);
            // RED 비트맵 사각형 칠하기
            bmd.fillRect(new Rectangle(  0, 0, 50, 50), 0xFF0000);
            // GREEN 비트맵 사각형 칠하기
            bmd.fillRect(new Rectangle( 50, 0, 50, 50), 0x00FF00);
            // BLUE 비트맵 사각형 칠하기
            bmd.fillRect(new Rectangle(100, 0, 50, 50), 0x0000FF);
            // 비트맵 생성후 화면에 추가
            bm = new Bitmap(bmd);
            this.addChild(bm);          
        }
        // 라디오 버튼을 화면에 추가한다.
		private function displayMain():void
		{
            this.addChild(radio1);
            this.addChild(radio2);
            radio1.x = radio2.x = 150;
            radio2.y = 20;
            radio1.setEnable(true);
		}
        // 화면을 클릭하면 paletteMap 작동이 되도록 클릭 이벤트 핸들러 등록
        // 라디오버튼 이벤트 핸들러 등록
        private function addEventHandlers():void
        {
			stage.addEventListener(MouseEvent.CLICK, clickHandler);			
            radio1.addEventListener("radioChecked", radioCheckedHandler);
            radio2.addEventListener("radioChecked", radioCheckedHandler);
        }
        // 화면을 클릭하면 swapColors() 함수가 실행된다.		
        private function clickHandler(event:MouseEvent):void
        {
        	swapColors();
        }		
        // paletteMap에서 각 색상채널의 배열을 R->G->B로 서로 바꾼다.
        private function swapColors():void
        {
        	// 각 색상 채널별 팔레트 배열 생성 
            for(var i:uint = 0; i < 256; i++) 
            {
                rArray[i] = i << 16;
                gArray[i] = i << 8;
                bArray[i] = i;                          
            }           
            // 배열의 순서를 바꿔서 RED는 GREEN으로, GREEN은 BLUE로, BLUE는 RED로
            // 하단의 노란색 사각형은 RED + GREEN (YELLOW) -> GREEN + BLUE (CYAN) -> BLUE + RED (MAGENTA)로 변환  
            bm.bitmapData.paletteMap(bm.bitmapData, bm.bitmapData.rect, new Point(0, 0), bArray, rArray, gArray);
            // 아래와 같이 하면 원래의 배열이 적용되므로 아무런 변화가 업다.
            //bitmapData.paletteMap(bitmapData, bitmapData.rect, new Point(0, 0), rArray, gArray, bArray);            
        }		
        // radioChecked 이벤트가 발생하면 실행되는 함수 
        private function radioCheckedHandler(event:MouseEvent):void
        {
            var objName:String = event.currentTarget.name;
            // 한쪽이 선택되면 다른 쪽은 선택해제하고 비트맵을 다시 생성하여 화면을 다시 그린다.
            if(objName == 'radio1')
            {
                if(radio1.radioEnabled) radio2.drawUnchecked();
                createBitmap();
            } 
            if(objName == 'radio2')
            {
                if(radio2.radioEnabled)  radio1.drawUnchecked();
                loadBitmapImage();
            }
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
            bm.bitmapData.dispose();
            var loader:Loader = Loader(event.target.loader);
            bm = Bitmap(loader.content);
            this.addChild(bm);
        }                      
	}
}