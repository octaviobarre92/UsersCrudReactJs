xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://sura.com.pa/crearDatosBasicosSiniestro/";
(:: import schema at "../../../ComponentesComunes/WSDL_Externos/crearDatosBasicosSiniestro_v1.4.wsdl" ::)

declare variable $nroReclamo as xs:integer external;
declare variable $mensaje as xs:string external;
declare variable $codigo as xs:string external;

declare function local:func($nroReclamo as xs:integer, 
                            $mensaje as xs:string, 
                            $codigo as xs:string) 
                            as element() (:: schema-element(ns1:CrearDatosBasicosSiniestroResponse) ::) {
    <ns1:CrearDatosBasicosSiniestroResponse>
        <ns1:statusMsg>{fn:data($codigo)}</ns1:statusMsg>
        <ns1:descMSG>{fn:data($mensaje)}</ns1:descMSG>
        <ns1:idEnvio>{fn:data($nroReclamo)}</ns1:idEnvio>
    </ns1:CrearDatosBasicosSiniestroResponse>
};

local:func($nroReclamo, $mensaje, $codigo)