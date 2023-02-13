xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.fadata.bg/Insurance_Messages/v3.0/xml/";
(:: import schema at "../../../ComponentesComunesInsis/WSDL/insisPDM.wsdl" ::)

declare variable $id_insis as xs:string external;
declare variable $identificacion as xs:string external;
declare variable $rol as xs:string external;

declare function local:func($id_insis as xs:string, 
                            $rol as xs:string,
                            $identificacion as xs:string) 
                            as element() (:: schema-element(ns1:RegisterNewPersonRoleRq) ::) {
    <RegisterNewPersonRoleRq>
       
        <Roles>
            <Role>
                {
                    if ($id_insis) then 
                        <ManID>{fn:data($id_insis)}</ManID>
                    else
                        (
                        <PID>{fn:data($identificacion)}</PID>
                        )
                }
                <RoleId>{fn:data($rol)}</RoleId>
            </Role>
        </Roles>
    </RegisterNewPersonRoleRq>
};

local:func($id_insis, $rol, $identificacion)
