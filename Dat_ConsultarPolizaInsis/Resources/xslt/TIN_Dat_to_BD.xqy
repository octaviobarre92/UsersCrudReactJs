xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/ConsultarPoliza";
(:: import schema at "../DBadapter/ConsultarPoliza_sp.xsd" ::)

declare variable $CodCliente as xs:string external;
declare variable $Poliza as xs:string external;

declare function local:func($CodCliente as xs:string, 
                            $Poliza as xs:string) 
                            as element() (:: schema-element(ns1:InputParameters) ::) {
    <ns1:InputParameters>
        <ns1:PI_POLICYID>{fn:data($Poliza)}</ns1:PI_POLICYID>
        <ns1:PI_CLIENTID>{fn:data($CodCliente)}</ns1:PI_CLIENTID>
    </ns1:InputParameters>
};

local:func($CodCliente, $Poliza)