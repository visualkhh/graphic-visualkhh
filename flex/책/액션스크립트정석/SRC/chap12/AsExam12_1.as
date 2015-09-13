package
{
	import flash.display.Sprite;
	import flash.events.ContextMenuEvent;
	import flash.ui.ContextMenu;
	import flash.ui.ContextMenuItem;
    import flash.ui.ContextMenuBuiltInItems;	
    import flash.net.URLRequest;
    import flash.net.navigateToURL;    
    [SWF(backgroundColor = 0xffffff)]
	public class AsExam12_1 extends Sprite
	{
		private var myContextMenu:ContextMenu = new ContextMenu();
		private var sp:Sprite = new Sprite();
		
		public function AsExam12_1()
		{
			displayMain();
			addMenu();
		}
		// sp를 화면에 추가하고 사각형 영역을 그린다. 
		private function displayMain():void
		{
			this.addChild(sp);
			sp.graphics.beginFill(Math.random()*0x1000000);
			sp.graphics.drawRect(100, 100, 100, 100);
		}
        // myContextMenu를 구성하여 sp에 설정함
        private function addMenu():void 
        {
            var item:ContextMenuItem = new ContextMenuItem("OkGosu.Net");
            item.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, okgosuNetHandler);
            var item2:ContextMenuItem = new ContextMenuItem("removeMenu");
            item2.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, removeMenu);            
            myContextMenu.customItems.push(item);
            myContextMenu.customItems.push(item2);
			sp.contextMenu = myContextMenu;
        }
        // removeMenu 항목을 선택하면 확대,품질,인쇄 메뉴 제거된다.
        private function removeMenu(event:ContextMenuEvent):void 
        {
        	trace('remove');
            myContextMenu.hideBuiltInItems();
        }        
        // OkGosu.Net 항목을 선택하면 okgosu.net 사이트로 이동한다. 
        private function okgosuNetHandler(event:ContextMenuEvent):void 
        {
        	trace('event.target.caption', event.target.caption);
            var req:URLRequest = new URLRequest("http://" + event.target.caption);
            navigateToURL(req);            
        } 
	}
}