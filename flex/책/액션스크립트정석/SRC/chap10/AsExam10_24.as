package
{
    import flash.display.Sprite;
    import flash.events.Event;
    public class AsExam10_24 extends Sprite
    {
        public function AsExam10_24()
        {
	        var myBall:MyBall = new MyBall();
            this.addChild(myBall);
            // 엔터프레임 이벤트에 myBall의 x좌표를 1씩 증가시킨다.
            stage.addEventListener(Event.ENTER_FRAME, function (event:Event):void {myBall.x += 1;});
        }
    }
}