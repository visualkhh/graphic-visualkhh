<?xml version="1.0" encoding="UTF-8"?><wsdl:definitions xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:tns="http://ws.cdyne.com/" targetNamespace="http://ws.cdyne.com/">
<wsdl:documentation>These functions deal with Email Address Verification.  &lt;b&gt;CDYNE advertises a 100% SLA.  Try to find that kind of SLA from other web service vendors!&lt;/b&gt;</wsdl:documentation>
  <wsdl:types>
    <s:schema elementFormDefault="qualified" targetNamespace="http://ws.cdyne.com/">
      <s:element name="VerifyMXRecord">
        <s:complexType>
          <s:sequence>
            <s:element maxOccurs="1" minOccurs="0" name="email" type="s:string"/>
            <s:element maxOccurs="1" minOccurs="0" name="LicenseKey" type="s:string"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="VerifyMXRecordResponse">
        <s:complexType>
          <s:sequence>
            <s:element maxOccurs="1" minOccurs="1" name="VerifyMXRecordResult" type="s:int"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="AdvancedVerifyEmail">
        <s:complexType>
          <s:sequence>
            <s:element maxOccurs="1" minOccurs="0" name="email" type="s:string"/>
            <s:element maxOccurs="1" minOccurs="1" name="timeout" type="s:int"/>
            <s:element maxOccurs="1" minOccurs="0" name="LicenseKey" type="s:string"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="AdvancedVerifyEmailResponse">
        <s:complexType>
          <s:sequence>
            <s:element maxOccurs="1" minOccurs="0" name="AdvancedVerifyEmailResult" type="tns:ReturnIndicator"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="ReturnIndicator">
        <s:sequence>
          <s:element maxOccurs="1" minOccurs="0" name="ResponseText" type="s:string"/>
          <s:element maxOccurs="1" minOccurs="1" name="ResponseCode" type="s:int"/>
          <s:element maxOccurs="1" minOccurs="0" name="LastMailServer" type="s:string"/>
          <s:element maxOccurs="1" minOccurs="1" name="GoodEmail" type="s:boolean"/>
        </s:sequence>
      </s:complexType>
      <s:element name="VerifyEmail">
        <s:complexType>
          <s:sequence>
            <s:element maxOccurs="1" minOccurs="0" name="email" type="s:string"/>
            <s:element maxOccurs="1" minOccurs="0" name="LicenseKey" type="s:string"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="VerifyEmailResponse">
        <s:complexType>
          <s:sequence>
            <s:element maxOccurs="1" minOccurs="0" name="VerifyEmailResult" type="tns:ReturnIndicator"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="ReturnCodes">
        <s:complexType/>
      </s:element>
      <s:element name="ReturnCodesResponse">
        <s:complexType>
          <s:sequence>
            <s:element maxOccurs="1" minOccurs="0" name="ReturnCodesResult" type="tns:ArrayOfAnyType"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="ArrayOfAnyType">
        <s:sequence>
          <s:element maxOccurs="unbounded" minOccurs="0" name="anyType" nillable="true"/>
        </s:sequence>
      </s:complexType>
      <s:element name="int" type="s:int"/>
      <s:element name="ReturnIndicator" nillable="true" type="tns:ReturnIndicator"/>
      <s:element name="ArrayOfAnyType" nillable="true" type="tns:ArrayOfAnyType"/>
    </s:schema>
  </wsdl:types>
  <wsdl:message name="AdvancedVerifyEmailHttpPostIn">
    <wsdl:part name="email" type="s:string">
    </wsdl:part>
    <wsdl:part name="timeout" type="s:string">
    </wsdl:part>
    <wsdl:part name="LicenseKey" type="s:string">
    </wsdl:part>
  </wsdl:message>
  <wsdl:message name="VerifyMXRecordSoapOut">
    <wsdl:part element="tns:VerifyMXRecordResponse" name="parameters">
    </wsdl:part>
  </wsdl:message>
  <wsdl:message name="ReturnCodesHttpGetOut">
    <wsdl:part element="tns:ArrayOfAnyType" name="Body">
    </wsdl:part>
  </wsdl:message>
  <wsdl:message name="ReturnCodesSoapOut">
    <wsdl:part element="tns:ReturnCodesResponse" name="parameters">
    </wsdl:part>
  </wsdl:message>
  <wsdl:message name="VerifyMXRecordHttpGetIn">
    <wsdl:part name="email" type="s:string">
    </wsdl:part>
    <wsdl:part name="LicenseKey" type="s:string">
    </wsdl:part>
  </wsdl:message>
  <wsdl:message name="VerifyMXRecordHttpGetOut">
    <wsdl:part element="tns:int" name="Body">
    </wsdl:part>
  </wsdl:message>
  <wsdl:message name="ReturnCodesSoapIn">
    <wsdl:part element="tns:ReturnCodes" name="parameters">
    </wsdl:part>
  </wsdl:message>
  <wsdl:message name="VerifyMXRecordSoapIn">
    <wsdl:part element="tns:VerifyMXRecord" name="parameters">
    </wsdl:part>
  </wsdl:message>
  <wsdl:message name="ReturnCodesHttpPostOut">
    <wsdl:part element="tns:ArrayOfAnyType" name="Body">
    </wsdl:part>
  </wsdl:message>
  <wsdl:message name="ReturnCodesHttpPostIn">
  </wsdl:message>
  <wsdl:message name="AdvancedVerifyEmailSoapOut">
    <wsdl:part element="tns:AdvancedVerifyEmailResponse" name="parameters">
    </wsdl:part>
  </wsdl:message>
  <wsdl:message name="VerifyEmailHttpGetOut">
    <wsdl:part element="tns:ReturnIndicator" name="Body">
    </wsdl:part>
  </wsdl:message>
  <wsdl:message name="VerifyEmailHttpGetIn">
    <wsdl:part name="email" type="s:string">
    </wsdl:part>
    <wsdl:part name="LicenseKey" type="s:string">
    </wsdl:part>
  </wsdl:message>
  <wsdl:message name="VerifyEmailHttpPostOut">
    <wsdl:part element="tns:ReturnIndicator" name="Body">
    </wsdl:part>
  </wsdl:message>
  <wsdl:message name="VerifyEmailHttpPostIn">
    <wsdl:part name="email" type="s:string">
    </wsdl:part>
    <wsdl:part name="LicenseKey" type="s:string">
    </wsdl:part>
  </wsdl:message>
  <wsdl:message name="AdvancedVerifyEmailHttpGetIn">
    <wsdl:part name="email" type="s:string">
    </wsdl:part>
    <wsdl:part name="timeout" type="s:string">
    </wsdl:part>
    <wsdl:part name="LicenseKey" type="s:string">
    </wsdl:part>
  </wsdl:message>
  <wsdl:message name="AdvancedVerifyEmailHttpPostOut">
    <wsdl:part element="tns:ReturnIndicator" name="Body">
    </wsdl:part>
  </wsdl:message>
  <wsdl:message name="VerifyMXRecordHttpPostIn">
    <wsdl:part name="email" type="s:string">
    </wsdl:part>
    <wsdl:part name="LicenseKey" type="s:string">
    </wsdl:part>
  </wsdl:message>
  <wsdl:message name="AdvancedVerifyEmailSoapIn">
    <wsdl:part element="tns:AdvancedVerifyEmail" name="parameters">
    </wsdl:part>
  </wsdl:message>
  <wsdl:message name="VerifyEmailSoapIn">
    <wsdl:part element="tns:VerifyEmail" name="parameters">
    </wsdl:part>
  </wsdl:message>
  <wsdl:message name="ReturnCodesHttpGetIn">
  </wsdl:message>
  <wsdl:message name="VerifyEmailSoapOut">
    <wsdl:part element="tns:VerifyEmailResponse" name="parameters">
    </wsdl:part>
  </wsdl:message>
  <wsdl:message name="AdvancedVerifyEmailHttpGetOut">
    <wsdl:part element="tns:ReturnIndicator" name="Body">
    </wsdl:part>
  </wsdl:message>
  <wsdl:message name="VerifyMXRecordHttpPostOut">
    <wsdl:part element="tns:int" name="Body">
    </wsdl:part>
  </wsdl:message>
  <wsdl:portType name="EmailVerNoTestEmailHttpPost">
    <wsdl:operation name="VerifyMXRecord">
<wsdl:documentation>This function will verify the domains DNS (MX) mail entries.  If the function returns 0 the persons email domain is invalid.  More than 0 will indicate there is mail servers to accept an email.  This function is great for quick email domain verification.  It is not as powerful as the other email routines.  Use a LicenseKey of 0 for testing.  A -9999 as a result means that you have tested to many emails.  Please try again later if you get this value.</wsdl:documentation>
      <wsdl:input message="tns:VerifyMXRecordHttpPostIn">
    </wsdl:input>
      <wsdl:output message="tns:VerifyMXRecordHttpPostOut">
    </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AdvancedVerifyEmail">
<wsdl:documentation>This function will verify an email address and also includes the ability to timeout the verification process.  The Verification can be slowed down by the email server being verified against. &lt;b&gt;Timeout is in seconds&lt;/b&gt; Use a licensekey of 0 for testing &lt;br&gt; NOTE: A timeout error (7) does not mean an email will not go through.  You should treat this as a good email address.</wsdl:documentation>
      <wsdl:input message="tns:AdvancedVerifyEmailHttpPostIn">
    </wsdl:input>
      <wsdl:output message="tns:AdvancedVerifyEmailHttpPostOut">
    </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="VerifyEmail">
<wsdl:documentation>This function allows you to verify an email address against the mail servers it belongs to.  This function differs from the advanced function only by it automatically setting a timeout of 5 seconds</wsdl:documentation>
      <wsdl:input message="tns:VerifyEmailHttpPostIn">
    </wsdl:input>
      <wsdl:output message="tns:VerifyEmailHttpPostOut">
    </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ReturnCodes">
<wsdl:documentation>This function will give you all the possible code returns</wsdl:documentation>
      <wsdl:input message="tns:ReturnCodesHttpPostIn">
    </wsdl:input>
      <wsdl:output message="tns:ReturnCodesHttpPostOut">
    </wsdl:output>
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:portType name="EmailVerNoTestEmailHttpGet">
    <wsdl:operation name="VerifyMXRecord">
<wsdl:documentation>This function will verify the domains DNS (MX) mail entries.  If the function returns 0 the persons email domain is invalid.  More than 0 will indicate there is mail servers to accept an email.  This function is great for quick email domain verification.  It is not as powerful as the other email routines.  Use a LicenseKey of 0 for testing.  A -9999 as a result means that you have tested to many emails.  Please try again later if you get this value.</wsdl:documentation>
      <wsdl:input message="tns:VerifyMXRecordHttpGetIn">
    </wsdl:input>
      <wsdl:output message="tns:VerifyMXRecordHttpGetOut">
    </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AdvancedVerifyEmail">
<wsdl:documentation>This function will verify an email address and also includes the ability to timeout the verification process.  The Verification can be slowed down by the email server being verified against. &lt;b&gt;Timeout is in seconds&lt;/b&gt; Use a licensekey of 0 for testing &lt;br&gt; NOTE: A timeout error (7) does not mean an email will not go through.  You should treat this as a good email address.</wsdl:documentation>
      <wsdl:input message="tns:AdvancedVerifyEmailHttpGetIn">
    </wsdl:input>
      <wsdl:output message="tns:AdvancedVerifyEmailHttpGetOut">
    </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="VerifyEmail">
<wsdl:documentation>This function allows you to verify an email address against the mail servers it belongs to.  This function differs from the advanced function only by it automatically setting a timeout of 5 seconds</wsdl:documentation>
      <wsdl:input message="tns:VerifyEmailHttpGetIn">
    </wsdl:input>
      <wsdl:output message="tns:VerifyEmailHttpGetOut">
    </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ReturnCodes">
<wsdl:documentation>This function will give you all the possible code returns</wsdl:documentation>
      <wsdl:input message="tns:ReturnCodesHttpGetIn">
    </wsdl:input>
      <wsdl:output message="tns:ReturnCodesHttpGetOut">
    </wsdl:output>
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:portType name="EmailVerNoTestEmailSoap">
    <wsdl:operation name="VerifyMXRecord">
<wsdl:documentation>This function will verify the domains DNS (MX) mail entries.  If the function returns 0 the persons email domain is invalid.  More than 0 will indicate there is mail servers to accept an email.  This function is great for quick email domain verification.  It is not as powerful as the other email routines.  Use a LicenseKey of 0 for testing.  A -9999 as a result means that you have tested to many emails.  Please try again later if you get this value.</wsdl:documentation>
      <wsdl:input message="tns:VerifyMXRecordSoapIn">
    </wsdl:input>
      <wsdl:output message="tns:VerifyMXRecordSoapOut">
    </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AdvancedVerifyEmail">
<wsdl:documentation>This function will verify an email address and also includes the ability to timeout the verification process.  The Verification can be slowed down by the email server being verified against. &lt;b&gt;Timeout is in seconds&lt;/b&gt; Use a licensekey of 0 for testing &lt;br&gt; NOTE: A timeout error (7) does not mean an email will not go through.  You should treat this as a good email address.</wsdl:documentation>
      <wsdl:input message="tns:AdvancedVerifyEmailSoapIn">
    </wsdl:input>
      <wsdl:output message="tns:AdvancedVerifyEmailSoapOut">
    </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="VerifyEmail">
<wsdl:documentation>This function allows you to verify an email address against the mail servers it belongs to.  This function differs from the advanced function only by it automatically setting a timeout of 5 seconds</wsdl:documentation>
      <wsdl:input message="tns:VerifyEmailSoapIn">
    </wsdl:input>
      <wsdl:output message="tns:VerifyEmailSoapOut">
    </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ReturnCodes">
<wsdl:documentation>This function will give you all the possible code returns</wsdl:documentation>
      <wsdl:input message="tns:ReturnCodesSoapIn">
    </wsdl:input>
      <wsdl:output message="tns:ReturnCodesSoapOut">
    </wsdl:output>
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:binding name="EmailVerNoTestEmailHttpPost" type="tns:EmailVerNoTestEmailHttpPost">
    <http:binding verb="POST"/>
    <wsdl:operation name="VerifyMXRecord">
      <http:operation location="/VerifyMXRecord"/>
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded"/>
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AdvancedVerifyEmail">
      <http:operation location="/AdvancedVerifyEmail"/>
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded"/>
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="VerifyEmail">
      <http:operation location="/VerifyEmail"/>
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded"/>
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ReturnCodes">
      <http:operation location="/ReturnCodes"/>
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded"/>
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body"/>
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="EmailVerNoTestEmailSoap12" type="tns:EmailVerNoTestEmailSoap">
    <soap12:binding transport="http://schemas.xmlsoap.org/soap/http"/>
    <wsdl:operation name="VerifyMXRecord">
      <soap12:operation soapAction="http://ws.cdyne.com/VerifyMXRecord" style="document"/>
      <wsdl:input>
        <soap12:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AdvancedVerifyEmail">
      <soap12:operation soapAction="http://ws.cdyne.com/AdvancedVerifyEmail" style="document"/>
      <wsdl:input>
        <soap12:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="VerifyEmail">
      <soap12:operation soapAction="http://ws.cdyne.com/VerifyEmail" style="document"/>
      <wsdl:input>
        <soap12:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ReturnCodes">
      <soap12:operation soapAction="http://ws.cdyne.com/ReturnCodes" style="document"/>
      <wsdl:input>
        <soap12:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="EmailVerNoTestEmailHttpGet" type="tns:EmailVerNoTestEmailHttpGet">
    <http:binding verb="GET"/>
    <wsdl:operation name="VerifyMXRecord">
      <http:operation location="/VerifyMXRecord"/>
      <wsdl:input>
        <http:urlEncoded/>
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AdvancedVerifyEmail">
      <http:operation location="/AdvancedVerifyEmail"/>
      <wsdl:input>
        <http:urlEncoded/>
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="VerifyEmail">
      <http:operation location="/VerifyEmail"/>
      <wsdl:input>
        <http:urlEncoded/>
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ReturnCodes">
      <http:operation location="/ReturnCodes"/>
      <wsdl:input>
        <http:urlEncoded/>
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body"/>
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="EmailVerNoTestEmailSoap" type="tns:EmailVerNoTestEmailSoap">
    <soap:binding transport="http://schemas.xmlsoap.org/soap/http"/>
    <wsdl:operation name="VerifyMXRecord">
      <soap:operation soapAction="http://ws.cdyne.com/VerifyMXRecord" style="document"/>
      <wsdl:input>
        <soap:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AdvancedVerifyEmail">
      <soap:operation soapAction="http://ws.cdyne.com/AdvancedVerifyEmail" style="document"/>
      <wsdl:input>
        <soap:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="VerifyEmail">
      <soap:operation soapAction="http://ws.cdyne.com/VerifyEmail" style="document"/>
      <wsdl:input>
        <soap:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ReturnCodes">
      <soap:operation soapAction="http://ws.cdyne.com/ReturnCodes" style="document"/>
      <wsdl:input>
        <soap:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:service name="EmailVerNoTestEmail">
<wsdl:documentation>These functions deal with Email Address Verification.  &lt;b&gt;CDYNE advertises a 100% SLA.  Try to find that kind of SLA from other web service vendors!&lt;/b&gt;</wsdl:documentation>
    <wsdl:port binding="tns:EmailVerNoTestEmailHttpPost" name="EmailVerNoTestEmailHttpPost">
      <http:address location="http://ws.cdyne.com/emailverify/Emailvernotestemail.asmx"/>
    </wsdl:port>
    <wsdl:port binding="tns:EmailVerNoTestEmailSoap" name="EmailVerNoTestEmailSoap">
      <soap:address location="http://ws.cdyne.com/emailverify/Emailvernotestemail.asmx"/>
    </wsdl:port>
    <wsdl:port binding="tns:EmailVerNoTestEmailHttpGet" name="EmailVerNoTestEmailHttpGet">
      <http:address location="http://ws.cdyne.com/emailverify/Emailvernotestemail.asmx"/>
    </wsdl:port>
    <wsdl:port binding="tns:EmailVerNoTestEmailSoap12" name="EmailVerNoTestEmailSoap12">
      <soap12:address location="http://ws.cdyne.com/emailverify/Emailvernotestemail.asmx"/>
    </wsdl:port>
  </wsdl:service>
</wsdl:definitions>