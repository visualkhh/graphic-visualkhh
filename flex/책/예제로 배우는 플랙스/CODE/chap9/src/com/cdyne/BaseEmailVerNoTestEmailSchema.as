package com.cdyne
{
	 import mx.rpc.xml.Schema
	 public class BaseEmailVerNoTestEmailSchema
	{
		 public var schemas:Array = new Array();
		 public var targetNamespaces:Array = new Array();
		 public function BaseEmailVerNoTestEmailSchema():void
{		
			 var xsdXML0:XML = <s:schema xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:tns="http://ws.cdyne.com/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" attributeFormDefault="unqualified" elementFormDefault="qualified" targetNamespace="http://ws.cdyne.com/">
    <s:element name="VerifyMXRecord">
        <s:complexType>
            <s:sequence>
                <s:element minOccurs="0" name="email" type="s:string"/>
                <s:element minOccurs="0" name="LicenseKey" type="s:string"/>
            </s:sequence>
        </s:complexType>
    </s:element>
    <s:element name="VerifyMXRecordResponse">
        <s:complexType>
            <s:sequence>
                <s:element name="VerifyMXRecordResult" type="s:int"/>
            </s:sequence>
        </s:complexType>
    </s:element>
    <s:element name="AdvancedVerifyEmail">
        <s:complexType>
            <s:sequence>
                <s:element minOccurs="0" name="email" type="s:string"/>
                <s:element name="timeout" type="s:int"/>
                <s:element minOccurs="0" name="LicenseKey" type="s:string"/>
            </s:sequence>
        </s:complexType>
    </s:element>
    <s:element name="AdvancedVerifyEmailResponse">
        <s:complexType>
            <s:sequence>
                <s:element minOccurs="0" name="AdvancedVerifyEmailResult" type="tns:ReturnIndicator"/>
            </s:sequence>
        </s:complexType>
    </s:element>
    <s:complexType name="ReturnIndicator">
        <s:sequence>
            <s:element minOccurs="0" name="ResponseText" type="s:string"/>
            <s:element name="ResponseCode" type="s:int"/>
            <s:element minOccurs="0" name="LastMailServer" type="s:string"/>
            <s:element name="GoodEmail" type="s:boolean"/>
        </s:sequence>
    </s:complexType>
    <s:element name="VerifyEmail">
        <s:complexType>
            <s:sequence>
                <s:element minOccurs="0" name="email" type="s:string"/>
                <s:element minOccurs="0" name="LicenseKey" type="s:string"/>
            </s:sequence>
        </s:complexType>
    </s:element>
    <s:element name="VerifyEmailResponse">
        <s:complexType>
            <s:sequence>
                <s:element minOccurs="0" name="VerifyEmailResult" type="tns:ReturnIndicator"/>
            </s:sequence>
        </s:complexType>
    </s:element>
    <s:element name="ReturnCodes">
        <s:complexType/>
    </s:element>
    <s:element name="ReturnCodesResponse">
        <s:complexType>
            <s:sequence>
                <s:element minOccurs="0" name="ReturnCodesResult" type="tns:ArrayOfAnyType"/>
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
;
			 var xsdSchema0:Schema = new Schema(xsdXML0);
			schemas.push(xsdSchema0);
			targetNamespaces.push(new Namespace('','http://ws.cdyne.com/'));
		}
	}
}