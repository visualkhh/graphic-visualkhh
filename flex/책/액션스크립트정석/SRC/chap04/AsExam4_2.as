package
{
	import flash.display.Shape;
	import flash.display.Sprite;
    [SWF(backgroundColor=0x000000)]
	public class AsExam4_2 extends Sprite
	{
		// 전체 건수
		private var total_records:uint = 100;
		// 페이지당 보여줄 건수
		private var num_of_row_per_page:uint= 10;
		// 페이지 인덱스 갯수
		private var num_of_index_per_page:uint=0;
		// Shape 객체를 담을 배열
		private var arr:Array = new Array();
		public function AsExam4_2()
		{
			displayMain();
			calculatePage();
			layoutPage();
		}
		// 화면에 Shape 추가
		private function displayMain():void
		{
			for(var idx:int=0; idx<total_records; idx++)
			{
				var sh:Shape = new Shape();
				sh.graphics.beginFill(Math.random()*0x1000000);
				sh.graphics.drawRect(0, 0, 50, 50);
				this.addChild(sh);
				arr.push(sh);
			}
		}
		// Paging 계산
		private function calculatePage():void
		{
			if(total_records%num_of_row_per_page>0)
			{
			    num_of_index_per_page = total_records/num_of_row_per_page+1;
			} 
			else
			{
			    num_of_index_per_page = total_records/num_of_row_per_page;
			}
			trace('num_of_index_per_page:'+ num_of_index_per_page); 
		}
		
		// 계산된 페이지 정보에 따라 레이아웃 
		private function layoutPage():void
		{
			for(var idx:int=0; idx<arr.length; idx++)
            {
                var sh:Shape = arr[idx];
                sh.x = (idx % num_of_row_per_page) * 50;
                sh.y = int(idx / num_of_row_per_page) * 50;
                sh.z = int(idx / num_of_row_per_page) * 100;
                sh.rotationY = -45;
            }
		}
	}
}