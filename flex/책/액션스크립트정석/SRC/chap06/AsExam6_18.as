package 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	[SWF(width=800,height=600,backgroundColor=0xFFFFFF)]
	
	public class AsExam6_18 extends Sprite 
	{
		public function AsExam6_18() 
		{
			drawRects();
		}

		private function drawRects():void 
		{
			var temp:Sprite = null;
			for(var i:uint=0; i<10; i++) 
			{
				var sp:AsExam6_18_Rect = new AsExam6_18_Rect(200);
				// 5번째 사각형에서 blockEvent를 true로 설정한다.
				if(i==5) sp.blockEvent = true;
				if(temp == null) 
				{
					this.addChild(sp);	
				} else {
					temp.addChild(sp);					
				}
				temp = sp;
			}			
		}
	}
}
import flash.display.GradientType;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.geom.Matrix;   

class AsExam6_18_Rect extends Sprite 
{
    private var sideLen:int;
    public var blockEvent:Boolean;
    private var colorFlag:Boolean = false;

    public function AsExam6_18_Rect(pLength:int, blockEvent:Boolean=false) 
    {
        this.sideLen = pLength;
        this.blockEvent = blockEvent;
        this.x = this.y = 10;
        this.buttonMode = true;
        // 클릭 이벤트 핸들러에 대해 이벤트 핸들러 함수를 2개 등록한다.
        this.addEventListener(MouseEvent.CLICK, clickHandler1);
        this.addEventListener(MouseEvent.CLICK, clickHandler2);
        drawRainbow();
    }
    // 무지개빛 그라데이션으로 사각형을 그린다.
    private function drawRainbow():void 
    {
        this.graphics.clear();
        this.graphics.lineStyle(.5, 0xFFFFFF, .8);
        var gradientBoxMatrix:Matrix = new Matrix();
        gradientBoxMatrix.createGradientBox(150, 0, 0, 25, 0);
        var colorSet:Array = null;
        if(colorFlag) {
            colorSet = [0x800080, 0x4B0082, 0x0000ff, 0x008000, 0xffff00, 0xffa500, 0xff0000];
            colorFlag = false;
        } else {
            colorSet = [0xff0000, 0xffa500, 0xffff00, 0x008000, 0x0000ff, 0x4B0082, 0x800080];
            colorFlag = true;
        }               
        this.graphics.beginGradientFill(GradientType.LINEAR, 
           colorSet, 
           [1, 1, 1, 1, 1, 1, 1], 
           [0, 32, 64, 128, 170, 210, 255], 
        gradientBoxMatrix);
        this.graphics.drawRect(0, 0, sideLen, sideLen); 
        this.graphics.endFill();
    }       
    
    private function clickHandler1(e:Event):void 
    {
        trace(e.currentTarget.name + ' clickHandler1 was called');
        // blockEvent가 true면 이벤트 전파를 막는다 
        if(blockEvent) 
        {
            e.stopPropagation();
            //e.stopImmediatePropagation();
        }               
    }
    
    private function clickHandler2(e:Event):void 
    {
        trace(e.currentTarget.name + ' clickHandler2 was called');
        drawRainbow();
    }
}   