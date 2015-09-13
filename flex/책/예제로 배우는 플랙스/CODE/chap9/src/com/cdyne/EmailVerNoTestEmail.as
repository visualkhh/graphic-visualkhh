
/**
 * EmailVerNoTestEmailService.as
 * This file was auto-generated from WSDL by the Apache Axis2 generator modified by Adobe
 * Any change made to this file will be overwritten when the code is re-generated.
 */
 /**
  * Usage example: to use this service from within your Flex application you have two choices:
  * Use it via Actionscript only
  * Use it via MXML tags
  * Actionscript sample code:
  * Step 1: create an instance of the service; pass it the LCDS destination string if any
  * var myService:EmailVerNoTestEmail= new EmailVerNoTestEmail();
  * Step 2: for the desired operation add a result handler (a function that you have already defined previously)  
  * myService.addVerifyEmailEventListener(myResultHandlingFunction);
  * Step 3: Call the operation as a method on the service. Pass the right values as arguments:
  * myService.VerifyEmail(myemail,myLicenseKey);
  *
  * MXML sample code:
  * First you need to map the package where the files were generated to a namespace, usually on the <mx:Application> tag, 
  * like this: xmlns:srv="com.cdyne.*"
  * Define the service and within its tags set the request wrapper for the desired operation
  * <srv:EmailVerNoTestEmail id="myService">
  *   <srv:VerifyEmail_request_var>
  *		<srv:VerifyEmail_request email=myValue,LicenseKey=myValue/>
  *   </srv:VerifyEmail_request_var>
  * </srv:EmailVerNoTestEmail>
  * Then call the operation for which you have set the request wrapper value above, like this:
  * <mx:Button id="myButton" label="Call operation" click="myService.VerifyEmail_send()" />
  */
 package com.cdyne{
	import mx.rpc.AsyncToken;
	import flash.events.EventDispatcher;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.events.FaultEvent;
	import flash.utils.ByteArray;
	import mx.rpc.soap.types.*;

    /**
     * Dispatches when a call to the operation VerifyEmail completes with success
     * and returns some data
     * @eventType VerifyEmailResultEvent
     */
    [Event(name="VerifyEmail_result", type="com.cdyne.VerifyEmailResultEvent")]
    
	/**
	 * Dispatches when the operation that has been called fails. The fault event is common for all operations
	 * of the WSDL
	 * @eventType mx.rpc.events.FaultEvent
	 */
    [Event(name="fault", type="mx.rpc.events.FaultEvent")]

	public class EmailVerNoTestEmail extends EventDispatcher implements IEmailVerNoTestEmail
	{
    	private var _baseService:BaseEmailVerNoTestEmail;
        
        /**
         * Constructor for the facade; sets the destination and create a baseService instance
         * @param The LCDS destination (if any) associated with the imported WSDL
         */  
        public function EmailVerNoTestEmail(destination:String=null,rootURL:String=null)
        {
        	_baseService = new BaseEmailVerNoTestEmail(destination,rootURL);
        }
        
		//stub functions for the VerifyEmail operation
          

        /**
         * @see IEmailVerNoTestEmail#VerifyEmail()
         */
        public function verifyEmail(email:String,licenseKey:String):AsyncToken
        {
         	var _internal_token:AsyncToken = _baseService.verifyEmail(email,licenseKey);
            _internal_token.addEventListener("result",_VerifyEmail_populate_results);
            _internal_token.addEventListener("fault",throwFault); 
            return _internal_token;
		}
        /**
		 * @see IEmailVerNoTestEmail#VerifyEmail_send()
		 */    
        public function verifyEmail_send():AsyncToken
        {
        	return verifyEmail(_VerifyEmail_request.email,_VerifyEmail_request.LicenseKey);
        }
              
		/**
		 * Internal representation of the request wrapper for the operation
		 * @private
		 */
		private var _VerifyEmail_request:VerifyEmail_request;
		/**
		 * @see IEmailVerNoTestEmail#VerifyEmail_request_var
		 */
		[Bindable]
		public function get verifyEmail_request_var():VerifyEmail_request
		{
			return _VerifyEmail_request;
		}
		
		/**
		 * @private
		 */
		public function set verifyEmail_request_var(request:VerifyEmail_request):void
		{
			_VerifyEmail_request = request;
		}
		
	  		/**
		 * Internal variable to store the operation's lastResult
		 * @private
		 */
        private var _VerifyEmail_lastResult:ReturnIndicator;
		[Bindable]
		/**
		 * @see IEmailVerNoTestEmail#VerifyEmail_lastResult
		 */	  
		public function get verifyEmail_lastResult():ReturnIndicator
		{
			return _VerifyEmail_lastResult;
		}
		/**
		 * @private
		 */
		public function set verifyEmail_lastResult(lastResult:ReturnIndicator):void
		{
			_VerifyEmail_lastResult = lastResult;
		}
		
		/**
		 * @see IEmailVerNoTestEmail#addVerifyEmail()
		 */
		public function addverifyEmailEventListener(listener:Function):void
		{
			addEventListener(VerifyEmailResultEvent.VerifyEmail_RESULT,listener);
		}
			
		/**
		 * @private
		 */
        private function _VerifyEmail_populate_results(event:ResultEvent):void
        {
        var e:VerifyEmailResultEvent = new VerifyEmailResultEvent();
		            e.result = event.result as ReturnIndicator;
		                       e.headers = event.headers;
		             verifyEmail_lastResult = e.result;
		             dispatchEvent(e);
	        		
		}
		
		//service-wide functions
		/**
		 * @see IEmailVerNoTestEmail#getWebService()
		 */
		public function getWebService():BaseEmailVerNoTestEmail
		{
			return _baseService;
		}
		
		/**
		 * Set the event listener for the fault event which can be triggered by each of the operations defined by the facade
		 */
		public function addEmailVerNoTestEmailFaultEventListener(listener:Function):void
		{
			addEventListener("fault",listener);
		}
		
		/**
		 * Internal function to re-dispatch the fault event passed on by the base service implementation
		 * @private
		 */
		 
		 private function throwFault(event:FaultEvent):void
		 {
		 	dispatchEvent(event);
		 }
    }
}
