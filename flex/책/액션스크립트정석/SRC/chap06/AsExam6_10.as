package 
{
	import flash.display.Sprite;
	public class AsExam6_10 extends Sprite 
	{
		public function AsExam6_10() 
		{
			try 
			{
				throw new AsExam6_10_Error('okgosu.tistory.com error');
			} 
		    catch (err:AsExam6_10_Error) 
		    {
				trace('OkGosuError message: ' + err.message);
			} 
			catch (err:Error) 
			{
				trace('Error message: ' + err.message);
			} 
			finally 
			{
				trace('This finally block is always executed.');
			}
		}
	}
}
