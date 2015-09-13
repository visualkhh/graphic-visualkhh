package mycomp {
	import flash.events.Event;
	public class MyEvent extends Event {
		public var msg:String;
		public function MyEvent(type:String, msg:String) {
			super(type, false, false);
			this.msg = msg;
		}
	}
}