xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/CerrarCajaPremium";
(:: import schema at "../database/CerrarCajaPremium_sp.xsd" ::)

declare variable $numeroLote as xs:string external;
declare variable $numeroSucursal as xs:string external;

declare function local:func($numeroLote as xs:string, 
                            $numeroSucursal as xs:string) 
                            as element() (:: schema-element(ns1:InputParameters) ::) {
    <ns1:InputParameters>
        <ns1:PV_LOTEID>{fn:data($numeroLote)}</ns1:PV_LOTEID>
        <ns1:PV_SUCURSALID>{fn:data($numeroSucursal)}</ns1:PV_SUCURSALID>
    </ns1:InputParameters>
};

local:func($numeroLote, $numeroSucursal)
