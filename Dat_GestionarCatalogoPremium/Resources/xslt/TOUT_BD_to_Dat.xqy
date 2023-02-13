xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://www.sura.com/ConsultarPrestamoPremium";
(:: import schema at "../xsd/Catalogo_Premium.xsd" ::)
declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/GestionarCatalogoPremium";
(:: import schema at "../DBAdapter/GestionarCatalogoPremium_sp.xsd" ::)

declare variable $Catalogos_Premium as element() (:: schema-element(ns1:OutputParameters) ::) external;

declare function local:func($Catalogos_Premium as element() (:: schema-element(ns1:OutputParameters) ::)) as element() (:: schema-element(ns2:OBJETO_CATALOGO) ::) {
    <ns2:OBJETO_CATALOGO>
        {
            for $P_INFO_Row in $Catalogos_Premium/ns1:P_INFO/ns1:P_INFO_Row
            return 
            <ns2:CATALOGOS>
                <ns2:CODIGO>{fn:data($P_INFO_Row/ns1:CODIGO)}</ns2:CODIGO>
                <ns2:DESCRIPCION>{fn:data($P_INFO_Row/ns1:NOMBRE)}</ns2:DESCRIPCION></ns2:CATALOGOS>
        }
    </ns2:OBJETO_CATALOGO>
};

local:func($Catalogos_Premium)
