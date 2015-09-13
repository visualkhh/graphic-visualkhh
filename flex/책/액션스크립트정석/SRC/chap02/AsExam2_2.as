package 
{
    import flash.display.Sprite;
    
    public class AsExam2_2 extends Sprite 
    {
        public function AsExam2_2() 
        {
        	// 원의 테두리선 색상 지정
        	this.graphics.lineStyle(2, 0xFF0000);
            //원의 색상 지정
            this.graphics.beginFill(0xC6DB94);  
            //원그리기 시작 좌표와 반지름 설정
            this.graphics.drawCircle(100, 100, 50);
        }
    }
}