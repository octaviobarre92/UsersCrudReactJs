xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://www.sura.com/ConsultarPolizaInsis";
(:: import schema at "../xsd/ObjetoAsegurado_Premium.xsd" ::)
declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/ConsultarObjetoAseg";
(:: import schema at "../DBadapter/ConsultarObjetoAseg_sp.xsd" ::)

declare variable $BdRespuesta as element() (:: schema-element(ns1:OutputParameters) ::) external;

declare function local:func($BdRespuesta as element() (:: schema-element(ns1:OutputParameters) ::)) as element() (:: schema-element(ns2:OBJETO_RIESGOS) ::) {
    <ns2:OBJETO_RIESGOS>
        {
            for $RFC_OBJ_ASEGURADO_Row in $BdRespuesta/ns1:RFC_OBJ_ASEGURADO/ns1:RFC_OBJ_ASEGURADO_Row
            return 
            <ns2:OBJETO_ASEGURADO>
                <ns2:RAMO>{fn:data($RFC_OBJ_ASEGURADO_Row/ns1:RAMO)}</ns2:RAMO>
                <ns2:SUBRAMO>{fn:data($RFC_OBJ_ASEGURADO_Row/ns1:SUB_RAMO)}</ns2:SUBRAMO>
                <ns2:NUMERO_DE_POLIZA>{fn:concat($RFC_OBJ_ASEGURADO_Row/ns1:RAMO,"-",$RFC_OBJ_ASEGURADO_Row/ns1:SUB_RAMO,"-", fn:data($RFC_OBJ_ASEGURADO_Row/ns1:POLIZA),"-", fn:data($RFC_OBJ_ASEGURADO_Row/ns1:SECUENCIA))}</ns2:NUMERO_DE_POLIZA>
                <ns2:CORE>P</ns2:CORE>
                <ns2:CODIGO_OBJETO>{fn:data($RFC_OBJ_ASEGURADO_Row/ns1:UNIDAD)}</ns2:CODIGO_OBJETO>
                <ns2:DESCRIPCION_OBJETO>{fn:data($RFC_OBJ_ASEGURADO_Row/ns1:DESCRIPCION_OBJETO)}</ns2:DESCRIPCION_OBJETO>
                <ns2:SUMA_ASEGURADA>{fn:data($RFC_OBJ_ASEGURADO_Row/ns1:SUMA_ASEGURADA)}</ns2:SUMA_ASEGURADA>
                <ns2:AUTO>
                    <ns2:NUMERO_PLACA>{fn:data($RFC_OBJ_ASEGURADO_Row/ns1:PLACA)}</ns2:NUMERO_PLACA>
                    <ns2:ANNIO>{fn:data($RFC_OBJ_ASEGURADO_Row/ns1:ANO)}</ns2:ANNIO>
                    <ns2:MARCA>{fn:data($RFC_OBJ_ASEGURADO_Row/ns1:MARCA)}</ns2:MARCA>
                    <ns2:MODELO>{fn:data($RFC_OBJ_ASEGURADO_Row/ns1:MODELO)}</ns2:MODELO>
                    <ns2:TIPO>{fn:data($RFC_OBJ_ASEGURADO_Row/ns1:TIPO)}</ns2:TIPO>
                    <ns2:COLOR>{fn:data($RFC_OBJ_ASEGURADO_Row/ns1:COLOR)}</ns2:COLOR>
                    <ns2:NO_MOTOR>{fn:data($RFC_OBJ_ASEGURADO_Row/ns1:MOTOR)}</ns2:NO_MOTOR>
                    <ns2:ACTIVIDAD>{fn:data($RFC_OBJ_ASEGURADO_Row/ns1:CHASIS)}</ns2:ACTIVIDAD>
                    <ns2:CHASIS>{fn:data($RFC_OBJ_ASEGURADO_Row/ns1:ACTIVIDAD)}</ns2:CHASIS>
                </ns2:AUTO>
            </ns2:OBJETO_ASEGURADO>
        }
        <ns2:OBJETO_COBERTURA>
            {
                for $RFC_OBJ_ASEG_COBERTURAS_Row in $BdRespuesta/ns1:RFC_OBJ_ASEG_COBERTURAS/ns1:RFC_OBJ_ASEG_COBERTURAS_Row
                return 
                <ns2:COBERTURA>
                    <ns2:NUMERO_DE_POLIZA>{fn:concat(fn:data($RFC_OBJ_ASEG_COBERTURAS_Row/ns1:RAMO),"-", $RFC_OBJ_ASEG_COBERTURAS_Row/ns1:SUB_RAMO,"-", fn:data($RFC_OBJ_ASEG_COBERTURAS_Row/ns1:POLIZA),"-", fn:data($RFC_OBJ_ASEG_COBERTURAS_Row/ns1:SECUENCIA))}</ns2:NUMERO_DE_POLIZA>
                    <ns2:NUMERO_PLACA>{fn:data($RFC_OBJ_ASEG_COBERTURAS_Row/ns1:PLACA)}</ns2:NUMERO_PLACA>
                    <ns2:CODIGO_COBERTURA>{fn:data($RFC_OBJ_ASEG_COBERTURAS_Row/ns1:COBERTURA)}</ns2:CODIGO_COBERTURA>
                    <ns2:DESCRIPCION_COBERTURA>{fn:data($RFC_OBJ_ASEG_COBERTURAS_Row/ns1:NOMBRE)}</ns2:DESCRIPCION_COBERTURA>
                    <ns2:LIMITE_COBERTURA>{fn:data($RFC_OBJ_ASEG_COBERTURAS_Row/ns1:LIMITE)}</ns2:LIMITE_COBERTURA>
                    <ns2:PRIMA_COBERTURA>{fn:data($RFC_OBJ_ASEG_COBERTURAS_Row/ns1:PRIMA)}</ns2:PRIMA_COBERTURA>
                    <ns2:DEDUCIBLE_COBERTURA>{fn:data($RFC_OBJ_ASEG_COBERTURAS_Row/ns1:DEDUCIBLE)}</ns2:DEDUCIBLE_COBERTURA>
                    <ns2:TASA_COBERTURA>{fn:data($RFC_OBJ_ASEG_COBERTURAS_Row/ns1:TARIFA)}</ns2:TASA_COBERTURA></ns2:COBERTURA>
            }
        </ns2:OBJETO_COBERTURA>
    </ns2:OBJETO_RIESGOS>
};

local:func($BdRespuesta)
