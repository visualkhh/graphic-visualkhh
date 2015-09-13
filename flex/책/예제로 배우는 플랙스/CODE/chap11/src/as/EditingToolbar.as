/*
Copyright (c) 2007 FlexLib Contributors.  See:
    http://code.google.com/p/flexlib/wiki/ProjectContributors

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/
import mx.formatters.SwitchSymbolFormatter;
import mx.controls.Menu;
import mx.events.MenuEvent;
import mx.controls.Alert;
import Iconassets.*;
import mx.events.ItemClickEvent;
import flash.utils.getTimer;
import flexmdi.events.MDIWindowEvent;
import flexmdi.effects.MDIEffectsDescriptorBase;
import flexmdi.effects.effectsLib.MDILinearEffects;
import flexmdi.effects.effectsLib.MDIVistaEffects;			
import flexmdi.events.MDIManagerEvent;

import mx.controls.Alert;
import mx.controls.TextArea;
import mx.events.CloseEvent;
import mx.events.ListEvent;

[Bindable]	
	private var alignButtonsArray:Array = [ 
		{icon:IconAlignLeft, action:"left", tooltip:"Align Left"},
		{icon:IconAlignCenter, action:"center", tooltip:"Center"},
		{icon:IconAlignRight, action:"right", tooltip:"Align Right"},
		{icon:IconAlignJustify, action:"justify", tooltip:"Justify"}
		];
	[Bindable]
	private var fontFamilyArray:Array = ["굴림체", "_sans","_serif","_typewriter","Arial"
	,"Courier","Courier New","Geneva","Georgia","Helvetica","Times","Verdana" ];
	[Bindable]
	private var fontSizeArray:Array = [8,9,10,11,12,14,16,18,20,22,24,26,28,36,48,72];
	
	//MenuBar
   [Bindable]
   private var myMenuBarXML:XMLList = 
   		<>
				<menuitem label= "Demo">
					<menuitem label= "Copy"/>
					<menuitem label= "Paste"/>
					<menuitem label= "Send"/>
				</menuitem>
				<menuitem label= "View"> 
					<menuitem label= "ToolBars">
						<menuitem label="Formatting" type="Check" toggled="true"/>
					</menuitem>
				</menuitem>
				<menuitem label= "Window"> 
					<menuitem label= "Add"/>
				</menuitem>
			</>;
		private var cssURL:String;
			private function changeStyle(event:ListEvent):void
			{
				switch(ComboBox(event.target).selectedItem.data)
				{
					case 'Default' :
						StyleManager.unloadStyleDeclarations(cssURL, true);
						return;
						break;
					case 'Windows XP' :
						cssURL = "WindowsXP_default.swf";
						break;
					case 'Mac OS9' :
						cssURL = "MacOS9.swf";
						break;
					default:
						break;
				}
				
				StyleManager.loadStyleDeclarations(cssURL);
			}
			
	//Add remove buttons
	[Bindable]
	private var formatingtoolBarXML:XMLList = 
		 	<>
   					<toolBarItem label= "Font" type="Check" toggled="true" />
					<toolBarItem label= "Font Size" type="Check" toggled="true" />
					<toolBarItem label= "Bold" type="Check" toggled="true"/>
					<toolBarItem label= "Italic" type="Check" toggled="true"/>
					<toolBarItem label= "Underline" type="Check" toggled="true"/>
					<toolBarItem label= "Color" type="Check" toggled="true"/>
					<toolBarItem label= "AlignButtons" type="Check" toggled="true"/>
					<toolBarItem label= "Bullets" type="Check" toggled="true"/>
					<toolBarItem label= "Themes" type="Check" toggled="true"/>
			</>;
			
	private function ToggleToolbars(event:MenuEvent):void
	{
		switch (event.label)
		{
		case "Formatting":
		case "포매팅":
		case "تهيئة":
		 	if(event.item.@toggled==true)
			{
				formating.parent.visible = true;
				formating.visible = true;
				formating.includeInLayout = true;
				formating.invalidateDisplayList();
				formating.invalidateSize();
			}
			else
			{
				formating.parent.visible = false;
				formating.visible = false;
				formating.includeInLayout = false;
				formating.invalidateDisplayList();
				formating.invalidateSize();
			}
			break;
		case "Add":
		case "추가":
		case "اضف":
			addWindow();			
		default:
			break;
		}	
	}

	private function ToggleButtonsinToolBar(event:MenuEvent):void
	{
		switch (event.label)
		{
		case "Font":
		 	if(event.item.@toggled == true)
			{
				fontFamilyCombo.visible = true;
				fontFamilyCombo.includeInLayout = true;
			}
			else
			{
				fontFamilyCombo.visible = false;
				fontFamilyCombo.includeInLayout = false;
			}
		break;
		case "Font Size":
		 	if(event.item.@toggled == true)
			{
				fontSizeCombo.visible = true;
				fontSizeCombo.includeInLayout = true;
			}
			else
			{
				fontSizeCombo.visible = false;
				fontSizeCombo.includeInLayout = false;
			}
		break;
		case "Bold":
		 	if(event.item.@toggled == true)
			{
				boldButton.visible = true;
				boldButton.includeInLayout = true;
			}
			else
			{
				boldButton.visible = false;
				boldButton.includeInLayout = false;
			}
		break;
		case "Italic":
		 	if(event.item.@toggled == true)
			{
				italicButton.visible = true;
				italicButton.includeInLayout = true;
			}
		else
			{
				italicButton.visible = false;
				italicButton.includeInLayout = false;
			}
		break;
		case "Underline":
		 	if(event.item.@toggled == true)
			{
				underlineButton.visible = true;
				underlineButton.includeInLayout = true;
			}
			else
			{
				underlineButton.visible = false;
				underlineButton.includeInLayout = false;
			}
		break;
		case "Color":
		 	if(event.item.@toggled == true)
			{
				colorPicker.visible = true;
				colorPicker.includeInLayout = true;
			}
			else
			{
				colorPicker.visible = false;
				colorPicker.includeInLayout = false;
			}
		break;
		case "AlignButtons":
			if(event.item.@toggled == true)
			{
				alignButtons.visible = true;
				alignButtons.includeInLayout = true;
			}
			else
			{
				alignButtons.visible = false;
				alignButtons.includeInLayout = false;
			}
		break;
		case "Bullets":
		 	if(event.item.@toggled == true)
			{
				bulletsButton.visible = true;
				bulletsButton.includeInLayout = true;
			}
			else
			{
				bulletsButton.visible = false;
				bulletsButton.includeInLayout = false;
			}
		break;
		default:
		break;
		}
	}