xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://www.sura.com/ConsultarReclamoPremium";
(:: import schema at "../xsd/Reclamo_Premium.xsd" ::)
declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/Consultar_Reclamo";
(:: import schema at "../DBadapter/Consultar_Reclamo_sp.xsd" ::)

declare variable $RsReclamo as element() (:: schema-element(ns1:OutputParameters) ::) external;

declare function local:func($RsReclamo as element() (:: schema-element(ns1:OutputParameters) ::)) as element() (:: schema-element(ns2:OBJETO_RECLAMOS) ::) {
    <ns2:OBJETO_RECLAMOS>
        {
            for $RFC_RECLAMOS_Row in $RsReclamo/ns1:RFC_RECLAMOS/ns1:RFC_RECLAMOS_Row
            return 
            <ns2:RECLAMO>
                <ns2:RAMO>{fn:data($RFC_RECLAMOS_Row/ns1:RAMO)}</ns2:RAMO>
                <ns2:SUBRAMO>{fn:data($RFC_RECLAMOS_Row/ns1:SUB_RAMO)}</ns2:SUBRAMO>
                <ns2:NUMERO_DE_POLIZA>{fn:concat($RFC_RECLAMOS_Row/ns1:RAMO,"-", $RFC_RECLAMOS_Row/ns1:SUB_RAMO,"-", fn:data($RFC_RECLAMOS_Row/ns1:POLIZA),"-", fn:data($RFC_RECLAMOS_Row/ns1:SECUENCIA))}</ns2:NUMERO_DE_POLIZA>
                <ns2:SECUENCIA>{fn:data($RFC_RECLAMOS_Row/ns1:SECUENCIA)}</ns2:SECUENCIA>
                <ns2:NO_RECLAMO>{fn:data($RFC_RECLAMOS_Row/ns1:NUMERO_RECLAMO)}</ns2:NO_RECLAMO>
                <ns2:FECHA_REGISTRO>{fn:data($RFC_RECLAMOS_Row/ns1:FECHA_REGISTRO)}</ns2:FECHA_REGISTRO>
                <ns2:STATUS>{fn:data($RFC_RECLAMOS_Row/ns1:STATUS)}</ns2:STATUS>
                <ns2:BENEFICIARIO>{fn:data($RFC_RECLAMOS_Row/ns1:BENEFICIARIO)}</ns2:BENEFICIARIO>
                <ns2:CONCEPTO_RECLAMO>{fn:data($RFC_RECLAMOS_Row/ns1:CONCEPTO)}</ns2:CONCEPTO_RECLAMO>
                <ns2:SALVAMENTO>{fn:data($RFC_RECLAMOS_Row/ns1:SALVAMENTO)}</ns2:SALVAMENTO></ns2:RECLAMO>
        }
        <ns2:OBJETO_RECOBRO>
            {
                for $RFC_RECOBRO_Row in $RsReclamo/ns1:RFC_RECOBRO/ns1:RFC_RECOBRO_Row
                return 
                <ns2:RECOBRO>
                    <ns2:NO_RECOBRO>{fn:data($RFC_RECOBRO_Row/ns1:NO_RECOBRO)}</ns2:NO_RECOBRO>
                    <ns2:FECHA_REGISTRO_RECOBRO>{fn:data($RFC_RECOBRO_Row/ns1:FECHA_REGISTRO_RECOBRO)}</ns2:FECHA_REGISTRO_RECOBRO>
                    <ns2:MONTO_RECOBRO>{fn:data($RFC_RECOBRO_Row/ns1:MONTO)}</ns2:MONTO_RECOBRO>
                    <ns2:NO_RECLAMO>{fn:data($RFC_RECOBRO_Row/ns1:NUMERO_RECLAMO)}</ns2:NO_RECLAMO></ns2:RECOBRO>
            }
        </ns2:OBJETO_RECOBRO>
        <ns2:OBJETO_COBERTURA>
            {
                for $RFC_OBJCOB_REC_Row in $RsReclamo/ns1:RFC_OBJCOB_REC/ns1:RFC_OBJCOB_REC_Row
                return 
                <ns2:COBERTURA>
                    <ns2:CODIGO>{fn:data($RFC_OBJCOB_REC_Row/ns1:CODIGO_COBERTURA)}</ns2:CODIGO>
                    <ns2:DESCRIPCION>{fn:data($RFC_OBJCOB_REC_Row/ns1:DESCRIPCION_COBERTURA)}</ns2:DESCRIPCION>
                    <ns2:MONTO_DEDUCIBLE>{fn:data($RFC_OBJCOB_REC_Row/ns1:MONTO_DE_RESERVA)}</ns2:MONTO_DEDUCIBLE>
                    <ns2:NO_RECLAMO>{fn:data($RFC_OBJCOB_REC_Row/ns1:NUMERO_RECLAMO)}</ns2:NO_RECLAMO></ns2:COBERTURA>
            }
        </ns2:OBJETO_COBERTURA>
    </ns2:OBJETO_RECLAMOS>
};

local:func($RsReclamo)