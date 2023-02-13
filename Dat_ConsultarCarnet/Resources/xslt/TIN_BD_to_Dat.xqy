xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://pa.sura.insis.com/consultarcarnet";
(:: import schema at "../xsd/Carnet_Insis.xsd" ::)
declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/ConsultarCarnet";
(:: import schema at "../BDAdapter/ConsultarCarnet_sp.xsd" ::)

declare variable $listaCarnets as element() (:: schema-element(ns1:OutputParameters) ::) external;

declare function local:func($listaCarnets as element() (:: schema-element(ns1:OutputParameters) ::)) as element() (:: schema-element(ns2:RespuestaCarnets) ::) {
    <ns2:RespuestaCarnets>
        {
            for $PO_CTRL_REC_Row in $listaCarnets/ns1:PO_CTRL_REC/ns1:PO_CTRL_REC_Row
            return 
            <ns2:CARNETS>
                <ns2:IDENTIFICACION>{fn:data($PO_CTRL_REC_Row/ns1:ID_ASEG)}</ns2:IDENTIFICACION>
                <ns2:NOMBRE_COMPLETO>{fn:data($PO_CTRL_REC_Row/ns1:ASEGURADO)}</ns2:NOMBRE_COMPLETO>
                <ns2:EDAD>{fn:data($PO_CTRL_REC_Row/ns1:EDAD)}</ns2:EDAD>
                <ns2:SEXO>{fn:data($PO_CTRL_REC_Row/ns1:GENERO)}</ns2:SEXO>
                <ns2:TIPO_RELACION>{fn:data($PO_CTRL_REC_Row/ns1:COD_RELACION)}</ns2:TIPO_RELACION>
                <ns2:RELACION>{fn:data($PO_CTRL_REC_Row/ns1:RELACION)}</ns2:RELACION>
                <ns2:IDENTIFICACION_CONTRATANTE>{fn:data($PO_CTRL_REC_Row/ns1:IDENTIFICACION)}</ns2:IDENTIFICACION_CONTRATANTE>
                <ns2:NOMBRE_COMPLETO_CONTRATANTE>{fn:data($PO_CTRL_REC_Row/ns1:CONTRATANTE_NOM)}</ns2:NOMBRE_COMPLETO_CONTRATANTE>
                <ns2:NUMERO_DE_POLIZA>{fn:data($PO_CTRL_REC_Row/ns1:POLICY_NO)}</ns2:NUMERO_DE_POLIZA>
                <ns2:PLAN>{fn:data($PO_CTRL_REC_Row/ns1:COD_PLAN)}</ns2:PLAN>
                <ns2:RED_MEDICA>{fn:data($PO_CTRL_REC_Row/ns1:RED)}</ns2:RED_MEDICA>
                <ns2:COBERTURA>{fn:data($PO_CTRL_REC_Row/ns1:COBERTURA)}</ns2:COBERTURA>
                <ns2:SERVICIO_MEDICO>
                    {
                        if ($PO_CTRL_REC_Row/ns1:SERVICIOS_TYPE)
                        then <ns2:CODIGO_SERVICIO>{fn:data($PO_CTRL_REC_Row/ns1:SERVICIOS_TYPE)}</ns2:CODIGO_SERVICIO>
                        else ()
                    }
                    {
                        if ($PO_CTRL_REC_Row/ns1:DES_SERVICIOS_TYPE)
                        then <ns2:NOMBRE_SERVICIO>{fn:data($PO_CTRL_REC_Row/ns1:DES_SERVICIOS_TYPE)}</ns2:NOMBRE_SERVICIO>
                        else ()
                    }
                    {
                        if ($PO_CTRL_REC_Row/ns1:CO_PAGO)
                        then <ns2:MONTO_COPAGO>{fn:data($PO_CTRL_REC_Row/ns1:CO_PAGO)}</ns2:MONTO_COPAGO>
                        else ()
                    }
                    {
                        if ($PO_CTRL_REC_Row/ns1:COASEGURO)
                        then <ns2:MONTO_COASEGURO>{fn:data($PO_CTRL_REC_Row/ns1:COASEGURO)}</ns2:MONTO_COASEGURO>
                        else ()
                    }
                    {
                        if ($PO_CTRL_REC_Row/ns1:DEDUCIBLE)
                        then <ns2:MONTO_DEDUCIBLE>{fn:data($PO_CTRL_REC_Row/ns1:DEDUCIBLE)}</ns2:MONTO_DEDUCIBLE>
                        else ()
                    }
                </ns2:SERVICIO_MEDICO>
                <ns2:NOMBRE>{fn:data($PO_CTRL_REC_Row/ns1:NOMBRE)}</ns2:NOMBRE>
                <ns2:APELLIDO>{fn:data($PO_CTRL_REC_Row/ns1:APELLIDO)}</ns2:APELLIDO>
                <ns2:SEGUNDO_APELLIDO>{fn:data($PO_CTRL_REC_Row/ns1:SEGUNDO_APELLIDO)}</ns2:SEGUNDO_APELLIDO>
                <ns2:FECHA_NACIMIENTO>{fn:data($PO_CTRL_REC_Row/ns1:FECHA_NACIMIENTO)}</ns2:FECHA_NACIMIENTO></ns2:CARNETS>
        }
    </ns2:RespuestaCarnets>
};

local:func($listaCarnets)
