xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/ConsultarPrestamoInsis";
(:: import schema at "../DBadapter/ConsultarPrestamoInsis_sp.xsd" ::)

declare variable $Poliza as xs:string external;
declare variable $Prestamo as xs:string external;

declare function local:func($Poliza as xs:string, 
                            $Prestamo as xs:string) 
                            as element() (:: schema-element(ns1:InputParameters) ::) {
    <ns1:InputParameters>
        <ns1:PI_POLICYID>{fn:data($Poliza)}</ns1:PI_POLICYID>
        <ns1:PI_LOANID>{fn:data($Prestamo)}</ns1:PI_LOANID>
    </ns1:InputParameters>
};

local:func($Poliza, $Prestamo)
