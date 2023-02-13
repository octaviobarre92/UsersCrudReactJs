xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/ConsultarObjetoAseg";
(:: import schema at "../DBadapter/ConsultarObjetoAseg_sp.xsd" ::)

declare variable $tipoBusqueda as xs:string external;
declare variable $Objeto as xs:string external;
declare variable $ramo as xs:string external;
declare variable $subramo as xs:string external;
declare variable $poliza as xs:string external;
declare variable $secuencia as xs:string external;

declare function local:func($tipoBusqueda as xs:string, 
                            $Objeto as xs:string, 
                            $ramo as xs:string, 
                            $subramo as xs:string, 
                            $poliza as xs:string, 
                            $secuencia as xs:string) 
                            as element() (:: schema-element(ns1:InputParameters) ::) {
    <ns1:InputParameters>
        <ns1:PV_TIPO_DE_BUSQUEDA>{fn:data($tipoBusqueda)}</ns1:PV_TIPO_DE_BUSQUEDA>
        <ns1:PV_OBJETO_ASEGURADO>{fn:data($Objeto)}</ns1:PV_OBJETO_ASEGURADO>
        <ns1:PV_RAMO>{fn:data($ramo)}</ns1:PV_RAMO>
        <ns1:PV_SUB_RAMO>{fn:data($subramo)}</ns1:PV_SUB_RAMO>
        <ns1:PN_POLIZA>{fn:data($poliza)}</ns1:PN_POLIZA>
        <ns1:PN_SECUENCIA>{fn:data($secuencia)}</ns1:PN_SECUENCIA>
    </ns1:InputParameters>
};

local:func($tipoBusqueda, $Objeto, $ramo, $subramo, $poliza, $secuencia)
