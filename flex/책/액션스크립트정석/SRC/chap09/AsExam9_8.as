package 
{
    import flash.display.GradientType;
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import flash.geom.ColorTransform;
    import flash.geom.Matrix;	
	
	[SWF(backgroundColor=0xFFFFFF)]
    public class AsExam9_8 extends Sprite 
    {
		private var sp:Sprite = new Sprite(); 
        public function AsExam9_8() 
        {
        	displayMain();
        	addEventHandlers();
        }
        // Sprite를 생성하여 화면에 추가하고 그라데이션이 들어간 원을 그린다.
        private function displayMain():void
        {
            sp.useHandCursor = true;
            sp.buttonMode = true;
            this.addChild(sp);
            drawGradationCircle();
        }
        // 마우스를 클릭하면 색상 변환을
        // 마우스를 움직이면 틴트 변환을 하도록 이벤트 핸들러를 등록한다.
        private function addEventHandlers():void
        {
            sp.addEventListener(MouseEvent.CLICK, clickHandler);
            sp.addEventListener(MouseEvent.MOUSE_MOVE, moveHandler);
        }
        // 원에 무지개빛깔의 원형 그라데이션을 적용한다. 
        public function drawGradationCircle():void 
        {
        	// 그라데이션을 적용하기 위한 Matrix 객체 
			var gradientBoxMatrix:Matrix = new Matrix();
			gradientBoxMatrix.createGradientBox(300, 300, 0, 0, 0);
			// 빨주노초파남보 RGB로 원형 그라데이션 적용            
            sp.graphics.beginGradientFill(GradientType.RADIAL,  
            [0xff0000, 0xffa500, 0xffff00, 0x008000, 0x0000ff, 0x4B0082, 0x800080], 
            [1, 1, 1, 1, 1, 1, 1], 
			[0, 32, 64, 128, 170, 210, 255], gradientBoxMatrix);
            sp.graphics.drawCircle(150, 150, 140);
        }
        // 원을 클릭하면 빨간색과 녹색은 증가하고 파란색은 감소시키는 ColorTransform을 적용한다.
        public function clickHandler(event:MouseEvent):void 
        {
         	var rOffset:Number = transform.colorTransform.redOffset + 25;
         	var gOffset:Number = transform.colorTransform.greenOffset + 25;
            var bOffset:Number = transform.colorTransform.blueOffset - 25;
            // 각 색상채널별로 값이 일정 한도까지만 증가하도록 설정한다.
            if(rOffset > 275) rOffset = 0;
            if(gOffset > 275) gOffset = 0;
            if(bOffset < -275) bOffset = 0;
            // ColorTransform을 적용한다.
            this.transform.colorTransform = new ColorTransform(1, 1, 1, 1, rOffset, gOffset, bOffset, 0);
            trace('rOffset : ' + rOffset);
            trace('bOffset : ' + bOffset); 
        }
        // 원위로 마우스를 움직이면 빨간색과 녹색에 대한 ColorTransform을 적용한다.  
        private function moveHandler(event:MouseEvent):void 
        {
        	// 각 색상채널별로 틴트를 주기 위해 현재 디스플레이 객체의 ColorTransform 값을 읽어온다.
 		    var colorTransformer:ColorTransform = this.transform.colorTransform;
 		    // 빨간색과 녹색에만 ColorTransform을 적용한다.
		    colorTransformer.redMultiplier = (this.stage.mouseX / this.stage.width)*2;
		    colorTransformer.greenMultiplier = (this.stage.mouseY / this.stage.height)*2;
		    this.transform.colorTransform = colorTransformer;
            trace('colorTransformer.redMultiplier  : ' + colorTransformer.redMultiplier );
            trace('colorTransformer.greenMultiplier : ' + colorTransformer.greenMultiplier);
        }
    }
}    