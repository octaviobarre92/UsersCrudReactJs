xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://www.fadata.bg/Insurance_Messages/v3.0/xml/";
(:: import schema at "../../../ComponentesComunesInsis/WSDL/insisPAM.wsdl" ::)
declare namespace ns1="http://www.sura.com/ConfirmarSolicitudPoliza";
(:: import schema at "../NXSD/Confirmar_Solicitud_Poliza_RQ.xsd" ::)

declare variable $rqPoliza as element() (:: schema-element(ns1:OBJETO_CONVERTIR_POLIZA) ::) external;

declare function local:func($rqPoliza as element() (:: schema-element(ns1:OBJETO_CONVERTIR_POLIZA) ::)) as element() (:: schema-element(ns2:ConfirmApplicationRq) ::) {
    <ConfirmApplicationRq>

            {
            if (fn:string-length(fn:data($rqPoliza/ns1:CODIGO_POLIZA))>0) then
             <PolicyNo>{fn:data($rqPoliza/ns1:CODIGO_POLIZA)}</PolicyNo>
                else
             <PolicyID>{fn:data($rqPoliza/ns1:NUMERO_DE_POLIZA)}</PolicyID>
            }   
    </ConfirmApplicationRq>  
};

local:func($rqPoliza)
