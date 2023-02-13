xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/ConsultarPlantillaNotificacion";
(:: import schema at "../DBAdapter/ConsultarPlantillaNotificacion_sp.xsd" ::)

declare variable $idPlantilla as xs:string external;

declare function local:func($idPlantilla as xs:string) as element() (:: schema-element(ns1:InputParameters) ::) {
    <ns1:InputParameters>
        <ns1:Id_Plantilla>{fn:data($idPlantilla)}</ns1:Id_Plantilla>
    </ns1:InputParameters>
};

local:func($idPlantilla)
