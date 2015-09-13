package
{
    import flash.display.Sprite;
    import flash.events.Event;
    public class AsExam10_27 extends Sprite
    {
        public function AsExam10_27()
        {
            var myBall:MyBall = new MyBall();
            this.addChild(myBall);
            myBall.y = 300; // 화면에 보이도록 위치 이동
            // 엔터프레임 이벤트에 myBall의 x, y좌표를 1씩 감소시킨다.
            stage.addEventListener(Event.ENTER_FRAME, function (event:Event):void {myBall.x += 1; myBall.y -= 1;});
        }
    }
}