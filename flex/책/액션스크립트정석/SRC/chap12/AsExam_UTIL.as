package
{
	public class AsExam_UTIL
	{
		public function AsExam_UTIL()
		{
		}

        // 밀리세컨드를 시분초 단위로 변환
        public static function getTimeFormat(input:Number):String
        {
            var tempRes:Number = input; 
            var res:String = '';
            var s:int = 1000;
            var m:int = 60 * s;
            var h:int = 60 * m;
            var hStr:String = '';
            var mStr:String = '';
            var sStr:String = '';
            if(input >= h) // 시간 단위 까지 표시  
            {
               hStr = '' + int(input/h) + ':';
               tempRes = input % h;     
            } 
            if(input >= m) // 분단위 계산
            {
                mStr = '' + int(tempRes/m) + ':';
                tempRes = tempRes % m;
            } 
            sStr = '' + int(tempRes/s);
            res = hStr + mStr + sStr;
            return res;
        }
        // 숫자 포매팅 함수
        public static function getNumberFormat(input:Number):String
        {
            var arr:Array = input.toString().split('.'); // 입력 받은 숫자를 '.' 표로 나누어 배열에 담는다.
            var frontNumArr:Array = new Array();
            var idx:int = 0;
            // 정수부분을 뒤집어서 3번째 마다 쉼표 추가
            for(var i:int=arr[0].length-1; i>= 0; i--) 
            {
                frontNumArr.push(arr[0].charAt(i));
                if(idx > 0 && (idx +1)% 3==0) 
                {
                    if(idx < arr[0].length-1) 
                    {
                       frontNumArr.push(",");
                    }
                }
                idx++;
            }
            // 배열을 뒤집는다
            frontNumArr = frontNumArr.reverse();
            // 뒤집은 배열을 한자씩 붙여서 하나의 문자열로 만든다
            var res:String = '';
            for(var j:int=0; j<frontNumArr.length; j++)
            {
                res+= frontNumArr[j];
            }
            if(arr.length > 1) // 소수부가 있으면 붙여 준다  
            {
                res += "." + arr[1];
            }
            return res;     
        }     
        // 밀리세컨드를 시분초(00:00:00) 단위로 변환
        public static function getTimeFormat00(input:Number):String
        {
            var tempRes:Number = input;
            var res:String = '';
            var s:int = 1;
            var m:int = 60 * s;
            var h:int = 60 * m;
            var hStr:String = '';
            var mStr:String = '';
            var sStr:String = '';
            if(input >= h) // 시간 단위 까지 표시  
            {
               var tempH:int = int(input/h);
               hStr = getInt00Str(tempH) + ':';
               tempRes = input % h;     
            } 
            else
            {
               hStr = '00:';
            }
            if(input >= m) // 분단위 계산
            {
               var tempM:int =  int(tempRes/m);
               mStr = getInt00Str(tempM) + ':';
               tempRes = tempRes % m;
            } 
            else
            {
                mStr = '00:';
            }
            sStr = '' + getInt00Str(int(tempRes/s));
            res = hStr + mStr + sStr;
            return res;
        }        
        
        private static function getInt00Str(input:int):String
        {
            var res:String = '' + input;
            if(input < 10)
            {
                res = '0' + input;
            }
            return res; 
        }         

	}
}