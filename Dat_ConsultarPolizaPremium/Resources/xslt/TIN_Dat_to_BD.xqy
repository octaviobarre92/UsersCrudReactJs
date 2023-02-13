xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/ConsultarPoliza";
(:: import schema at "../DBadapter/ConsultarPoliza_sp.xsd" ::)

declare variable $poliza as xs:string external;
declare variable $ramo as xs:string external;
declare variable $subramo as xs:string external;
declare variable $secuencia as xs:string external;
declare variable $asegurado as xs:string external;

declare function local:func($poliza as xs:string, 
                            $ramo as xs:string, 
                            $subramo as xs:string, 
                            $secuencia as xs:string, 
                            $asegurado as xs:string) 
                            as element() (:: schema-element(ns1:InputParameters) ::) {
    <ns1:InputParameters>
        <ns1:PV_RAMO>{fn:data($ramo)}</ns1:PV_RAMO>
        <ns1:PV_SUB_RAMO>{fn:data($subramo)}</ns1:PV_SUB_RAMO>
        <ns1:PN_POLIZA>{fn:data($poliza)}</ns1:PN_POLIZA>
        <ns1:PN_SECUENCIA>{fn:data($secuencia)}</ns1:PN_SECUENCIA>
        <ns1:PV_ASEGURADO>{fn:data($asegurado)}</ns1:PV_ASEGURADO>
    </ns1:InputParameters>
};

local:func($poliza, $ramo, $subramo, $secuencia, $asegurado)
