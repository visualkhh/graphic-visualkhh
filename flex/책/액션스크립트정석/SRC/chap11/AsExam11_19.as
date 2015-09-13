package
{
    import flash.display.Shape;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.geom.Point;
    import flash.geom.Vector3D;
    [SWF(width=800, height=600, backgroundColor = 0xffffff)]
    public class AsExam11_19 extends Sprite
    {
        private var sp:Sprite = new Sprite();
        private var vec1:Vector3D = new Vector3D(100, 0, 0);
        private var vec2:Vector3D = new Vector3D(0, 100, 0);
        // 외적 계산을 위한 벡터3D 
        private var vec3:Vector3D;      
        private var sh1:Shape = new Shape();
        private var sh2:Shape = new Shape();
        private var sh3:Shape = new Shape();
        
        public function AsExam11_19()
        {
            drawVectorShapes();
            calVector();
            vectorProduct();
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }    
        // 각 벡터에 대한 형태를 Shape로 그려준다.    
        private function drawVectorShapes():void
        {
            sp.addChild(sh1);
            sp.addChild(sh2);
            sp.addChild(sh3);
            sp.z = 0;
            this.addChild(sp);
            sh1.graphics.lineStyle(10, 0xFF0000);
            sh1.graphics.lineTo(vec1.x, vec1.y);
            sh2.graphics.lineStyle(10, 0x00FF00);
            sh2.graphics.lineTo(vec2.x, vec2.y);
        }
        // 벡터간 각도와 거리 계산
        private function calVector():void
        {
            trace("vec1과 vec2사이 각도", Vector3D.angleBetween(vec1, vec2)/Math.PI*180);
            trace("vec1과 vec2사이 거리", Vector3D.distance(vec1, vec2));    
        }
        // 벡터의 외적과 내적
        private function vectorProduct():void
        {
        	// vec1과 vec2사이 외적연산을 통해 vec3 생성
            vec3 = vec1.crossProduct(vec2);  
            // sh3에서 외적 벡터을 화면에 그려줌 
            var p1:Point = sp.local3DToGlobal(vec3);;
            sh3.graphics.lineStyle(10, 0x0000FF);
            sh3.graphics.lineTo(p1.x, p1.y);
            // vec2와 vec3 사이 내적값: 90이므로 0이 출력
            trace("vec2와 vec3사이 내적", vec2.dotProduct(vec3));
        }
        // 마우스를 움직이면 sp가 이징모션으로 따라다님
        private function enterFrameHandler(event:Event):void
        {
            sp.y += (mouseY - sp.y) * 0.1;
            sp.x += (mouseX - sp.x) * 0.1;
        }
    }
}