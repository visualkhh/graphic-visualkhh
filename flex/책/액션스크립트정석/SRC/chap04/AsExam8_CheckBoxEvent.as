package {
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class AsExam8_CheckBoxEvent extends MouseEvent {
		public var checkboxEnabled:Boolean;
		public function AsExam8_CheckBoxEvent(type:String, checkboxEnabled:Boolean) {
			super(type);
			this.checkboxEnabled = checkboxEnabled;
		}
        override public function clone():Event {
            return new AsExam8_CheckBoxEvent(type, checkboxEnabled);
        }
	}
}