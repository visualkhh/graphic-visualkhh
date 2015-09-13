// ActionScript file
import flash.system.Capabilities;

import flexmdi.effects.*;
import flexmdi.effects.effectsLib.*;

import mx.collections.XMLListCollection;
import mx.controls.Alert;
import mx.events.ResourceEvent;
import mx.rpc.events.ResultEvent;

//[Bindable]
//private var locales:Array = [ "ko_KR","en_US", "ar_SA" ];

private function initApp():void {
	var resourceModuleURL:String;;
	if(Capabilities.language == "ko") {
    	localeComboBox.selectedIndex = 0;     
		resourceModuleURL = "rsb/ko_KR_ResourceModule.swf";
		hs.url = "rsb/ko_KR_menu.xml";
	} else {
		localeComboBox.selectedIndex = 1;
		resourceModuleURL = "rsb/en_US_ResourceModule.swf";
		hs.url = "rsb/en_US_menu.xml";
	}
    var eventDispatcher:IEventDispatcher = resourceManager.loadResourceModule(resourceModuleURL);
    eventDispatcher.addEventListener(ResourceEvent.COMPLETE, completeHandler);      
    
    hs.send();  
}

private function registrationComplete():void {
    Alert.show(resourceManager.getString('okgosu', 'cellRSB'));
}  

private function comboChangeHandler(evt:Event):void {
    var newLocale:String = evt.target.selectedItem.data;// String(localeComboBox.selectedItem);
    var param:String = String(Math.random());
    hs.url = "rsb/" + newLocale + "_menu.xml?q=" + param;
    if (resourceManager.getLocales().indexOf(newLocale) != -1) {
        completeHandler(null);
    } else {
        var resourceModuleURL:String = "rsb/" + newLocale + "_ResourceModule.swf";
        var eventDispatcher:IEventDispatcher = resourceManager.loadResourceModule(resourceModuleURL);
        eventDispatcher.addEventListener(ResourceEvent.COMPLETE, completeHandler);
    }         
    fontFamilyCombo.selectedIndex =   evt.target.selectedIndex; 
    hs.send();
}

private function resultHD(event:ResultEvent):void {
	menubar.dataProvider = event.result;
}
private function completeHandler(event:ResourceEvent):void {
    resourceManager.localeChain = [ localeComboBox.selectedItem.data];
} 

private function changeAlign(evt:Event):void {
	if(evt.target.selectedItem.data == "c") {
		mdiCanvas.windowManager.cascade();
	} else if(evt.target.selectedItem.data == "t") {
		mdiCanvas.windowManager.tile(false, 10);
	} else if(evt.target.selectedItem.data == "f") {
		mdiCanvas.windowManager.tile(true, 10);
	}
}
private function addWindow():void
{
	var win:MDIWindow = new MDIWindow();
	win.width = 350;
	win.title = resourceManager.getString('okgosu','localeTitleRSB') + String(mdiCanvas.windowManager.windowList.length + 1);
	mdiCanvas.windowManager.add(win);
}	
