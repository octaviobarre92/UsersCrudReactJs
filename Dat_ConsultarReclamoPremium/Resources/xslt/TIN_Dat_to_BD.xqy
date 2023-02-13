xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/Consultar_Reclamo";
(:: import schema at "../DBadapter/Consultar_Reclamo_sp.xsd" ::)

declare variable $ramo as xs:string external;
declare variable $subramo as xs:string external;
declare variable $poliza as xs:string external;
declare variable $secuencia as xs:string external;
declare variable $annio as xs:string external;
declare variable $mes as xs:string external;
declare variable $reclamo as xs:string external;
declare variable $codregistro as xs:string external;

declare function local:func($ramo as xs:string, 
                            $subramo as xs:string, 
                            $poliza as xs:string, 
                            $secuencia as xs:string, 
                            $annio as xs:string, 
                            $mes as xs:string, 
                            $reclamo as xs:string, 
                            $codregistro as xs:string) 
                            as element() (:: schema-element(ns1:InputParameters) ::) {
    <ns1:InputParameters>
        <ns1:PV_RAMO>{fn:data($ramo)}</ns1:PV_RAMO>
        <ns1:PV_SUB_RAMO>{fn:data($subramo)}</ns1:PV_SUB_RAMO>
        <ns1:PN_POLIZA>{fn:data($poliza)}</ns1:PN_POLIZA>
        <ns1:PN_SECUENCIA>{fn:data($secuencia)}</ns1:PN_SECUENCIA>
        <ns1:PN_ANNIO>{fn:data($annio)}</ns1:PN_ANNIO>
        <ns1:PN_MES>{fn:data($mes)}</ns1:PN_MES>
        <ns1:PN_RECLAMO>{fn:data($reclamo)}</ns1:PN_RECLAMO>
        <ns1:PN_CODREGISTRO>{fn:data($codregistro)}</ns1:PN_CODREGISTRO>
    </ns1:InputParameters>
};

local:func($ramo, $subramo, $poliza, $secuencia, $annio, $mes, $reclamo, $codregistro)