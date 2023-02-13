xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://www.sura.com/ConsultarClienteInsis";
(:: import schema at "../xsd/Plantilla.xsd" ::)
declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/ConsultarPlantillaNotificacion";
(:: import schema at "../DBAdapter/ConsultarPlantillaNotificacion_sp.xsd" ::)

declare variable $Resultado as element() (:: schema-element(ns1:OutputParameters) ::) external;

declare function local:func($Resultado as element() (:: schema-element(ns1:OutputParameters) ::)) as element() (:: schema-element(ns2:OBJETO_PLANTILLA) ::) {
    <ns2:OBJETO_PLANTILLA>
        {
            for $RowSet0_Row in $Resultado/ns1:RowSet0/ns1:RowSet0_Row
            return 
            <ns2:PLANTILLA>
                <ns2:DESDE>{fn:data($RowSet0_Row/ns1:Desde)}</ns2:DESDE>
                <ns2:ASUNTO>{fn:data($RowSet0_Row/ns1:Asunto)}</ns2:ASUNTO>
                <ns2:PLANTILLA>{fn:data($RowSet0_Row/ns1:Plantilla)}</ns2:PLANTILLA>
                <ns2:ES_HTML>{fn:data($RowSet0_Row/ns1:EsHtml)}</ns2:ES_HTML></ns2:PLANTILLA>
        }
    </ns2:OBJETO_PLANTILLA>
};

local:func($Resultado)
