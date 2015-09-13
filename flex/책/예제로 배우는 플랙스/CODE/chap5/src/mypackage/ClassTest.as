package mypackage {
	public class ClassTest	{
		public var instanceVar:String = "instance var"; // 인스턴스 변수 선언 
		public static var staticVar:String = "static var"; // 스태틱 변수 선언 
		public function ClassTest() { }
		public function testMethod():void { // 인스턴스 메서드 선언 
			var localVar:String = "local var"; // 로컬 변수 선언 
			instanceVar = "altered instance var";
		}
		public static function staticTestMethod():void { // 스태틱 메서드 선언 
			staticVar = "altered static var";
		}
	}
}
