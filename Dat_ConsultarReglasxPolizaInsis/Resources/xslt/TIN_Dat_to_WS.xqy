xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.fadata.bg/Insurance_Messages/v3.0/xml/";
(:: import schema at "../../../ComponentesComunesInsis/WSDL/insisPAM.wsdl" ::)

declare variable $numeroPoliza as xs:string external;
declare variable $idPoliza as xs:string external;
declare variable $idAnexo as xs:string external;

declare function local:func($numeroPoliza as xs:string, 
                            $idPoliza as xs:string, 
                            $idAnexo as xs:string) 
                            as element() (:: schema-element(ns1:GetPolicyRulesRq) ::) {
    <GetPolicyRulesRq>
        {
            if ($idPoliza)
                then <PolicyID>{fn:data($idPoliza)}</PolicyID>
            else 
                <PolicyNo>{fn:data($numeroPoliza)}</PolicyNo>
        }
         {
         if ($idAnexo)
          then <AnnexID>{fn:data($idAnexo)}</AnnexID>
        else ()
        }
    </GetPolicyRulesRq>
};

local:func($numeroPoliza, $idPoliza, $idAnexo)
