xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)



declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/AplicaPago";
(:: import schema at "../database/AplicaPago_sp.xsd" ::)declare variable $proceso as xs:string external;
declare variable $poliza as xs:string external;
declare variable $identificacion as xs:string external;
declare variable $referencia as xs:string external;
declare variable $subreferencia as xs:string external;
declare variable $monto as xs:string external;
declare variable $usuario as xs:string external;
declare variable $sucursal as xs:string external;
declare variable $numeroref as xs:string external;
declare variable $sistemaorigen as xs:string external;
declare variable $detallepago as xs:string external;

declare function local:func($proceso as xs:string, 
                             $poliza as xs:string, 
                             $identificacion as xs:string, 
                             $referencia as xs:string, 
                             $subreferencia as xs:string, 
                             $monto as xs:string, 
                             $usuario as xs:string, 
                             $sucursal as xs:string, 
                             $numeroref as xs:string,
                             $sistemaorigen as xs:string,
                             $detallepago as xs:string) 
                             as element() (:: schema-element(ns1:InputParameters) ::) {
    <ns1:InputParameters>
        <ns1:PI_TIPOOPER>{fn:data($proceso)}</ns1:PI_TIPOOPER>
        <ns1:PI_POLICYID>{fn:data($poliza)}</ns1:PI_POLICYID>
        <ns1:PI_EGNCLIENT>{fn:data($identificacion)}</ns1:PI_EGNCLIENT>
        <ns1:PI_AMOUNTVALUE>{fn:data($monto)}</ns1:PI_AMOUNTVALUE>
        <ns1:PI_REFPAYID>{fn:data($referencia)}</ns1:PI_REFPAYID>
        <ns1:PI_SUBREFID>{fn:data($subreferencia)}</ns1:PI_SUBREFID>
        <ns1:PI_USERPAY>{fn:data($usuario)}</ns1:PI_USERPAY>
        <ns1:PI_BRANCHOFFICE>{fn:data($sucursal)}</ns1:PI_BRANCHOFFICE>
        <ns1:PI_APPPAY>{fn:data($sistemaorigen)}</ns1:PI_APPPAY>
        <ns1:PI_REFERENCE>{fn:data($numeroref)}</ns1:PI_REFERENCE>
        <ns1:PI_PAYMENTDETAIL>{fn:data($detallepago)}</ns1:PI_PAYMENTDETAIL>
    </ns1:InputParameters>
};

local:func($proceso, $poliza, $identificacion, $referencia, $subreferencia, $monto, $usuario, $sucursal, $numeroref,$sistemaorigen,$detallepago)
