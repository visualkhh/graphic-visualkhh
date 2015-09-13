package mycomp
{
    import mx.controls.TextArea;
    import flash.events.KeyboardEvent;
    import flash.events.Event;
        
    public class MyTextArea extends TextArea 
    {
        // Constructor    
        public function MyTextArea() 
        {
            // Call the constructor in the superclass. 
            super();

            // Add event listeners.
            addEventListener("keyDown", myKeyDown);        
            addEventListener("creationComplete", myCreationComplete);        
        }        

        // Define a public property for the minimum font size.
        public var minFontSize:Number = 5;        
        // Define a public property for the maximum font size.
        public var maxFontSize:Number = 15;
        
        // Define private property for the current font size.
        private var currentFontSize:Number;

        // creationComplete event listener for getting default font size.
        private function myCreationComplete(eventObj:Event):void         {            
            // Get current font size.
             currentFontSize = getStyle('fontSize');
        }

        // keyDown event listener.
        private function myKeyDown(eventObj:KeyboardEvent):void         {    
            // Was Ctrl key pressed?
            if (eventObj.ctrlKey) 
            {            
                switch (eventObj.keyCode) {
                    // Was Control-I pressed?    
                       case 73 :
                        if (currentFontSize < maxFontSize) {
                            currentFontSize = currentFontSize + 1;
                            setStyle('fontSize', currentFontSize);
                        } 
                           break;
                    // Was Control-M pressed?    
                       case 77 :
                        if (currentFontSize > minFontSize) {
                            currentFontSize = currentFontSize - 1;
                            setStyle('fontSize', currentFontSize);
                        }
                        break;
                       default :
                          break;
                   }            
            } 
        }
    }
}

