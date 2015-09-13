package
{
    import flash.display.Sprite;

    public class AsExam2_6 extends Sprite
    {
        public function AsExam2_6()
        {
            this.graphics.lineStyle(3, 0xFF0000);
            // 채우기 색상 지정       
            this.graphics.beginFill(0xFFFF00);
            this.graphics.moveTo(100, 100);
            // 꼭지점 (50, 200), (150, 200), (100, 100)인 삼각형 그리기
            this.graphics.lineTo(50, 200);             
            this.graphics.lineTo(150, 200);
            this.graphics.lineTo(100, 100);
        }
    }
}