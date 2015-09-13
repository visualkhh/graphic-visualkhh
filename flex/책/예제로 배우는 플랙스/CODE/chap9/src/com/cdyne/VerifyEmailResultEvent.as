/**
 * VerifyEmailResultEvent.as
 * This file was auto-generated from WSDL
 * Any change made to this file will be overwritten when the code is re-generated.
*/
package com.cdyne
{
    import mx.utils.ObjectProxy;
    import flash.events.Event;
    import flash.utils.ByteArray;
    import mx.rpc.soap.types.*;
    /**
     * Typed event handler for the result of the operation
     */
    
    public class VerifyEmailResultEvent extends Event
    {
        /**
         * The event type value
         */
        public static var VerifyEmail_RESULT:String="VerifyEmail_result";
        /**
         * Constructor for the new event type
         */
        public function VerifyEmailResultEvent()
        {
            super(VerifyEmail_RESULT,false,false);
        }
        
        private var _headers:Object;
        private var _result:ReturnIndicator;
         public function get result():ReturnIndicator
        {
            return _result;
        }
        
        public function set result(value:ReturnIndicator):void
        {
            _result = value;
        }

        public function get headers():Object
	    {
            return _headers;
	    }
			
	    public function set headers(value:Object):void
	    {
            _headers = value;
	    }
    }
}