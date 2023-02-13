xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/AplicarPago";
(:: import schema at "../database/AplicarPago_sp.xsd" ::)

declare variable $ramo as xs:string external;
declare variable $subramo as xs:string external;
declare variable $secuencia as xs:string external;
declare variable $poliza as xs:string external;
declare variable $numelote as xs:string external;
declare variable $fecha as xs:string external;
declare variable $proceso as xs:string external;
declare variable $referencia as xs:string external;
declare variable $subreferencia as xs:string external;
declare variable $salvamento as xs:string external;
declare variable $monto as xs:string external;
declare variable $sucursal as xs:string external;
declare variable $usuario as xs:string external;
declare variable $numeroreferencia as xs:string external;
declare variable $numcaja as xs:string external;
declare variable $detallepago as xs:string external;

declare function local:func($poliza as xs:string, 
                            $numelote as xs:string, 
                            $fecha as xs:string, 
                            $proceso as xs:string, 
                            $referencia as xs:string, 
                            $subreferencia as xs:string, 
                            $salvamento as xs:string, 
                            $monto as xs:string, 
                            $sucursal as xs:string, 
                            $usuario as xs:string, 
                            $numeroreferencia as xs:string, 
                            $numcaja as xs:string,
                            $ramo as xs:string,
                            $subramo as xs:string,
                            $secuencia as xs:string,
                            $detallepago as xs:string) 
                            as element() (:: schema-element(ns1:InputParameters) ::) {
    <ns1:InputParameters>
        <ns1:PV_RAMO>{fn:data($ramo)}</ns1:PV_RAMO>
        <ns1:PV_SUB_RAMO>{fn:data($subramo)}</ns1:PV_SUB_RAMO>
        <ns1:PN_POLIZA>{fn:data($poliza)}</ns1:PN_POLIZA>
        <ns1:PN_SECUENCIA>{fn:data($secuencia)}</ns1:PN_SECUENCIA>
        <ns1:PV_LOTEID>{fn:data($numelote)}</ns1:PV_LOTEID>
        <ns1:PD_FECHA_TRANSACCION>{fn:data($fecha)}</ns1:PD_FECHA_TRANSACCION>
        <ns1:PV_SUCURSAL>{fn:data($sucursal)}</ns1:PV_SUCURSAL>
        <ns1:PV_NUM_CAJA>{fn:data($numcaja)}</ns1:PV_NUM_CAJA>
        <ns1:PN_MONTO>{fn:data($monto)}</ns1:PN_MONTO>
        <ns1:PV_REGISTRO>{fn:data($referencia)}</ns1:PV_REGISTRO>
        <ns1:PV_TIPO_REGISTRO>{fn:data($proceso)}</ns1:PV_TIPO_REGISTRO>
        <ns1:PV_SUB_REGISTRO>{fn:data($subreferencia)}</ns1:PV_SUB_REGISTRO>
        <ns1:PV_SALVAMENTO>{fn:data($salvamento)}</ns1:PV_SALVAMENTO>
        <ns1:PV_USUARIO>{fn:data($usuario)}</ns1:PV_USUARIO>
        <ns1:PV_OBSERVACION>{fn:data($numeroreferencia)}</ns1:PV_OBSERVACION>
        <ns1:PC_DETALLE_PAGO>{fn:data($detallepago)}</ns1:PC_DETALLE_PAGO>
    </ns1:InputParameters>
};

local:func($poliza, $numelote, $fecha, $proceso, $referencia, $subreferencia, $salvamento, $monto, $sucursal, $usuario, $numeroreferencia, $numcaja,$ramo,$subramo,$secuencia,$detallepago)