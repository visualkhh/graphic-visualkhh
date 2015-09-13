package
{
    import __AS3__.vec.Vector;
    
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.Sprite;
    import flash.events.Event;
        
    [SWF(width=800, height=800, backgroundColor=0xffffff)]
    public class AsExam11_43 extends Sprite
    {
        private var sp:Sprite = new Sprite();
        private var bitmapData:BitmapData; 
        [Embed(source="assets/jaemin.jpg")]
        public var Photo:Class;      
        // 회전 각도를 저장하기 위한 변수
        private var ang:Number = 0;
        private var focalLength:Number = 200;      
        // focalLength값 조절을 위한 숫자 입력기
        private var ns:AsExam8_NumericStepper = new AsExam8_NumericStepper(100, 1000, 50, "focalLength", "ns1", 300);
        
        public function AsExam11_43()
        {
            displayMain();
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        private function displayMain():void
        {
            var photo:Bitmap = new Photo();
            bitmapData = photo.bitmapData;
            sp.x = sp.y = 200;
            this.addChild(sp);
            this.addChild(ns);
        }
        
        private function enterFrameHandler(event:Event):void
        {
            drawSpinningRect(ang+=0.1, 120, 150);
        }
        // 지정된 각도로 Y축 회전 시킨다.
        private function drawSpinningRect(angle:Number, w:Number, h:Number):void
        {
        	// 숫자입력기의 값을 focalLength 변수에 저장한다.
        	focalLength = ns.selectedNumber;
        	// 각도와 width, height 값에 대한 x, z 좌표값 계산 
            var x1:Number = w*Math.cos(angle);
            var x2:Number = -w*Math.cos(angle);
            var x3:Number = w*Math.cos(angle);
            var x4:Number = -w*Math.cos(angle);          
            var z1:Number = w*Math.sin(angle);
            var z2:Number = -w*Math.sin(angle);
            var z3:Number = w*Math.sin(angle);
            var z4:Number = -w*Math.sin(angle);
            // y축 회전이므로 y값은 h값을 사용한다.
            var y1:Number = -h;
            var y2:Number = -h;
            var y3:Number = h;
            var y4:Number = h;
            // z값에 대한 focalLength를 반영한 스케일을 계산
            var t1:Number = focalLength/(focalLength + z1); 
            var t2:Number = focalLength/(focalLength + z2); 
            var t3:Number = focalLength/(focalLength + z3); 
            var t4:Number = focalLength/(focalLength + z4);       
            // 꼭지점 값에 스케일 반영  
            var data:Vector.<Number> = new Vector.<Number>(); 
            data.push(x1*t1, y1*t1, x2*t2, y2*t2, x3*t3, y3*t3, x4*t4, y4*t4); 
            // drawTriangles을 위한 index 벡터 생성
            var idx:Vector.<int> = Vector.<int>([0, 1, 2, 1, 3, 2]);
            // uv 데이터값은 t값을 이용하여 계산한다. 
            var uvtData:Vector.<Number> = new Vector.<Number>(); 
            uvtData.push(0,0, t1, 1,0, t2,  0,1, t3,  1,1, t4); 
            // 화면에 텍스처를 입히고 삼각형을 그린다.
            sp.graphics.clear();
            sp.graphics.lineStyle(2, 0xFF0000);
            sp.graphics.beginBitmapFill(bitmapData);
            sp.graphics.drawTriangles(data, idx, uvtData);    
        }        
    }
}