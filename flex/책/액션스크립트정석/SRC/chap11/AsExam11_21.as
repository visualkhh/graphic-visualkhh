package
{
    import flash.display.Bitmap;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.geom.Matrix3D;
    import flash.geom.Point;
    import flash.geom.Vector3D;

    [SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
    public class AsExam11_21 extends Sprite
    {
        private var inc:Number = 0;
        private var sp:Sprite = new Sprite();
        // 마스크
        private var maskSp:Sprite = new Sprite();
        private var mt3:Matrix3D = new Matrix3D();   
        [Embed(source="assets/jaemin.jpg")]
        public var Photo:Class;   
        private var flagMask:Boolean=true;
        public function AsExam11_21()
        {
        	displayMain();
        	addMask();
        	addEventHandlers();
        }
        // 이미지를 화면에 추가함
        private function displayMain():void
        {
            this.addChild(sp);
            var photo:Bitmap = new Photo();
            sp.addChild(photo);  
            // 회전을 위한 중심 좌표로 이동       
            photo.x = -photo.width/2;
            photo.y = -photo.height/2;
        }
        // 이미지에 마스크 추가
        private function addMask():void
        {            
            maskSp.graphics.lineStyle(4, 0xFFFF00);
            // 알파값은 0.5지만 비트맵캐시가 true가 아니므로 마스크에는 반영 안됨
            maskSp.graphics.beginFill(0xffffff, 0.5);
            maskSp.graphics.drawCircle(0, 0, 100);
            sp.addChild(maskSp);
        }
        
        private function addEventHandlers():void
        {
            stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
            stage.addEventListener(MouseEvent.CLICK, clickHandler);
        }
        // 화면을 클릭하면 마스크 활성화 여부가 바뀜
        private function clickHandler(event:MouseEvent):void
        {
          if(flagMask) 
          {
            sp.mask = maskSp;
          } 
          else 
          {
            sp.mask = null;
          }
          flagMask = !flagMask;
        }
        
        private function enterFrameHandler(event:Event):void
        {
        	// 이미지를 X, Y축 회전, 이동 변환함
            var posX:Number = (mouseX - sp.x) * 0.01;
            var posY:Number = (mouseY - sp.y) * 0.01;
            var posZ:Number = Math.sin(inc += 0.01)*1;
            mt3.appendRotation(0.5, Vector3D.X_AXIS);
            mt3.appendRotation(0.5, Vector3D.Y_AXIS);
            mt3.appendTranslation(posX, posY, posZ);
            sp.transform.matrix3D = mt3;         
            // 2D 좌표를 3D 좌표로 변환            
            var vec:Vector3D = sp.globalToLocal3D(new Point(mouseX, mouseY));
            maskSp.x = vec.x;
            maskSp.y = vec.y;
        }
    }
}