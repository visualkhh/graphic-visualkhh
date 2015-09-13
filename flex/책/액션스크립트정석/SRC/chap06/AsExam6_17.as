package 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	[SWF(width=800,height=800,backgroundColor=0xFFFFFF)]
	
	public class AsExam6_17 extends Sprite
	{
		public function AsExam6_17() {
			// AsExam6_17에 square_0 추가
			var square_0:AsExam6_17_Rect = new AsExam6_17_Rect(300);
            this.addChild(square_0);
            // square_0에 square_1 추가
            var square_1:AsExam6_17_Rect = new AsExam6_17_Rect(250);
            square_0.addChild(square_1);
            // square_1에 square_2 추가
            var square_2:AsExam6_17_Rect = new AsExam6_17_Rect(200);
            square_1.addChild(square_2);
            // square_2에 square_3 추가
            var square_3:AsExam6_17_Rect = new AsExam6_17_Rect(150);
            square_2.addChild(square_3);
            // square_3에 square_4 추가
            var square_4:AsExam6_17_Rect = new AsExam6_17_Rect(100);
            square_3.addChild(square_4);
            // square_4에 square_5 추가
            var square_5:AsExam6_17_Rect = new AsExam6_17_Rect(50);
            square_4.addChild(square_5);
		}
	}
}

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
class AsExam6_17_Rect extends Sprite 
{
    private var sideLen:int;
    public function AsExam6_17_Rect(pLength:int) 
    {
        this.sideLen = pLength;
        this.x = this.y = 25;
        this.buttonMode = true;
        this.addEventListener(MouseEvent.CLICK, clickHandler);
        draw();
    }
    
    private function draw():void 
    {
        this.graphics.clear();
        this.graphics.lineStyle(.5, 0xFFFFFF, .8);
        this.graphics.beginFill(Math.random() * 0x1000000);
        this.graphics.drawRect(0, 0, sideLen, sideLen);    
    }
    
    private function clickHandler(e:Event):void 
    {
       trace("eventPhase:" + e.eventPhase + " type:" + e.type + " target: " + e.target.name + 
       " currentTarget: " + e.currentTarget.name + " bubbles:" + e.bubbles + " cancelable:" + e.cancelable);
       draw();
    }
}   