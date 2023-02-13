xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://ws.hlt.pa.sura.insis.com/";
(:: import schema at "../nxsd/Regla_x_Poliza_Insis_RQ.xsd" ::)
declare namespace ns2="http://www.fadata.bg/Insurance_Messages/v3.0/xml/";
(:: import schema at "../../../ComponentesComunesInsis/WSDL/xsd/insis/Insis_PAM_v3.0.xsd" ::)

declare variable $Entrada as element() (:: schema-element(ns1:CONDICIONES_POLIZA) ::) external;
declare variable $idpoliza as xs:string external;

declare function local:func($Entrada as element() (:: schema-element(ns1:CONDICIONES_POLIZA) ::), 
                            $idpoliza as xs:string) 
                            as element() (:: schema-element(ns2:SetPolicyRulesRq) ::) {
    <SetPolicyRulesRq suppressPremiumCalculation="true">
        <PolicyID>{fn:data($idpoliza)}</PolicyID>
        <PolicyRules>              
            {
                for $CONDICION_POLIZA in $Entrada/ns1:CONDICION_POLIZA
                return 
                <PolicyRule>
                    {
                        if ($CONDICION_POLIZA/ns1:ID_CONDICION)
                        then <PolicyRuleID>{fn:data($CONDICION_POLIZA/ns1:ID_CONDICION)}</PolicyRuleID>
                        else ()
                    }
                    <RuleCfgID>{fn:data($CONDICION_POLIZA/ns1:REGLA_CFGID)}</RuleCfgID>
                    {
                        if ($CONDICION_POLIZA/ns1:POLIZA_ID)
                        then <PolicyID>{fn:data($CONDICION_POLIZA/ns1:POLIZA_ID)}</PolicyID>
                        else ()
                    }
                    {
                        if ($CONDICION_POLIZA/ns1:ANEXO_ID)
                        then <AnnexID>{fn:data($CONDICION_POLIZA/ns1:ANEXO_ID)}</AnnexID>
                        else ()
                    }
                    {
                        if ($CONDICION_POLIZA/ns1:ANEXO_AUXILIAR_ID)
                        then <AuxAnnexID>{fn:data($CONDICION_POLIZA/ns1:ANEXO_AUXILIAR_ID)}</AuxAnnexID>
                        else ()
                    }
                    {
                        if ($CONDICION_POLIZA/ns1:ASEGURADO_ID)
                        then <InsuredID>{fn:data($CONDICION_POLIZA/ns1:ASEGURADO_ID)}</InsuredID>
                        else ()
                    }
                    {
                        if ($CONDICION_POLIZA/ns1:GRUPO_ID)
                        then <GroupID>{fn:data($CONDICION_POLIZA/ns1:GRUPO_ID)}</GroupID>
                        else ()
                    }
                    {
                        if ($CONDICION_POLIZA/ns1:SUBGRUPO_ID)
                        then <SubGroupID>{fn:data($CONDICION_POLIZA/ns1:SUBGRUPO_ID)}</SubGroupID>
                        else ()
                    }
                    {
                        if ($CONDICION_POLIZA/ns1:PAQUETE_CODIGO)
                        then <PackageCode>{fn:data($CONDICION_POLIZA/ns1:PAQUETE_CODIGO)}</PackageCode>
                        else ()
                    }
                    {
                        if ($CONDICION_POLIZA/ns1:CODIGO_COBERTURA)
                        then <CoverCode>{fn:data($CONDICION_POLIZA/ns1:CODIGO_COBERTURA)}</CoverCode>
                        else ()
                    }
                    {
                        if ($CONDICION_POLIZA/ns1:ESTADO_RECLAMO)
                        then <ClaimStage>{fn:data($CONDICION_POLIZA/ns1:ESTADO_RECLAMO)}</ClaimStage>
                        else ()
                    }
                    {
                        if ($CONDICION_POLIZA/ns1:TIPO_RECLAMO)
                        then <ClaimType>{fn:data($CONDICION_POLIZA/ns1:TIPO_RECLAMO)}</ClaimType>
                        else ()
                    }
                    {
                        if ($CONDICION_POLIZA/ns1:TIPO_SOLICITUD)
                        then <RqType>{fn:data($CONDICION_POLIZA/ns1:TIPO_SOLICITUD)}</RqType>
                        else ()
                    }
                    {
                        if ($CONDICION_POLIZA/ns1:RED)
                        then <InNetwork>{fn:data($CONDICION_POLIZA/ns1:RED)}</InNetwork>
                        else ()
                    }
                    {
                        if ($CONDICION_POLIZA/ns1:FECHA_INICIO)
                        then <ValidFrom>{fn:data($CONDICION_POLIZA/ns1:FECHA_INICIO)}</ValidFrom>
                        else ()
                    }
                    {
                        if ($CONDICION_POLIZA/ns1:HORA_INICIO)
                        then <ValidFromTime>{fn:data($CONDICION_POLIZA/ns1:HORA_INICIO)}</ValidFromTime>
                        else ()
                    }
                    {
                        if ($CONDICION_POLIZA/ns1:FECHA_FIN)
                        then <ValidTo>{fn:data($CONDICION_POLIZA/ns1:FECHA_FIN)}</ValidTo>
                        else ()
                    }
                    {
                        if ($CONDICION_POLIZA/ns1:HORA_FIN)
                        then <ValidToTime>{fn:data($CONDICION_POLIZA/ns1:HORA_FIN)}</ValidToTime>
                        else ()
                    }
                    {
                        if ($CONDICION_POLIZA/ns1:ESTATUS)
                        then <RuleStatus>{fn:data($CONDICION_POLIZA/ns1:ESTATUS)}</RuleStatus>
                        else ()
                    }
                    {
                        if ($CONDICION_POLIZA/ns1:ATRIBUTOS_CONDICION_POLIZA/ns1:ATRIBUTO_CONDICION_POLIZA)
                        then
                        <PolicyRuleAttributes>
                        {
                            for $ATRIBUTO_CONDICION_POLIZA in $CONDICION_POLIZA/ns1:ATRIBUTOS_CONDICION_POLIZA/ns1:ATRIBUTO_CONDICION_POLIZA
                            return 
                            <PolicyRuleAttribute>
                                {
                                    if ($ATRIBUTO_CONDICION_POLIZA/ns1:ID_CONDICION)
                                    then <PolicyRuleID>{fn:data($ATRIBUTO_CONDICION_POLIZA/ns1:ID_CONDICION)}</PolicyRuleID>
                                    else ()
                                }
                                <AttrOrder>{fn:data($ATRIBUTO_CONDICION_POLIZA/ns1:ORDEN_ATRIBUTO)}</AttrOrder>
                                <DefinitionType>{fn:data($ATRIBUTO_CONDICION_POLIZA/ns1:TIPO_DEFINICION)}</DefinitionType>
                                {
                                    if ($ATRIBUTO_CONDICION_POLIZA/ns1:CODIGO_ATRIBUTO)
                                    then <AttrCode>{fn:data($ATRIBUTO_CONDICION_POLIZA/ns1:CODIGO_ATRIBUTO)}</AttrCode>
                                    else ()
                                }
                                {
                                    if ($ATRIBUTO_CONDICION_POLIZA/ns1:TIPO_VALOR)
                                    then <ValueType>{fn:data($ATRIBUTO_CONDICION_POLIZA/ns1:TIPO_VALOR)}</ValueType>
                                    else ()
                                }
                                {
                                    if ($ATRIBUTO_CONDICION_POLIZA/ns1:REGLA_VALOR)
                                    then <RuleValue>{fn:data($ATRIBUTO_CONDICION_POLIZA/ns1:REGLA_VALOR)}</RuleValue>
                                    else ()
                                }
                                {
                                    if ($ATRIBUTO_CONDICION_POLIZA/ns1:REGLA_CODIGO)
                                    then <ReRuleCode>{fn:data($ATRIBUTO_CONDICION_POLIZA/ns1:REGLA_CODIGO)}</ReRuleCode>
                                    else ()
                                }
                                {
                                    if ($ATRIBUTO_CONDICION_POLIZA/ns1:VALOR_DIM)
                                    then <ValueDim>{fn:data($ATRIBUTO_CONDICION_POLIZA/ns1:VALOR_DIM)}</ValueDim>
                                    else ()
                                }
                                {
                                    if ($ATRIBUTO_CONDICION_POLIZA/ns1:MONEDA)
                                    then <Currency>{fn:data($ATRIBUTO_CONDICION_POLIZA/ns1:MONEDA)}</Currency>
                                    else ()
                                }</PolicyRuleAttribute>
                        }
                      </PolicyRuleAttributes>
                    else ()
                    }
                    {
                    if ($CONDICION_POLIZA/ns1:VALORES_CONDICION_POLIZA/ns1:VALOR_CONDICION_POLIZA)
                        then
                      <PolicyRuleValues>
                        {
                            for $VALOR_CONDICION_POLIZA in $CONDICION_POLIZA/ns1:VALORES_CONDICION_POLIZA/ns1:VALOR_CONDICION_POLIZA
                            return 
                            <PolicyRuleValue>
                                {
                                    if ($VALOR_CONDICION_POLIZA/ns1:ID_CONDICION)
                                    then <PolicyRuleID>{fn:data($VALOR_CONDICION_POLIZA/ns1:ID_CONDICION)}</PolicyRuleID>
                                    else ()
                                }
                                <RuleValue>{fn:data($VALOR_CONDICION_POLIZA/ns1:REGLA_VALOR)}</RuleValue>
                                {
                                    if ($VALOR_CONDICION_POLIZA/ns1:VALOR_DIM)
                                    then <ValueDim>{fn:data($VALOR_CONDICION_POLIZA/ns1:VALOR_DIM)}</ValueDim>
                                    else ()
                                }
                                {
                                    if ($VALOR_CONDICION_POLIZA/ns1:MONEDA)
                                    then <Currency>{fn:data($VALOR_CONDICION_POLIZA/ns1:MONEDA)}</Currency>
                                    else ()
                                }
                                {
                                    if ($VALOR_CONDICION_POLIZA/ns1:TIPO_VALOR)
                                    then <ValueType>{fn:data($VALOR_CONDICION_POLIZA/ns1:TIPO_VALOR)}</ValueType>
                                    else ()
                                }
                                {
                                    if ($VALOR_CONDICION_POLIZA/ns1:INCLUIDO)
                                    then <Included>{fn:data($VALOR_CONDICION_POLIZA/ns1:INCLUIDO)}</Included>
                                    else ()
                                }</PolicyRuleValue>
                        }
                    </PolicyRuleValues>
                  else()
                  }
                </PolicyRule>
            }
        </PolicyRules>
    </SetPolicyRulesRq>
};

local:func($Entrada, $idpoliza)
