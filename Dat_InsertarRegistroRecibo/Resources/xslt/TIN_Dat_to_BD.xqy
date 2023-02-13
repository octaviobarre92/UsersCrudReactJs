xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/InsertarRegistroRecibo";
(:: import schema at "../dbAdapter/InsertarRegistroRecibo_sp.xsd" ::)

declare variable $poliza as xs:string external;
declare variable $status as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $idtransaccion as xs:string external;

declare function local:func($poliza as xs:string, 
                            $status as xs:string, 
                            $idtransaccion as xs:string,
                            $mensaje as xs:string)
                            as element() (:: schema-element(ns1:InputParameters) ::) {
    <ns1:InputParameters>
        <ns1:NUMEROPOLIZA>{fn:data($poliza)}</ns1:NUMEROPOLIZA>
        <ns1:MENSAJE>{fn:data($mensaje)}</ns1:MENSAJE>
        <ns1:ESTADO>{fn:data($status)}</ns1:ESTADO>
        <ns1:TRANSACCIONOSB>{fn:data($idtransaccion)}</ns1:TRANSACCIONOSB>
    </ns1:InputParameters>
};

local:func($poliza, $status, $idtransaccion, $mensaje)
