package
{
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.MouseEvent;
    import flash.geom.Matrix;
    import flash.geom.Rectangle;
    import flash.net.FileReference;
    import flash.utils.ByteArray;
    import mx.graphics.codec.JPEGEncoder;
    import mx.graphics.codec.PNGEncoder;
    [SWF(width=800, height=600, backgroundColor = 0xffffff)]
    public class AsExam12_13 extends Sprite
    {
        private static const DEFAULT_FILE_NAME:String = "okgosu.png";
        private var fr:FileReference;       
        private var btn:AsExam8_SimpleButton = new AsExam8_SimpleButton("SAVE", 40);

        public function AsExam12_13()
        {
            displayMain();
            drawLines();
            btn.addEventListener(MouseEvent.CLICK, clickHandler);  
        }
        
        private function displayMain():void
        {
            btn.x = 180;
            btn.y = 310;
            this.addChild(btn);     
        }
        // 화면에 랜덤한 선을 그린다.
        private function drawLines():void
        {
            for(var i:int=0; i<100; i++)
            {
	            this.graphics.lineStyle(2, Math.random()*0x1000000);
            	this.graphics.lineTo(Math.random()*300,Math.random()*300); 
            }       
        }
        
        private function clickHandler(event:MouseEvent):void
        {
            saveFile();
        }               
        // 화면을 캡쳐하여 파일로 저장
        private function saveFile():void
        {
            fr = new FileReference();
            fr.addEventListener(Event.COMPLETE, completeHandler);
            fr.addEventListener(Event.CANCEL,cancelHandler);
            fr.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
            // 저장할 이미지에 대한 비트맵 데이터 생성
			var bitmapData:BitmapData = new BitmapData(300, 300, true, 0xFFFFFF);
			var drawingRectangle:Rectangle =  new Rectangle(0, 0, 300, 300);
			bitmapData.draw(this, new Matrix(), null, null, drawingRectangle, false);
            // 비트맵 복사본을 화면 우측에 추가
            var bm:Bitmap = new Bitmap(bitmapData);
            this.addChild(bm);
            bm.x = 300;
            // PNG 또는 JPG 로 저장
            //var byteArray:ByteArray = new JPEGEncoder().encode(bitmapData);
            var byteArray:ByteArray = new PNGEncoder().encode(bitmapData);
            fr.save(byteArray, DEFAULT_FILE_NAME);
        }       

        private function completeHandler(e:Event):void
        {
            trace("File Saved");
            fr = null;
        }

        private function cancelHandler(e:Event):void
        {
            trace("File save select canceled.");
            fr = null;
        }

        private function ioErrorHandler(e:IOErrorEvent):void
        {
            trace("Error Saving File : " + e.text);
            fr = null;
        }         
    }
}