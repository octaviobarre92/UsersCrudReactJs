xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/RegistrarBitacoraLegalizacionDS";
(:: import schema at "../Database/RegistrarBitacoraLegalizacionDS_sp.xsd" ::)

declare variable $numPoliza as xs:string external;
declare variable $numReferencia as xs:string external;
declare variable $fechaOperacion as xs:string external;
declare variable $monto as xs:string external;
declare variable $tipoPago as xs:string external;
declare variable $numIdentificacion as xs:string external;
declare variable $tipoIdentificacion as xs:string external;
declare variable $codigoRespuesta as xs:string external;
declare variable $mensajeRespuesta as xs:string external;
declare variable $busRequest as xs:string external;
declare variable $origen as xs:string external;
declare function local:func($numPoliza as xs:string,
$numReferencia as xs:string ,
$fechaOperacion as xs:string ,
$monto as xs:string ,
$tipoPago as xs:string ,
$numIdentificacion as xs:string ,
$tipoIdentificacion as xs:string ,
$codigoRespuesta as xs:string ,
$mensajeRespuesta as xs:string ,
$busRequest as xs:string ,
$origen) as element() (:: schema-element(ns1:InputParameters) ::) {
    <ns1:InputParameters>
        <ns1:PolicyNumber>{fn:data($numPoliza)}</ns1:PolicyNumber>
        <ns1:TransactionNumber>{fn:data($numReferencia)}</ns1:TransactionNumber>
        <ns1:OperationDate>{fn:data($fechaOperacion)}</ns1:OperationDate>
        <ns1:Amount>{fn:data($monto)}</ns1:Amount>
        <ns1:PaymentType>{fn:data($tipoPago)}</ns1:PaymentType>
        <ns1:ClientIdentificationNumber>{fn:data($numIdentificacion)}</ns1:ClientIdentificationNumber>
        <ns1:ClientIdentificationType>{fn:data($tipoIdentificacion)}</ns1:ClientIdentificationType>
        <ns1:ResponseCode>{fn:data($codigoRespuesta)}</ns1:ResponseCode>
        <ns1:ResponseDescription>{fn:data($mensajeRespuesta)}</ns1:ResponseDescription>
        <ns1:BusRequestJson>{fn:data($busRequest)}</ns1:BusRequestJson>
        <ns1:Source>{fn:data($origen)}</ns1:Source>
    </ns1:InputParameters>
};

local:func($numPoliza,
$numReferencia,
$fechaOperacion,
$monto,
$tipoPago,
$numIdentificacion,
$tipoIdentificacion,
$codigoRespuesta,
$mensajeRespuesta,
$busRequest,
$origen)
