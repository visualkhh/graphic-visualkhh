package
{
    import __AS3__.vec.Vector;
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.Sprite;
    import flash.events.Event;
    [SWF(backgroundColor=0xffffff)]
    public class AsExam11_42 extends Sprite
    {
        private var bitmapData:BitmapData;  
        [Embed(source="assets/jaemin.jpg")]
        public var Photo:Class;          
        // 삼각형 2개를 그리는 데이터와 인덱스, uv데이터 
        private var data:Vector.<Number> = Vector.<Number>([100,0, 200,0, 100,100, 200,100]);
        private var idx:Vector.<int> = Vector.<int>([0, 1, 2, 1, 3, 2]);
        private var uvtData:Vector.<Number> = Vector.<Number>([0,0, 1,0, 0,1, 1,1]);
        
        public function AsExam11_42()
        {
            displayMain();
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        private function displayMain():void
        {
            var photo:Bitmap = new Photo();
            bitmapData = photo.bitmapData;
        }
        // data벡터의 값을 조금씩 변경한 다음 다시 화면을 그린다.
        private function enterFrameHandler(event:Event):void
        {
        	for(var i:int=0; i<data.length; i++)
        	{
        		data[i] += (Math.random()*2-1);
        	}
            triangleBitmapFillUseCase();
        }        
        // 삼각형 두개를 겹쳐서 사각형을 만들고 사진(텍스처)을 입힌다.
        private function triangleBitmapFillUseCase():void
        {
            this.graphics.clear();
            this.graphics.lineStyle(1, 0x0000FF);
            this.graphics.beginBitmapFill(bitmapData);
            this.graphics.drawTriangles(data, idx, uvtData); 
        }
    }
}