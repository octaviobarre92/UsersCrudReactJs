xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/ConsultarReclamo";
(:: import schema at "../DBadapter/ConsultarReclamo_sp.xsd" ::)

declare variable $Poliza as xs:string external;
declare variable $reclamo as xs:string external;
declare variable $referencia as xs:string external;

declare function local:func($Poliza as xs:string, 
                            $reclamo as xs:string, 
                            $referencia as xs:string) 
                            as element() (:: schema-element(ns1:InputParameters) ::) {
    <ns1:InputParameters>
        <ns1:PI_POLICYID>{fn:data($Poliza)}</ns1:PI_POLICYID>
        <ns1:PI_CLAIMSID>{fn:data($reclamo)}</ns1:PI_CLAIMSID>
        <ns1:PI_REFERENCE>{fn:data($referencia)}</ns1:PI_REFERENCE>
    </ns1:InputParameters>
};

local:func($Poliza, $reclamo, $referencia)
