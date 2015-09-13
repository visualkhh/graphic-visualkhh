package
{
    import flash.display.Sprite;
    [SWF(width=800, height=600, backgroundColor = 0xffffff)]
    public class AsExam11_1 extends Sprite
    {
        private var sp:Sprite = new Sprite();
        public function AsExam11_1()
        {
            displayMain();
            drawObjects();
        }
        
        private function displayMain():void
        {
            sp.x = stage.stageWidth / 2;
            sp.y = stage.stageHeight / 2;
            this.addChild(sp);
        }
        // 랜덤한 색상의 사각형 10개를 중첩되게 배치함 
        private function drawObjects():void
        {
            for(var i:uint=0; i<10; i++) 
            {
                var item:Sprite = new Sprite();
                item.graphics.beginFill(Math.random()*0x1000000);
                item.graphics.drawRect(-50, -50, 100, 100);
                item.x = i*10;  
                item.y = i*10;
                sp.addChild(item);            
            }              
        }       
    }
}