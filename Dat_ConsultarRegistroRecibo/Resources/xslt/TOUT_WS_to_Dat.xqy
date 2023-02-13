xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://pa.sura.insis.com/crearpersona";
(:: import schema at "../nxsd/EstadoLegalizacion_RS.xsd" ::)
declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/ConsultarRegistroRecibo";
(:: import schema at "../dbAdapter/ConsultarRegistroRecibo_sp.xsd" ::)

declare variable $respuestaSP as element() (:: schema-element(ns1:OutputParameters) ::) external;

declare function local:func($respuestaSP as element() (:: schema-element(ns1:OutputParameters) ::)) as element() (:: schema-element(ns2:DatosBasicos) ::) {
    <ns2:DatosBasicos>
        {
            if ($respuestaSP/ns1:RowSet1/ns1:RowSet1_Row/ns1:error)
            then <ns2:ERROR>{fn:data($respuestaSP/ns1:RowSet1/ns1:RowSet1_Row/ns1:error)}</ns2:ERROR>
            else ()
        }
        {
            if ($respuestaSP/ns1:RowSet1/ns1:RowSet1_Row/ns1:respuesta)
            then <ns2:MENSAJE>{fn:data($respuestaSP/ns1:RowSet1/ns1:RowSet1_Row/ns1:respuesta)}</ns2:MENSAJE>
            else ()
        }
        <ns2:ESTADO_LEGALIZACION>
            {
                if ($respuestaSP/ns1:RowSet0/ns1:RowSet0_Row/ns1:lgr_id)
                then <ns2:SECUENCIAL>{fn:data($respuestaSP/ns1:RowSet0/ns1:RowSet0_Row/ns1:lgr_id)}</ns2:SECUENCIAL>
                else ()
            }
            {
                if ($respuestaSP/ns1:RowSet0/ns1:RowSet0_Row/ns1:lgr_poliza)
                then <ns2:NUMERO_POLIZA>{fn:data($respuestaSP/ns1:RowSet0/ns1:RowSet0_Row/ns1:lgr_poliza)}</ns2:NUMERO_POLIZA>
                else ()
            }
            {
                if ($respuestaSP/ns1:RowSet0/ns1:RowSet0_Row/ns1:lgr_mensaje_entrada)
                then <ns2:MENSAJE_ENTRADA>{fn:data($respuestaSP/ns1:RowSet0/ns1:RowSet0_Row/ns1:lgr_mensaje_entrada)}</ns2:MENSAJE_ENTRADA>
                else ()
            }
            {
                if ($respuestaSP/ns1:RowSet0/ns1:RowSet0_Row/ns1:lgr_estado)
                then <ns2:ESTADO>{fn:data($respuestaSP/ns1:RowSet0/ns1:RowSet0_Row/ns1:lgr_estado)}</ns2:ESTADO>
                else ()
            }
            {
                if ($respuestaSP/ns1:RowSet0/ns1:RowSet0_Row/ns1:lgr_id_transaccion_OSB)
                then <ns2:ID_TRANSACCION_OSB>{fn:data($respuestaSP/ns1:RowSet0/ns1:RowSet0_Row/ns1:lgr_id_transaccion_OSB)}</ns2:ID_TRANSACCION_OSB>
                else ()
            }
            {
                if ($respuestaSP/ns1:RowSet0/ns1:RowSet0_Row/ns1:lgr_fecha_registro)
                then <ns2:FECHA_REGISTRO>{fn:data($respuestaSP/ns1:RowSet0/ns1:RowSet0_Row/ns1:lgr_fecha_registro)}</ns2:FECHA_REGISTRO>
                else ()
            }
            {
                if ($respuestaSP/ns1:RowSet0/ns1:RowSet0_Row/ns1:lgr_fecha_procesamiento)
                then <ns2:FECHA_PROCESAMIENTO>{fn:data($respuestaSP/ns1:RowSet0/ns1:RowSet0_Row/ns1:lgr_fecha_procesamiento)}</ns2:FECHA_PROCESAMIENTO>
                else ()
            }
        </ns2:ESTADO_LEGALIZACION>
    </ns2:DatosBasicos>
};

local:func($respuestaSP)
