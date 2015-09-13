package
{
	import flash.display.Sprite;
    import flash.net.SharedObject;	

	public class AsExam12_18 extends Sprite
	{
		
		public function AsExam12_18()
		{
			readLSO();
		}

        private function readLSO():void
        {
            var so:SharedObject = SharedObject.getLocal("mySO", "/");
			for (var i:String in so.data) 
			{ 
			    trace(i + ":" + so.data[i]); 
			}            
            trace("mySO SharedObject size is " + so.size + " bytes."); 
        }
        		
	}
}