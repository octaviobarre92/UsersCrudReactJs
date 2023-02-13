xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://www.sura.com/ConsultarPolizaInsis";
(:: import schema at "../xsd/Poliza_Premium.xsd" ::)
declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/ConsultarPoliza";
(:: import schema at "../DBadapter/ConsultarPoliza_sp.xsd" ::)

declare variable $DBPoliza as element() (:: schema-element(ns1:OutputParameters) ::) external;

declare function local:func($DBPoliza as element() (:: schema-element(ns1:OutputParameters) ::)) as element() (:: schema-element(ns2:OBJETO_POLIZAS) ::) {
    <ns2:OBJETO_POLIZAS>
        {
            for $RFC_POLIZAS_Row in $DBPoliza/ns1:RFC_POLIZAS/ns1:RFC_POLIZAS_Row
            return 
            <ns2:POLIZA>
                <ns2:RAMO>{fn:data($RFC_POLIZAS_Row/ns1:RAMO)}</ns2:RAMO>
                <ns2:SUBRAMO>{fn:data($RFC_POLIZAS_Row/ns1:SUB_RAMO)}</ns2:SUBRAMO>
                <ns2:NUMERO_DE_POLIZA>{fn:concat(fn:data($RFC_POLIZAS_Row/ns1:RAMO),"-",$RFC_POLIZAS_Row/ns1:SUB_RAMO,"-", fn:data($RFC_POLIZAS_Row/ns1:POLIZA), "-",fn:data($RFC_POLIZAS_Row/ns1:SECUENCIA))}</ns2:NUMERO_DE_POLIZA>
                <ns2:NUMEROPOLIZACARATULA>{fn:concat(fn:data($RFC_POLIZAS_Row/ns1:RAMO),"-",$RFC_POLIZAS_Row/ns1:SUB_RAMO,"-", fn:data($RFC_POLIZAS_Row/ns1:POLIZA), "-",fn:data($RFC_POLIZAS_Row/ns1:SECUENCIA))}</ns2:NUMEROPOLIZACARATULA>
                <ns2:CORE>P</ns2:CORE>
                <ns2:IDENTIFICACION_CLIENTE>{fn:data($RFC_POLIZAS_Row/ns1:ASEGURADO)}</ns2:IDENTIFICACION_CLIENTE>
                <ns2:CODIGO_CLIENTE>{fn:data($RFC_POLIZAS_Row/ns1:ASEGURADO)}</ns2:CODIGO_CLIENTE>
                <ns2:VIGENCIA_INICIAL>{fn:data($RFC_POLIZAS_Row/ns1:DESDE)}</ns2:VIGENCIA_INICIAL>
                <ns2:VIGENCIA_FINAL>{fn:data($RFC_POLIZAS_Row/ns1:HASTA)}</ns2:VIGENCIA_FINAL>
                <ns2:ESTADO>{fn:data($RFC_POLIZAS_Row/ns1:ESTADO)}</ns2:ESTADO>
                <ns2:PRIMA>{fn:sum(fn:data($RFC_POLIZAS_Row/ns1:PRIMA_TOTAL) - fn:sum(fn:data($RFC_POLIZAS_Row/ns1:IMPUESTO2), fn:data($RFC_POLIZAS_Row/ns1:IMPUESTO1)))}</ns2:PRIMA>
                <ns2:IMPUESTO>{fn:sum(fn:data($RFC_POLIZAS_Row/ns1:IMPUESTO2), fn:data($RFC_POLIZAS_Row/ns1:IMPUESTO1))}</ns2:IMPUESTO>
                <ns2:PRIMA_TOTAL>{fn:data($RFC_POLIZAS_Row/ns1:PRIMA_TOTAL)}</ns2:PRIMA_TOTAL>
                <ns2:PRIMA_LETRA>{fn:data($RFC_POLIZAS_Row/ns1:PRIMA_PERIODICA)}</ns2:PRIMA_LETRA>
                <ns2:SALDO_TOTAL>{fn:data($RFC_POLIZAS_Row/ns1:SALDO)}</ns2:SALDO_TOTAL>
                <ns2:DESCTO_PRONTO_PAGO>{fn:data($RFC_POLIZAS_Row/ns1:DESCUENTO)}</ns2:DESCTO_PRONTO_PAGO>
                <ns2:PERIODICIDAD>{fn:data($RFC_POLIZAS_Row/ns1:FORMA_DE_PAGO)}</ns2:PERIODICIDAD>
                <ns2:DIA>{fn:data($RFC_POLIZAS_Row/ns1:DIA_DE_COBRO)}</ns2:DIA>
                <ns2:MOROSIDAD>
                    <ns2:NO_EXIGIBLE>{fn:data($RFC_POLIZAS_Row/ns1:NO_VENCIDO)}</ns2:NO_EXIGIBLE>
                    <ns2:CORRIENTE>{fn:data($RFC_POLIZAS_Row/ns1:SALDO_CORRIENTE)}</ns2:CORRIENTE>
                    <ns2:VENCIDO>{fn:data($RFC_POLIZAS_Row/ns1:VENCIDO)}</ns2:VENCIDO>
                    <ns2:SALDO_30>{fn:data($RFC_POLIZAS_Row/ns1:SALDO_30)}</ns2:SALDO_30>
                    <ns2:SALDO_60>{fn:data($RFC_POLIZAS_Row/ns1:SALDO_60)}</ns2:SALDO_60>
                    <ns2:SALOD_90>{fn:data($RFC_POLIZAS_Row/ns1:SALDO_90)}</ns2:SALOD_90>
                    <ns2:SALDO_120MAS>{fn:data($RFC_POLIZAS_Row/ns1:SALDO_120)}</ns2:SALDO_120MAS>
                </ns2:MOROSIDAD>
                </ns2:POLIZA>
        }
    </ns2:OBJETO_POLIZAS>
};

local:func($DBPoliza)
