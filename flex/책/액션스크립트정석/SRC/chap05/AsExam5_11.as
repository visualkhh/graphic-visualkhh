package 
{
	import flash.display.Sprite;
	public class AsExam5_11 extends Sprite 
	{
		public function AsExam5_11()
		{
			trace("최대 공약수: " + calGCD(24, 36));
			trace("최소 공배수: " + calLCM(24, 36));
		}
		// 최대 공약수
		public static function calGCD(value1:int, value2:int):int 
		{
	        if(value2 == 0) 
	        {
               return value1;
	        } else {
               return calGCD(value2, value1%value2);			
	        }
		}
		// 최소 공배수 		
		public static function calLCM(value1:int, value2:int):int 
		{
        	var temp:int = calGCD(value1, value2);
        	return (value1/temp)*value2;
		}		
	}
}
//결과 
//최대 공약수: 12
//최소 공배수: 72