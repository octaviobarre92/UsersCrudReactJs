xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/ConsultarObjetoAsegurado";
(:: import schema at "../DBadapter/ConsultarObjetoAsegurado_sp.xsd" ::)

declare variable $Poliza as xs:string external;
declare variable $Objeto as xs:string external;
declare variable $BuscarPor as xs:string external;

declare function local:func($Poliza as xs:string, 
                            $Objeto as xs:string, 
                            $BuscarPor as xs:string) 
                            as element() (:: schema-element(ns1:InputParameters) ::) {
    <ns1:InputParameters>
        <ns1:PI_POLICYID>{fn:data($Poliza)}</ns1:PI_POLICYID>
        <ns1:PI_OBJECTID>{fn:data($Objeto)}</ns1:PI_OBJECTID>
        <ns1:PI_SEARCHBY>{fn:data($BuscarPor)}</ns1:PI_SEARCHBY>
    </ns1:InputParameters>
};

local:func($Poliza, $Objeto, $BuscarPor)
