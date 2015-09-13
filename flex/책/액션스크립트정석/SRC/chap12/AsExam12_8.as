package
{
    import flash.display.Sprite;
    import flash.media.Microphone;

    public class AsExam12_8 extends Sprite
    {
        public function AsExam12_8()
        {
            useMicrophone();
        }
        private function useMicrophone():void
        {
            var mic:Microphone = Microphone.getMicrophone();
			mic.setLoopBack(true);
			mic.setUseEchoSuppression(true); 
        }
    }
}