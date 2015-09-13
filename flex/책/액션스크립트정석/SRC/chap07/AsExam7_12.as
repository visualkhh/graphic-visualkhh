package
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFormat;	
    [SWF(backgroundColor = 0xFFFFFF)]
	public class AsExam7_12 extends Sprite
	{
		// 로드된 비율을 보여주기 위한 텍스트필드
		private var loadProgressTF:TextField = new TextField();
		// 이미지를 로딩하는 로더
		private var loader:Loader = new Loader();
		public function AsExam7_12()
		{
			displayMain();
            loadImage();
		}
        // 로드 비율을 보여주는 텍스트필드 포맷 및 화면에 추가
        private function displayMain():void
        {
            var text_format:TextFormat=new TextFormat("Arial", 13, 0xFFFFFF);
            loadProgressTF.defaultTextFormat = text_format;
            this.addChild(loadProgressTF);
            loadProgressTF.x = 140;
            loadProgressTF.y = 10;
        }
        // Loader를 이용하여 이미지 로드 & 이벤트 핸들러 추가
		private function loadImage():void
		{
		    var request:URLRequest = new URLRequest("http://okgosu.net/baby/okjaemin3.jpg");
		    loader.contentLoaderInfo.addEventListener(Event.COMPLETE, completeEventHandler);
            // 작업 진행현황을 보여주기 위해 ProgressEvent 핸들러 추가
            loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, progressEventHandler);
            loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioerrorEventHandler);
		    loader.load(request);
		}
		// 로드가 완료되면 loader를 화면에 추가한다.
		private function completeEventHandler(event:Event):void 
		{
		    addChild(loader);
			loader.y = 40;
			// 이미지가 매우커서 스케일을 축소함
			// 다른 서버에서 이미지를 받을 경우 그 서버의 cross-domain.xml이 적용이 되어있어야 사용가능함
			loader.scaleX = loader.scaleY = 0.2;
		    trace('load 완료');
		}

        private function ioerrorEventHandler(event:IOErrorEvent):void
        {
            trace('IO Error', event.text);
            loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, progressEventHandler); 
            loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, completeEventHandler);
        }        
        // 로드되는 동안 실행되는 이벤트 핸들러 함수
        private function progressEventHandler(event:ProgressEvent):void
        {
        	// 로드된 비율을 계산한다.
            var loadedPct:uint = Math.round(100 * (event.bytesLoaded / event.bytesTotal)); 
            // 로드된 비율만큼 막대그래프를 그려준다.
            drawProgress(loadedPct);           
            loadProgressTF.text = '' + loadedPct + '%';
            trace('loadedPct', loadedPct);
        }       
        // 로드 비율을 그려준다.
        private function drawProgress(cursor:Number):void
        {
            var barWidth:Number = 300;
            var barHeight:Number = 20;
            this.graphics.clear();
            this.graphics.lineStyle(1, 0xFF0000);
            this.graphics.beginFill(0xFFFFFF);
            // 100% 크기의 사각형
            this.graphics.drawRect(10, 10, barWidth, barHeight);            
            this.graphics.beginFill(0x0000FF);
            // 로드된 비율의 사각형
            this.graphics.drawRect(10, 10, barWidth*cursor/100, barHeight);
            // 로드가 완료되면 더이상 이 함수가 실행되지 않도록 progressEventHandler를 제거함
            if(cursor== 100) stage.removeEventListener(ProgressEvent.PROGRESS, progressEventHandler);
        }    
	}
}