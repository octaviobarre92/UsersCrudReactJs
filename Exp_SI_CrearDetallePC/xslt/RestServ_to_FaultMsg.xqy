xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://sura.com.pa/expoServiceSOAP/";
(:: import schema at "../WSDL/crearDetallePC.wsdl" ::)

declare variable $codigo as xs:string external;
declare variable $resumen as xs:string external;
declare variable $detalle as xs:string external;

declare function local:func($codigo as xs:string, 
                            $resumen as xs:string, 
                            $detalle as xs:string) 
                            as element() (:: schema-element(ns1:crearDetallePCFaultMsg) ::) {
    <ns1:crearDetallePCFaultMsg>
        <code>{fn:data($codigo)}</code>
        <summary>{fn:data($resumen)}</summary>
        <detail>{fn:data($detalle)}</detail>
    </ns1:crearDetallePCFaultMsg>
};

local:func($codigo, $resumen, $detalle)
