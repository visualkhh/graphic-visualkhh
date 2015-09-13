
/**
 * Service.as
 * This file was auto-generated from WSDL by the Apache Axis2 generator modified by Adobe
 * Any change made to this file will be overwritten when the code is re-generated.
 */
package com.cdyne{
	import mx.rpc.AsyncToken;
	import flash.utils.ByteArray;
	import mx.rpc.soap.types.*;
               
    public interface IEmailVerNoTestEmail
    {
    	//Stub functions for the VerifyEmail operation
    	/**
    	 * Call the operation on the server passing in the arguments defined in the WSDL file
    	 * @param email
    	 * @param LicenseKey
    	 * @return An AsyncToken
    	 */
    	function verifyEmail(email:String,licenseKey:String):AsyncToken;
        /**
         * Method to call the operation on the server without passing the arguments inline.
         * You must however set the _request property for the operation before calling this method
         * Should use it in MXML context mostly
         * @return An AsyncToken
         */
        function verifyEmail_send():AsyncToken;
        
        /**
         * The verifyEmail operation lastResult property
         */
        function get verifyEmail_lastResult():ReturnIndicator;
		/**
		 * @private
		 */
        function set verifyEmail_lastResult(lastResult:ReturnIndicator):void;
       /**
        * Add a listener for the verifyEmail operation successful result event
        * @param The listener function
        */
       function addverifyEmailEventListener(listener:Function):void;
       
       
        /**
         * The verifyEmail operation request wrapper
         */
        function get verifyEmail_request_var():VerifyEmail_request;
        
        /**
         * @private
         */
        function set verifyEmail_request_var(request:VerifyEmail_request):void;
                   
        /**
         * Get access to the underlying web service that the stub uses to communicate with the server
         * @return The base service that the facade implements
         */
        function getWebService():BaseEmailVerNoTestEmail;
	}
}