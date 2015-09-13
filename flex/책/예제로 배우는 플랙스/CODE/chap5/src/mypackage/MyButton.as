package mypackage {
	import mx.controls.Button;
	public class MyButton extends Button { // Button 클래스를 확장
		public function MyButton()	{
			super();
			init();
		}
		private function init():void {
			this.label = "MyButton";
			this.width = 200;
			this.height = 100;
		}		
	}
}
