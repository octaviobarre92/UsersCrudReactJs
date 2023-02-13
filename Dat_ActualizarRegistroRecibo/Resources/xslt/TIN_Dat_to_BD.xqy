xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/ActualizarRegistroRecibo";
(:: import schema at "../dbAdapter/ActualizarRegistroRecibo_sp.xsd" ::)

declare variable $poliza as xs:string external;
declare variable $secuencial as xs:string external;
declare variable $estado as xs:string external;

declare function local:func($poliza as xs:string, 
                            $secuencial as xs:string, 
                            $estado as xs:string) 
                            as element() (:: schema-element(ns1:InputParameters) ::) {
    <ns1:InputParameters>
        <ns1:SECUENCIAL>{fn:data($secuencial)}</ns1:SECUENCIAL>
        <ns1:POLIZA>{fn:data($poliza)}</ns1:POLIZA>
        <ns1:ESTADO>{fn:data($estado)}</ns1:ESTADO>
    </ns1:InputParameters>
};

local:func($poliza, $secuencial, $estado)
