package 
{
	import flash.events.Event;
	import flash.events.MouseEvent;
    // 마우스 이벤트를 확장한 사용자 정의 이벤트 클래스
	public class GosuEvent extends MouseEvent 
	{
		// 선택한 값을 저장하기 위한 변수
		public var hand:String;
		// hand값을 같이 입력받는다.
		public function GosuEvent(type:String, hand:String) 
		{
			super(type);
			// hand값을 클래스 변수에 저장함
			this.hand = hand; 
		}
		// 마우스 이벤트가 발생하면 GosuEvent객체로 만들어서 리턴함
        override public function clone():Event 
        {
            return new GosuEvent(type, hand);
        }
	}
}