package
{
	import flash.display.Sprite;
	import flash.media.Camera;
	import flash.media.Video;

	public class AsExam12_4 extends Sprite
	{
		public function AsExam12_4()
		{
			var video:Video = new Video();
			var cam:Camera = Camera.getCamera(); 
		    video.attachCamera(cam); 
		    this.addChild(video); 
		}
	}
}