xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/ConsultarCliente";
(:: import schema at "../DBadapter/ConsultarCliente_sp.xsd" ::)

declare variable $Nombre as xs:string external;
declare variable $Apellido as xs:string external;
declare variable $IdCliente as xs:string external;
declare variable $CodCliente as xs:string external;

declare function local:func($Nombre as xs:string, 
                            $Apellido as xs:string, 
                            $IdCliente as xs:string, 
                            $CodCliente as xs:string) 
                            as element() (:: schema-element(ns1:InputParameters) ::) {
    <ns1:InputParameters>
        <ns1:PI_EGNPEOPLE>{fn:data($IdCliente)}</ns1:PI_EGNPEOPLE>
        <ns1:PI_CLIENTNAME>{fn:data($Nombre)}</ns1:PI_CLIENTNAME>
        <ns1:PI_CLIENTLASTNAME>{fn:data($Apellido)}</ns1:PI_CLIENTLASTNAME>
        <ns1:PI_CLIENTID>{fn:data($CodCliente)}</ns1:PI_CLIENTID>
    </ns1:InputParameters>
};

local:func($Nombre, $Apellido, $IdCliente, $CodCliente)
