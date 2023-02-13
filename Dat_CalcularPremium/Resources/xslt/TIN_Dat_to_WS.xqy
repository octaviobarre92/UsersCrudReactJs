xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.fadata.bg/Insurance_Messages/v3.0/xml/";
(:: import schema at "../../../ComponentesComunesInsis/WSDL/insisGenericWS.wsdl" ::)

declare variable $idpoliza as xs:string external;

declare function local:func($idpoliza as xs:string) as element() (:: schema-element(ns1:InvokeSBSEventRq) ::) {
    <InvokeSBSEventRq>
        <EventType>CALC_PREM</EventType>
        <Parameters>
            <Parameter name="POLICY_ID" type="oracle.jbo.domain.Number">{fn:data($idpoliza)}</Parameter>
        </Parameters>
    </InvokeSBSEventRq>
};

local:func($idpoliza)
