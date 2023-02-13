xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/GestionarCatalogoPremium";
(:: import schema at "../DBAdapter/GestionarCatalogoPremium_sp.xsd" ::)

declare variable $tabla as xs:string external;
declare variable $parametro as xs:string external;

declare function local:func($tabla as xs:string, 
                            $parametro as xs:string) 
                            as element() (:: schema-element(ns1:InputParameters) ::) {
    <ns1:InputParameters>
        <ns1:P_TABLA>{fn:data($tabla)}</ns1:P_TABLA>
        <ns1:P_PARAMETRO>{fn:data($parametro)}</ns1:P_PARAMETRO>
    </ns1:InputParameters>
};

local:func($tabla, $parametro)
