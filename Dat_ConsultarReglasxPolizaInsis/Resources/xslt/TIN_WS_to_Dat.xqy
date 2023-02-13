xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://ws.hlt.pa.sura.insis.com/";
(:: import schema at "../nxsd/Regla_x_Poliza_Insis_RS.xsd" ::)
declare namespace ns1="http://www.fadata.bg/Insurance_Messages/v3.0/xml/";
(:: import schema at "../../../ComponentesComunesInsis/WSDL/insisPAM.wsdl" ::)

declare variable $Entrada as element() (:: schema-element(ns1:GetPolicyRulesRs) ::) external;

declare function local:func($Entrada as element() (:: schema-element(ns1:GetPolicyRulesRs) ::)) as element() (:: schema-element(ns2:CONDICIONES_POLIZA) ::) {
    <ns2:CONDICIONES_POLIZA>
        {
            for $PolicyRule in $Entrada/ns1:PolicyRules/ns1:PolicyRule
            return 
            <ns2:CONDICION_POLIZA>
                {
                    if ($PolicyRule/ns1:PolicyRuleID)
                    then <ns2:ID_CONDICION>{fn:data($PolicyRule/ns1:PolicyRuleID)}</ns2:ID_CONDICION>
                    else ()
                }
                <ns2:REGLA_CFGID>{fn:data($PolicyRule/ns1:RuleCfgID)}</ns2:REGLA_CFGID>
                {
                    if ($PolicyRule/ns1:PolicyID)
                    then <ns2:POLIZA_ID>{fn:data($PolicyRule/ns1:PolicyID)}</ns2:POLIZA_ID>
                    else ()
                }
                {
                    if ($PolicyRule/ns1:AnnexID)
                    then <ns2:ANEXO_ID>{fn:data($PolicyRule/ns1:AnnexID)}</ns2:ANEXO_ID>
                    else ()
                }
                {
                    if ($PolicyRule/ns1:AuxAnnexID)
                    then <ns2:ANEXO_AUXILIAR_ID>{fn:data($PolicyRule/ns1:AuxAnnexID)}</ns2:ANEXO_AUXILIAR_ID>
                    else ()
                }
                {
                    if ($PolicyRule/ns1:InsuredID)
                    then <ns2:ASEGURADO_ID>{fn:data($PolicyRule/ns1:InsuredID)}</ns2:ASEGURADO_ID>
                    else ()
                }
                {
                    if ($PolicyRule/ns1:GroupID)
                    then <ns2:GRUPO_ID>{fn:data($PolicyRule/ns1:GroupID)}</ns2:GRUPO_ID>
                    else ()
                }
                {
                    if ($PolicyRule/ns1:SubGroupID)
                    then <ns2:SUBGRUPO_ID>{fn:data($PolicyRule/ns1:SubGroupID)}</ns2:SUBGRUPO_ID>
                    else ()
                }
                {
                    if ($PolicyRule/ns1:PackageCode)
                    then <ns2:PAQUETE_CODIGO>{fn:data($PolicyRule/ns1:PackageCode)}</ns2:PAQUETE_CODIGO>
                    else ()
                }
                {
                    if ($PolicyRule/ns1:CoverCode)
                    then <ns2:CODIGO_COBERTURA>{fn:data($PolicyRule/ns1:CoverCode)}</ns2:CODIGO_COBERTURA>
                    else ()
                }
                {
                    if ($PolicyRule/ns1:ClaimStage)
                    then <ns2:ESTADO_RECLAMO>{fn:data($PolicyRule/ns1:ClaimStage)}</ns2:ESTADO_RECLAMO>
                    else ()
                }
                {
                    if ($PolicyRule/ns1:ClaimType)
                    then <ns2:TIPO_RECLAMO>{fn:data($PolicyRule/ns1:ClaimType)}</ns2:TIPO_RECLAMO>
                    else ()
                }
                {
                    if ($PolicyRule/ns1:RqType)
                    then <ns2:TIPO_SOLICITUD>{fn:data($PolicyRule/ns1:RqType)}</ns2:TIPO_SOLICITUD>
                    else ()
                }
                {
                    if ($PolicyRule/ns1:InNetwork)
                    then <ns2:RED>{fn:data($PolicyRule/ns1:InNetwork)}</ns2:RED>
                    else ()
                }
                {
                    if ($PolicyRule/ns1:ValidFrom)
                    then <ns2:FECHA_INICIO>{fn:data($PolicyRule/ns1:ValidFrom)}</ns2:FECHA_INICIO>
                    else ()
                }
                {
                    if ($PolicyRule/ns1:ValidFromTime)
                    then <ns2:HORA_INICIO>{fn:data($PolicyRule/ns1:ValidFromTime)}</ns2:HORA_INICIO>
                    else ()
                }
                {
                    if ($PolicyRule/ns1:ValidTo)
                    then <ns2:FECHA_FIN>{fn:data($PolicyRule/ns1:ValidTo)}</ns2:FECHA_FIN>
                    else ()
                }
                {
                    if ($PolicyRule/ns1:ValidToTime)
                    then <ns2:HORA_FIN>{fn:data($PolicyRule/ns1:ValidToTime)}</ns2:HORA_FIN>
                    else ()
                }
                {
                    if ($PolicyRule/ns1:RuleStatus)
                    then <ns2:ESTATUS>{fn:data($PolicyRule/ns1:RuleStatus)}</ns2:ESTATUS>
                    else ()
                }
                <ns2:ATRIBUTOS_CONDICION_POLIZA>
                    {
                        for $PolicyRuleAttribute in $PolicyRule/ns1:PolicyRuleAttributes/ns1:PolicyRuleAttribute
                        return 
                        <ns2:ATRIBUTO_CONDICION_POLIZA>
                            {
                                if ($PolicyRuleAttribute/ns1:PolicyRuleID)
                                then <ns2:ID_CONDICION>{fn:data($PolicyRuleAttribute/ns1:PolicyRuleID)}</ns2:ID_CONDICION>
                                else ()
                            }
                            <ns2:ORDEN_ATRIBUTO>{fn:data($PolicyRuleAttribute/ns1:AttrOrder)}</ns2:ORDEN_ATRIBUTO>
                            <ns2:TIPO_DEFINICION>{fn:data($PolicyRuleAttribute/ns1:DefinitionType)}</ns2:TIPO_DEFINICION>
                            {
                                if ($PolicyRuleAttribute/ns1:AttrCode)
                                then <ns2:CODIGO_ATRIBUTO>{fn:data($PolicyRuleAttribute/ns1:AttrCode)}</ns2:CODIGO_ATRIBUTO>
                                else ()
                            }
                            {
                                if ($PolicyRuleAttribute/ns1:ValueType)
                                then <ns2:TIPO_VALOR>{fn:data($PolicyRuleAttribute/ns1:ValueType)}</ns2:TIPO_VALOR>
                                else ()
                            }
                            {
                                if ($PolicyRuleAttribute/ns1:RuleValue)
                                then <ns2:REGLA_VALOR>{fn:data($PolicyRuleAttribute/ns1:RuleValue)}</ns2:REGLA_VALOR>
                                else ()
                            }
                            {
                                if ($PolicyRuleAttribute/ns1:ReRuleCode)
                                then <ns2:REGLA_CODIGO>{fn:data($PolicyRuleAttribute/ns1:ReRuleCode)}</ns2:REGLA_CODIGO>
                                else ()
                            }
                            {
                                if ($PolicyRuleAttribute/ns1:ValueDim)
                                then <ns2:VALOR_DIM>{fn:data($PolicyRuleAttribute/ns1:ValueDim)}</ns2:VALOR_DIM>
                                else ()
                            }
                            {
                                if ($PolicyRuleAttribute/ns1:Currency)
                                then <ns2:MONEDA>{fn:data($PolicyRuleAttribute/ns1:Currency)}</ns2:MONEDA>
                                else ()
                            }</ns2:ATRIBUTO_CONDICION_POLIZA>
                    }
                </ns2:ATRIBUTOS_CONDICION_POLIZA>
                <ns2:VALORES_CONDICION_POLIZA>
                    {
                        for $PolicyRuleValue in $PolicyRule/ns1:PolicyRuleValues/ns1:PolicyRuleValue
                        return 
                        <ns2:VALOR_CONDICION_POLIZA>
                            {
                                if ($PolicyRuleValue/ns1:PolicyRuleID)
                                then <ns2:ID_CONDICION>{fn:data($PolicyRuleValue/ns1:PolicyRuleID)}</ns2:ID_CONDICION>
                                else ()
                            }
                            <ns2:REGLA_VALOR>{fn:data($PolicyRuleValue/ns1:RuleValue)}</ns2:REGLA_VALOR>
                            {
                                if ($PolicyRuleValue/ns1:ValueDim)
                                then <ns2:VALOR_DIM>{fn:data($PolicyRuleValue/ns1:ValueDim)}</ns2:VALOR_DIM>
                                else ()
                            }
                            {
                                if ($PolicyRuleValue/ns1:Currency)
                                then <ns2:MONEDA>{fn:data($PolicyRuleValue/ns1:Currency)}</ns2:MONEDA>
                                else ()
                            }
                            {
                                if ($PolicyRuleValue/ns1:ValueType)
                                then <ns2:TIPO_VALOR>{fn:data($PolicyRuleValue/ns1:ValueType)}</ns2:TIPO_VALOR>
                                else ()
                            }
                            {
                                if ($PolicyRuleValue/ns1:Included)
                                then <ns2:INCLUIDO>{fn:data($PolicyRuleValue/ns1:Included)}</ns2:INCLUIDO>
                                else ()
                            }</ns2:VALOR_CONDICION_POLIZA>
                    }
                </ns2:VALORES_CONDICION_POLIZA></ns2:CONDICION_POLIZA>
        }
    </ns2:CONDICIONES_POLIZA>
};

local:func($Entrada)
