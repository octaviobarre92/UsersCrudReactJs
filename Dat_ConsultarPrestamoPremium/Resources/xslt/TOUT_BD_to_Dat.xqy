xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://www.sura.com/ConsultarPrestamoPremium";
(:: import schema at "../xsd/Prestamo_Premium.xsd" ::)
declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/ConsultarPrestamo";
(:: import schema at "../DBadapter/ConsultarPrestamo_sp.xsd" ::)

declare variable $PrestamoRespuesta as element() (:: schema-element(ns1:OutputParameters) ::) external;

declare function local:func($PrestamoRespuesta as element() (:: schema-element(ns1:OutputParameters) ::)) as element() (:: schema-element(ns2:OBJETO_PRESTAMOS) ::) {
    <ns2:OBJETO_PRESTAMOS>
        {
            for $RFC_PRESTAMOS_Row in $PrestamoRespuesta/ns1:RFC_PRESTAMOS/ns1:RFC_PRESTAMOS_Row
            return 
            <ns2:PRESTAMOS>
                <ns2:RAMO>{fn:data($RFC_PRESTAMOS_Row/ns1:RAMO)}</ns2:RAMO>
                <ns2:SUBRAMO>{fn:data($RFC_PRESTAMOS_Row/ns1:SUB_RAMO)}</ns2:SUBRAMO>
                <ns2:NUMERO_DE_POLIZA>{fn:concat($RFC_PRESTAMOS_Row/ns1:RAMO,"-", $RFC_PRESTAMOS_Row/ns1:SUB_RAMO,"-", fn:data($RFC_PRESTAMOS_Row/ns1:POLIZA),"-", fn:data($RFC_PRESTAMOS_Row/ns1:SECUENCIA))}</ns2:NUMERO_DE_POLIZA>
                <ns2:NUMERO_PRESTAMO>{fn:data($RFC_PRESTAMOS_Row/ns1:NUMERO_PRESTAMO)}</ns2:NUMERO_PRESTAMO>
                <ns2:SALDO_PRESTAMO>{fn:data($RFC_PRESTAMOS_Row/ns1:SALDO_DE_PRESTAMO)}</ns2:SALDO_PRESTAMO>
                <ns2:TIPO_PRESTAMO>{fn:data($RFC_PRESTAMOS_Row/ns1:TIPO_PRESTAMO)}</ns2:TIPO_PRESTAMO>
                <ns2:STATUS_PRESTAMO>{fn:data($RFC_PRESTAMOS_Row/ns1:STATUS_PRESTAMO)}</ns2:STATUS_PRESTAMO>
                <ns2:OBSERVACION>{fn:data($RFC_PRESTAMOS_Row/ns1:OBSERVACION)}</ns2:OBSERVACION>
                <ns2:FECHA_REGISTRO>{fn:data($RFC_PRESTAMOS_Row/ns1:FECHA_REGISTRO)}</ns2:FECHA_REGISTRO></ns2:PRESTAMOS>
        }
    </ns2:OBJETO_PRESTAMOS>
};

local:func($PrestamoRespuesta)
