xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/RegistrarBitacoraAuto";
(:: import schema at "../DBAdapter/RegistrarBitacoraAuto_sp.xsd" ::)

declare variable $tarjeta as xs:string external;
declare variable $core as xs:string external;
declare variable $asegurado as xs:string external;
declare variable $status as xs:string external;
declare variable $codigo_resp as xs:string external;
declare variable $mensaje_resp as xs:string external;
declare variable $identificacion as xs:string external;
declare variable $request as xs:string external;

declare function local:func($tarjeta as xs:string, 
                            $core as xs:string, 
                            $asegurado as xs:string, 
                            $status as xs:string, 
                            $codigo_resp as xs:string, 
                            $mensaje_resp as xs:string, 
                            $identificacion as xs:string,
                            $request as xs:string) 
                            as element() (:: schema-element(ns1:InputParameters) ::) {
    <ns1:InputParameters>
        <ns1:card_token>{fn:data($tarjeta)}</ns1:card_token>
        <ns1:core>{fn:data($core)}</ns1:core>
        <ns1:insurance>{fn:data($asegurado)}</ns1:insurance>
        <ns1:status>{fn:data($status)}</ns1:status>
        <ns1:response_code>{fn:data($codigo_resp)}</ns1:response_code>
        <ns1:response_description>{fn:data($mensaje_resp)}</ns1:response_description>
        <ns1:identification>{fn:data($identificacion)}</ns1:identification>
        <ns1:request>{fn:data($request)}</ns1:request>        
    </ns1:InputParameters>
};

local:func($tarjeta, $core, $asegurado, $status, $codigo_resp, $mensaje_resp, $identificacion,$request)