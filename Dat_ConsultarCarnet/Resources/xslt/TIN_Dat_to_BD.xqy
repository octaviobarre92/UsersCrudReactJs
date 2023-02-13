xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/ConsultarCarnet";
(:: import schema at "../BDAdapter/ConsultarCarnet_sp.xsd" ::)

declare variable $numero_poliza as xs:string external;
declare variable $numero_identificacion as xs:string external;

declare function local:func($numero_poliza as xs:string, 
                            $numero_identificacion as xs:string) 
                            as element() (:: schema-element(ns1:InputParameters) ::) {
    <ns1:InputParameters>
        <ns1:P_IDPART>{fn:data($numero_identificacion)}</ns1:P_IDPART>
        <ns1:P_POLICY>{fn:data($numero_poliza)}</ns1:P_POLICY>
    </ns1:InputParameters>
};

local:func($numero_poliza, $numero_identificacion)