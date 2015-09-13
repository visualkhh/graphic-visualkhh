package 
{
	import flash.display.Sprite;
	public class AsExam6_9 extends Sprite 
	{
		public function AsExam6_9() 
		{
			try 
			{
				// 에러가 예상 되거나 에러를 발생시키는 코드 
				throw new Error('okgosu.tistory.com error');
			} 
			catch (err:Error) 
			{
				// catch (  )에 명시한 에러가 발생했을 때 실행할 문장 
				trace('Error message: ' + err.message);
			} 
			finally 
			{
				// 에러 발생 여부와 상관없이 무조건 실행할 문장 
				trace('This finally block is always executed.');
			}
		}
	}
}