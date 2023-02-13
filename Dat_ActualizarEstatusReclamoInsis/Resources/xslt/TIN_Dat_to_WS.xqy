xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://ws.hlt.pa.sura.insis.com/";
(:: import schema at "../WSDL/Reclamos.xsd" ::)

declare variable $claim_no as xs:string external;
declare variable $claim_id as xs:integer external;
declare variable $claim_status as xs:string external;
declare variable $proveedor as xs:string external;

declare function local:func($claim_no as xs:string, 
                            $claim_id as xs:integer, 
                            $claim_status as xs:string, 
                            $proveedor as xs:string) 
                            as element() (:: schema-element(ns1:UpdateClaimStHltRq) ::) {
    <ns1:UpdateClaimStHltRq>
        <CLAIM>
            <CLAIM_ID>{fn:data($claim_id)}</CLAIM_ID>
            <CLAIM_NO>{fn:data($claim_no)}</CLAIM_NO>
            <CLAIM_ST>{fn:data($claim_status)}</CLAIM_ST>
            <PROVIDER_ID>{fn:data($proveedor)}</PROVIDER_ID>
        </CLAIM>
    </ns1:UpdateClaimStHltRq>
};

local:func($claim_no, $claim_id, $claim_status, $proveedor)