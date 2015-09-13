package
{
    import __AS3__.vec.Vector;
    import flash.display.Sprite;
    import flash.display.Bitmap;
    import flash.display.BitmapData;        
    import flash.display.TriangleCulling;
    import flash.events.Event;
    [SWF(width=800, height=800, backgroundColor=0xffffff)]
    public class AsExam11_47 extends Sprite
    {
        private var data:Vector.<Number> = new Vector.<Number>();
        private var idx:Vector.<int> = new Vector.<int>();
        private var uvData:Vector.<Number> = new Vector.<Number>();
        private var fl:Number = 500;
        private var centerZ:Number = 100;
        private var sp:Sprite = new Sprite();
        private var bitmapData:BitmapData; 
        [Embed(source="assets/worldmap.jpg")]
        public var Photo:Class;           
        private var offset:Number=0;       
        
        public function AsExam11_47() 
        {
            displayMain();
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        
        private function displayMain():void
        {
            this.addChild(sp);
            sp.x = sp.y = 300;
            var photo:Bitmap = new Photo();
            bitmapData = photo.bitmapData;            
        }
        // 구가 회전되도록 한다.
        private function enterFrameHandler(event:Event):void
        {
            offset += 0.02;
            drawTrainglesCircle(20, 20, 200);
        }             
        
	private function drawTrainglesCircle(cols:int, rows:int, radius:Number):void
	{
	    // 벡터 데이터를 초기화 한다
	    data.length = 0;
	    uvData.length = 0;          
	    idx.length = 0;         
	    // y축 회전을 위한 각도        	
	    var angle:Number = 0;
	    // x축 회전을 위한 각도
	    var angleX:Number = 0;
	    var posX:Number = 0;
	    var posY:Number = 0;
	    var posZ:Number = 0;
	    var p1:Number = 0;
	    var p2:Number = 0;
	    for(var i:int=0; i<=rows; i++)
	    {
	        for(var j:int=0; j<=cols; j++)
	        {
	        	// cols수에 따라 y축 회전 각도 계산
	            angle = Math.PI * 2 / cols*j + offset ;
	            // rows수에 따라 x축 회전 각도 계산
	            angleX = Math.PI * i / rows - Math.PI/2;
	            // y축 좌표는 angle2에 대한 싸인값만 곱하고 x, z좌표는 코사인값도 같이 곱하여 구면상의 꼭지점 계산
	            posX = radius * Math.cos(angle) * Math.cos(angleX);
	            posY = radius * Math.sin(angleX);
	            posZ = radius * Math.sin(angle) * Math.cos(angleX);
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
	    sp.graphics.lineStyle(1, 0x0000FF);
	    sp.graphics.beginBitmapFill(bitmapData);      
	    sp.graphics.drawTriangles(data, idx, uvData, TriangleCulling.NEGATIVE );                       
	}
    }
}