xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/ConsultarClientePremium";
(:: import schema at "../DBadapter/ConsultarClientePremium_sp.xsd" ::)

declare variable $Identificacion as xs:string external;
declare variable $nombre as xs:string external;
declare variable $apellido as xs:string external;

declare function local:func($Identificacion as xs:string, 
                            $nombre as xs:string, 
                            $apellido as xs:string) 
                            as element() (:: schema-element(ns1:InputParameters) ::) {
    <ns1:InputParameters>
        <ns1:PV_ASEGURADO>{fn:data($Identificacion)}</ns1:PV_ASEGURADO>
        <ns1:PV_NOMBRE>{fn:data($nombre)}</ns1:PV_NOMBRE>
        <ns1:PV_APELLIDO>{fn:data($apellido)}</ns1:PV_APELLIDO>
    </ns1:InputParameters>
};

local:func($Identificacion, $nombre, $apellido)
