xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/ConsultarPrestamo";
(:: import schema at "../DBadapter/ConsultarPrestamo_sp.xsd" ::)

declare variable $Poliza as xs:string external;
declare variable $Prestamo as xs:string external;
declare variable $Ramo as xs:string external;
declare variable $Subramo as xs:string external;
declare variable $Secuencia as xs:string external;


declare function local:func($Poliza as xs:string, 
                            $Prestamo as xs:string,
                            $Ramo as xs:string,
                            $Subramo as xs:string,
                            $Secuencia as xs:string) 
                            as element() (:: schema-element(ns1:InputParameters) ::) {
    <ns1:InputParameters>
        <ns1:PV_RAMO>{fn:data($Ramo)}</ns1:PV_RAMO>
        <ns1:PV_SUB_RAMO>{fn:data($Subramo)}</ns1:PV_SUB_RAMO>
        <ns1:PN_POLIZA>{fn:data($Poliza)}</ns1:PN_POLIZA>
        <ns1:PN_SECUENCIA>{fn:data($Secuencia)}</ns1:PN_SECUENCIA>
        <ns1:PN_PRESTAMO>{fn:data($Prestamo)}</ns1:PN_PRESTAMO>
    </ns1:InputParameters>
};

local:func($Poliza, $Prestamo, $Ramo, $Subramo, $Secuencia)
