package
{
    import flash.display.Sprite;
    import flash.events.Event;
    
    [SWF(width=800, height=600, backgroundColor=0xffffff)]
    public class AsExam11_12 extends AsExam11_11
    {
        public function AsExam11_12()
        {
        	super();
        }
        // Y 축 회전 변환
        override protected function rotateFL(angle:Number):void 
        {
            var cos:Number = Math.cos(angle);
            var sin:Number = Math.sin(angle);
            // y축 회전이므로 x, z쪽 거리 계산
            var dx:Number = myBall.posX;
            var dz:Number = myBall.posZ;
            var distX:Number = cos * dx - sin * dz;
            var distZ:Number = cos * dz + sin * dx;
            myBall.posX = distX;
            myBall.posZ = distZ;
            // 회전축 깊이에 따른 스케일값 계산
            centerZ = ns.selectedNumber;            
            var fl:Number = root.transform.perspectiveProjection.focalLength;
            var scale:Number = fl / (fl + centerZ);     
            myBall.scaleX = myBall.scaleY = scale;
            // 좌표는 2D이므로 x, y축 값만 반영함
            myBall.x = centerX + myBall.posX * scale;
            myBall.y = centerY + myBall.posY * scale;    
            super.drawCenterLine();
        }
    }
}