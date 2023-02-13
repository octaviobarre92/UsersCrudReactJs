xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/ConsultarEgreso";
(:: import schema at "../DBadapter/ConsultarEgreso_sp.xsd" ::)

declare variable $Identificacion as xs:string external;
declare variable $TipoEgreso as xs:string external;
declare variable $Fecha as xs:string external;

declare function local:func($Identificacion as xs:string, 
                            $TipoEgreso as xs:string, 
                            $Fecha as xs:string) 
                            as element() (:: schema-element(ns1:InputParameters) ::) {
    <ns1:InputParameters>
        <ns1:PV_TIPO_EGRESO>{fn:data($TipoEgreso)}</ns1:PV_TIPO_EGRESO>
        <ns1:PV_ASEGURADO>{fn:data($Identificacion)}</ns1:PV_ASEGURADO>
        <ns1:PD_FECHA_TRANSACCION>{fn:data($Fecha)}</ns1:PD_FECHA_TRANSACCION>
    </ns1:InputParameters>
};

local:func($Identificacion, $TipoEgreso, $Fecha)
