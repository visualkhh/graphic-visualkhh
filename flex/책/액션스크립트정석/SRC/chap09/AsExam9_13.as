package 
{
    import flash.display.Shape;
    import flash.display.Sprite;
    [SWF(backgroundColor=0xFFFFFF)]
    public class AsExam9_13 extends Sprite 
    {
        // 고리의 갯수 
        private var ringCount:Number = 60;
        // 고리의 크기
        private var ringSize:int=50;
        // 고리를 담기 위한 Sprite
        private var sp:Sprite = new Sprite();
        
        public function AsExam9_13()
        {
           drawEllipses();
        }
        // 고리 갯수 만큼 회전하면서 타원을 그린다.
        private function drawEllipses():void 
        {
            for(var i:uint=0; i<ringCount; i++) 
            {
                var sh:Shape = new Shape();
                sh.graphics.lineStyle(0.5, 0xAAAA00);
                // 타원형이 되도록 가로 세로 비율을 다르게 한다. 
                sh.graphics.drawEllipse(0, 0, ringSize, ringSize*1.5);
                // 디스플레이오브젝트를 회전한다.
                sh.rotation =  360/ringCount*i;
                sp.addChild(sh);  
            }
            // 화면에 잘보이도록 위치를 이동한다.
            sp.x = sp.y = 100;
            this.addChild(sp);
        }
    }
}