package
{
	public class My3DBall extends MyBall
	{
		// 삼각함수를 이용한 3D 회전 변환을 위한 변수로 중심에서의 각 방향별 거리
		public var posX:Number;
		public var posY:Number;
		public var posZ:Number;
		public function My3DBall(r:Number=20, color:uint=0x1BE955, showTail:Boolean=false)
		{
			super(r, color, showTail);
		}
		
	}
}