xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/RegistrarBitacoraPago";
(:: import schema at "../DBadapter/RegistrarBitacoraPago_sp.xsd" ::)

declare variable $cuerpo as xs:string external;

declare function local:func($cuerpo as xs:string) as element() (:: schema-element(ns1:InputParameters) ::) {
    <ns1:InputParameters>
        <ns1:XML>{fn:data($cuerpo)}</ns1:XML>
    </ns1:InputParameters>
};

local:func($cuerpo)
