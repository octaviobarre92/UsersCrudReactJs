xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://www.sura.com/ConsultarEgresoPremium";
(:: import schema at "../xsd/Egreso_Premium.xsd" ::)
declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/ConsultarEgreso";
(:: import schema at "../DBadapter/ConsultarEgreso_sp.xsd" ::)

declare variable $EgresoBD as element() (:: schema-element(ns1:OutputParameters) ::) external;

declare function local:func($EgresoBD as element() (:: schema-element(ns1:OutputParameters) ::)) as element() (:: schema-element(ns2:OBJETO_EGRESOS) ::) {
    <ns2:OBJETO_EGRESOS>
        {
            for $RFC_EGRESOS_Row in $EgresoBD/ns1:RFC_EGRESOS/ns1:RFC_EGRESOS_Row
            return 
            <ns2:EGRESO>
                <ns2:IDENTIFICACION_CLIENTE>{fn:data($RFC_EGRESOS_Row/ns1:ASEGURADO)}</ns2:IDENTIFICACION_CLIENTE>
                <ns2:EGRESO_CODIGO>{fn:data($RFC_EGRESOS_Row/ns1:NUMERO_DE_DOCUMENTO)}</ns2:EGRESO_CODIGO>
                <ns2:NUMERO_DE_SOLICITUD>{fn:data($RFC_EGRESOS_Row/ns1:NUMERO_DE_SOLICITUD)}</ns2:NUMERO_DE_SOLICITUD>
                <ns2:FECHA_DOCUMENTO>{fn:data($RFC_EGRESOS_Row/ns1:FECHA_DEL_DOCUMENTO)}</ns2:FECHA_DOCUMENTO>
                <ns2:CORE>P</ns2:CORE>
                <ns2:NOMBRECOMPLETO>{fn:data($RFC_EGRESOS_Row/ns1:BENEFICIARIO)}</ns2:NOMBRECOMPLETO>
                <ns2:CLASEIDENTIFICACION>{fn:data($RFC_EGRESOS_Row/ns1:TIPO_BENEFICIARIO)}</ns2:CLASEIDENTIFICACION>
                <ns2:MONTO>{fn:data($RFC_EGRESOS_Row/ns1:MONTO)}</ns2:MONTO>
                <ns2:MOTIVO>{fn:data($RFC_EGRESOS_Row/ns1:MOTIVO_DEL_DOCUMENTO)}</ns2:MOTIVO>
                <ns2:OBSERVACION>{fn:data($RFC_EGRESOS_Row/ns1:OBSERVACION_PAGO)}</ns2:OBSERVACION></ns2:EGRESO>
        }
    </ns2:OBJETO_EGRESOS>
};

local:func($EgresoBD)
