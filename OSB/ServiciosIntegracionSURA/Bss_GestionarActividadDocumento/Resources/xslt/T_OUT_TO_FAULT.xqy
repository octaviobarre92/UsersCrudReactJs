xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://sura.com.pa/GestionarActividadDocumento/";
(:: import schema at "../wsdl/GestionarActividadDocumento.wsdl" ::)

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $detalle as xs:string external;

declare function local:func($codigo as xs:string, 
                            $mensaje as xs:string, 
                            $detalle as xs:string) 
                            as element() (:: schema-element(ns1:GestionarActividadDocumentoFaultMsg) ::) {
    <ns1:GestionarActividadDocumentoFaultMsg>
        <ns1:code>{fn:data($codigo)}</ns1:code>
        <ns1:summary>{fn:data($mensaje)}</ns1:summary>
        <ns1:detail>{fn:data($detalle)}</ns1:detail>
    </ns1:GestionarActividadDocumentoFaultMsg>
};

local:func($codigo, $mensaje, $detalle)
