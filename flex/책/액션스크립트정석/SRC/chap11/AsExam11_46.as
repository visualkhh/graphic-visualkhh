package
{
    import __AS3__.vec.Vector;
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.Sprite;
    import flash.display.TriangleCulling;
    import flash.events.Event;
    import flash.events.MouseEvent;
    [SWF(width=800, height=800, backgroundColor=0xffffff)]
    public class AsExam11_46 extends Sprite
    {
        // drawTriangles에서 사용할 데이터, 인덱스, uv 데이터 벡터 선언
        private var data:Vector.<Number> = new Vector.<Number>();
        private var idx:Vector.<int> = new Vector.<int>();
        private var uvData:Vector.<Number> = new Vector.<Number>();
        private var fl:Number = 500;
        private var centerZ:Number = 10;        
        private var sp:Sprite = new Sprite();
        private var bitmapData:BitmapData; // texture 
        [Embed(source="assets/candy.jpg")]
        public var Photo:Class;  
        // 3D 그래픽 회전 속도 
        private var offset:Number=0;        
        // 벡페이스 컬링 
        private var cullingNum:int;
        public function AsExam11_46()
        {
            displayMain();
            stage.addEventListener(MouseEvent.CLICK, clickHandler);
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        private function displayMain():void
        {           
            this.addChild(sp);
            sp.x = sp.y = 300;
            var photo:Bitmap = new Photo();
            bitmapData = photo.bitmapData;                 
        }
        // 화면을 클릭하면 cullingNum이 0, 1, 2의 값을 차례대로 가지도록 한다.
        private function clickHandler(event:MouseEvent):void
        {
        	cullingNum++;
        	if(cullingNum > 2) cullingNum = 0;
        }
        
        // 원기둥이 회전되도록 한다.
        private function enterFrameHandler(event:Event):void
        {
            offset += 0.05;
            // 그리드의 열, 행, 반지름, 내부원간의 거리
            drawTrainglesCircle(30, 3, 100, 100);
        }        
        
        private function drawTrainglesCircle(cols:int, rows:int, size:Number, radius:Number):void
        {
            // 벡터 데이터를 초기화 한다
            data.length = 0;
            uvData.length = 0;          
            idx.length = 0;        	
            var angle:Number = 0;
            var posX:Number = 0;
            var posY:Number = 0;
            var posZ:Number = 0;
            var p1:Number = 0;
            var p2:Number = 0;
            for(var i:int=0; i<=rows; i++)
            {
                for(var j:int=0; j<=cols; j++)
                {
                	// 원기둥 모양이 되도록 posX, poZ에 대해 삼각함수값 계산
                    angle = Math.PI * 2 / cols *j + offset;
                    posX = radius * Math.cos(angle);
                    posZ = radius * Math.sin(angle);
                    posY = (i - rows/2) * size;
                    var scale:Number = fl/(fl+posZ+centerZ);
                    data.push(posX*scale, posY*scale);
                    uvData.push(j/cols, i/rows);
                    if(i<rows && j<cols)
                    {
                        p1 = (cols+1)*i + j;
                        p2 = (cols+1)*(i+1) + j;                         
                        idx.push(p1,   p1+1, p2);  
                        idx.push(p1+1, p2+1, p2);   
                    }
                }
            }
            sp.graphics.clear();
            sp.graphics.beginBitmapFill(bitmapData);      
            switch(cullingNum)
            {
            	case 0: // TriangleCulling.NONE;
	                sp.graphics.drawTriangles(data, idx, uvData);                     
            	   break;
            	case 1: 
            	   sp.graphics.drawTriangles(data, idx, uvData, TriangleCulling.NEGATIVE);
            	   break;
            	case 2:
            	   sp.graphics.drawTriangles(data, idx, uvData, TriangleCulling.POSITIVE);
            	   break;
            }
        }
    }
}