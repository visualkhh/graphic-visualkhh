package 
{
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import flash.geom.Rectangle;
    import flash.text.TextField;
    // 컬러가 선택되면 colorSelected 이벤트를 디스패치함
    [Event(name="colorSelected", type="flash.events.MouseEvent")]
    public class AsExam8_ColorPanel extends Sprite 
    {
    	// 컬러 패널을 그리기 위한 Sprite
        private var colorPanel:Sprite = new Sprite();
        // 컬러 패널의 각 셀별로 색상을 그려내기 위한 Bitmap
        private var bm:Bitmap;
        // 컬러 그리드의 각 셀의 크기
        private var colorCellSize:Number = 8;
        // 각 그리드 셀의 좌표 계산을 위한 변수  
        private var posX:Number = 0;
        private var posY:Number = 0;
        // 컬러 패널의 크기
        private var panelSize:Number;
        // 선택된 색상값
        public var selectedColor:uint; 
        // 컬러 셀을 보여줄 것인지 설정
        private var drawFlag:Boolean;
        // 라벨을 보여주기 위한 텍스트필드
        private var txtLabel:TextField = new TextField();        
        // 라벨값을 저장하는 변수
        private var cpLabel:String;
        // 컬러 패널의 크기와 셀크기를 입력받는 생성자 함수
        public function AsExam8_ColorPanel(panelSize:Number=10, colorCellSize:Number=8, cpLabel:String='', selectedColor:uint=0xFFFFFF)
        {
            this.panelSize = panelSize;
            this.colorCellSize = colorCellSize;
            this.cpLabel = cpLabel;
            this.addChild(colorPanel);
            this.selectedColor = selectedColor;
            // 컬러 선택기를 그린다.
            drawChooser(selectedColor);
            colorPanel.buttonMode = true;
            // 이벤트 핸들러를 등록한다.
            colorPanel.addEventListener(MouseEvent.CLICK, colorPanelHandler);   
        }
        // 컬러 선택기를 클릭했을 때 실행되는 함수
        private function colorPanelHandler(event:MouseEvent):void
        {
        	// 컬러 그리드가 보이지 않는 상태면 
            if(!drawFlag)
            {
            	// 컬러 그리드를 그린다.
                drawColorGrid();
                drawFlag = true;    
            }
            else
            {
            // 컬러그리드가 보이는 상태면 현재 클릭한 셀의 위치를 파악하여 색상값을 추출한다.
            // 컬러셀의 좌표값과 패널 크기 만큼 빼줘야 셀을 클릭한 위치를 계산할 수 있다.  
                var offsetX:Number = -panelSize - this.x;
                var offsetY:Number = -panelSize - this.y;
                // 선택한 곳의 색상값을 읽어 온다.
                selectedColor = bm.bitmapData.getPixel(event.stageX+offsetX, event.stageY+offsetY);
                trace('0x' + selectedColor.toString(16));
                // 컬러를 선택하면 컬러그리드를 보이지 않게 한다. 
                removeColorGrid();
                drawFlag = false;
                // colorSelected 이벤트를 디스패치함
                event.currentTarget.dispatchEvent(new MouseEvent("colorSelected"));
                // 컬러 선택기를 다시 그린다.
                drawChooser(selectedColor);
            }
        }
        // 컬러 선택기를 지정된 색상과 크기로 그린다.
        private function drawChooser(c:uint):void
        {
            colorPanel.graphics.clear();
            colorPanel.graphics.lineStyle(2, 0xCCCCCC);
            colorPanel.graphics.beginFill(c);
            colorPanel.graphics.drawRect(0, 0, panelSize, panelSize);
            colorPanel.graphics.endFill();

            txtLabel.text = cpLabel;
            txtLabel.height = 20;
            // 라벨을 컬러선택기 크기만큼 이동한다.
            txtLabel.x = panelSize+2;
            txtLabel.y = panelSize/4-5;
            colorPanel.addChild(txtLabel);             
        }
        // 컬러 그리드를 화면에서 제거한다.
        private function removeColorGrid():void
        {
            colorPanel.removeChild(bm);
        }
        // 비트맵을 이용하여 컬러 그리드를 그린다.
        private function drawColorGrid():void 
        {
            // 컬러그리드 크기 만큼 비트맵 데이터를 생성한다.
            var bmd:BitmapData = new BitmapData(colorCellSize*18, colorCellSize*12, false, 0xFFFFFF);
            // 각 셀의 크기 영역을 설정하기 위한 Rectangle 객체
            var rect:Rectangle;
            var cellColor:uint = 0x000000;
            // 세로 12개 셀
            for(var i:Number=0; i<12; i++) 
            {
                // 가로 18개 셀
                for(var j:Number=0; j<18; j++) 
                {
                	// Rectangle 영역을 생성하여 
                    rect =  new Rectangle(posX, posY, colorCellSize, colorCellSize);
                    // 셀의 x 위치 변경
                    posX += colorCellSize;
                    // 셀의 위치에 따라 색상값을 0x330000씩 차이 나도록 한다.
                    if(i<6) 
                    {
                        if(j<6)
                        {
                            cellColor += 0x000000;
                        } 
                        else if(j<12)
                        {
                            cellColor += 0x330000;
                        }
                        else 
                        {
                            cellColor += 0x660000;
                        }
                    }
                    else 
                    {
                        if(j<6)
                        {
                            cellColor += 0x990000;
                        } 
                        else if(j<12)
                        {
                            cellColor += 0xCC0000;
                        }
                        else 
                        {
                            cellColor += 0xFF0000;
                        }
                    }
                    // 가로, 세로 위치에 따라 계산된 각 셀의 컬러 색상값 
                    cellColor+=0x3300*(j%6) + 0x33*(i%6);
                    // 비트맵의 셀 크기만큼 계산된 색상을 채우기 한다.
                    bmd.fillRect(rect, cellColor);
                    // 다시 반복 계산하므로 color값을 초기화 한다.
                    cellColor = 0x000000;
                }
                // 셀의 y 좌표값을 이동한다.
                posY += colorCellSize;
                posX = 0;
            }
            // 색상 채우기가 끝난 비트맵을 추가한다.
            bm = new Bitmap(bmd);
            colorPanel.addChild(bm);
            // 비트맵 위치를 컬러선택기 우측 하단에 오도록 한다.
            bm.x = panelSize;
            bm.y = panelSize;
            // 컬러 그리드 셀 좌표 변수를 초기화 한다.
            posX = posY = 0;
        }
    }
}