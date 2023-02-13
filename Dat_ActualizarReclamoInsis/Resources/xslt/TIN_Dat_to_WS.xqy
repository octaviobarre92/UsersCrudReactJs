xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://ws.hlt.pa.sura.insis.com/";
(:: import schema at "../WSDL/Reclamos.xsd" ::)
declare namespace ns1="http://ws.hlt.pa.sura.insis.com/reclamolocal";
(:: import schema at "../NXSD/Reclamo_Insis_RQ.xsd" ::)

declare variable $rqReclamo as element() (:: schema-element(ns1:UpdateClaimHltRq) ::) external;

declare function local:func($rqReclamo as element() (:: schema-element(ns1:UpdateClaimHltRq) ::)) as element() (:: schema-element(ns2:UpdateClaimHltRq) ::) {
    <ns2:UpdateClaimHltRq>
        <CLAIM>
            {
                if ($rqReclamo/ns1:RECLAMO/ns1:TARJETA_ID)
                then <CARD_ID>{fn:data($rqReclamo/ns1:RECLAMO/ns1:TARJETA_ID)}</CARD_ID>
                else ()
            }
            <CLAIM_ID>{fn:data($rqReclamo/ns1:RECLAMO/ns1:RECLAMO_ID)}</CLAIM_ID>
            <CLAIM_NO>{fn:data($rqReclamo/ns1:RECLAMO/ns1:RECLAMO_NO)}</CLAIM_NO>
            {
                if ($rqReclamo/ns1:RECLAMO/ns1:RECLAMO_STARTED)
                then <CLAIM_STARTED>{fn:data($rqReclamo/ns1:RECLAMO/ns1:RECLAMO_STARTED)}</CLAIM_STARTED>
                else ()
            }
            {
                if ($rqReclamo/ns1:RECLAMO/ns1:RECLAMO_TYPE)
                then <CLAIM_TYPE>{fn:data($rqReclamo/ns1:RECLAMO/ns1:RECLAMO_TYPE)}</CLAIM_TYPE>
                else ()
            }
            {
                if ($rqReclamo/ns1:RECLAMO/ns1:NUMERO_DE_POLIZA)
                then <CONTRACT_NO>{fn:data($rqReclamo/ns1:RECLAMO/ns1:NUMERO_DE_POLIZA)}</CONTRACT_NO>
                else ()
            }
            {
                if ($rqReclamo/ns1:RECLAMO/ns1:FECHA_MUERTE)
                then <DEATH_DATE>{fn:data($rqReclamo/ns1:RECLAMO/ns1:FECHA_MUERTE)}</DEATH_DATE>
                else ()
            }
            {
                if ($rqReclamo/ns1:RECLAMO/ns1:EVENTO_PAIS)
                then <EVENT_COUNTRY>{fn:data($rqReclamo/ns1:RECLAMO/ns1:EVENTO_PAIS)}</EVENT_COUNTRY>
                else ()
            }
            {
                if ($rqReclamo/ns1:RECLAMO/ns1:EVENTO_FECHA)
                then <EVENT_DATE>{fn:data($rqReclamo/ns1:RECLAMO/ns1:EVENTO_FECHA)}</EVENT_DATE>
                else ()
            }
            {
                if ($rqReclamo/ns1:RECLAMO/ns1:EVENTO_HORA)
                then <EVENT_TIME>{fn:data($rqReclamo/ns1:RECLAMO/ns1:EVENTO_HORA)}</EVENT_TIME>
                else ()
            }
            {
                if ($rqReclamo/ns1:RECLAMO/ns1:EVENTO_TIPO)
                then <EVENT_TYPE>{fn:data($rqReclamo/ns1:RECLAMO/ns1:EVENTO_TIPO)}</EVENT_TYPE>
                else ()
            }
            {
                if ($rqReclamo/ns1:RECLAMO/ns1:SUCURSAL_ID)
                then <OFFICE_ID>{fn:data($rqReclamo/ns1:RECLAMO/ns1:SUCURSAL_ID)}</OFFICE_ID>
                else ()
            }
            {
                if ($rqReclamo/ns1:RECLAMO/ns1:FECHA_REGISTRO)
                then <REGISTRATION_DATE>{fn:data($rqReclamo/ns1:RECLAMO/ns1:FECHA_REGISTRO)}</REGISTRATION_DATE>
                else ()
            }
            {
                for $SOLICITUD in $rqReclamo/ns1:RECLAMO/ns1:SOLICITUD
                return 
                <REQUEST>
                    {
                        if ($SOLICITUD/ns1:FECHA_ADMISION)
                        then <ADMISSION_DATE>{fn:data($SOLICITUD/ns1:FECHA_ADMISION)}</ADMISSION_DATE>
                        else ()
                    }
                    {
                        if ($SOLICITUD/ns1:HORA_ADMISION)
                        then <ADMISSION_TIME>{fn:data($SOLICITUD/ns1:HORA_ADMISION)}</ADMISSION_TIME>
                        else ()
                    }
                    {
                        if ($SOLICITUD/ns1:TIPO_RECLAMO)
                        then <CLAIM_TYPE>{fn:data($SOLICITUD/ns1:TIPO_RECLAMO)}</CLAIM_TYPE>
                        else ()
                    }
                    {
                        if ($SOLICITUD/ns1:FECHA_ALTA)
                        then <DISCHARGE_DATE>{fn:data($SOLICITUD/ns1:FECHA_ALTA)}</DISCHARGE_DATE>
                        else ()
                    }
                    {
                        if ($SOLICITUD/ns1:FECHA_ESPERADA_ADMISION)
                        then <EXPECTED_ADMISSION_DATE>{fn:data($SOLICITUD/ns1:FECHA_ESPERADA_ADMISION)}</EXPECTED_ADMISSION_DATE>
                        else ()
                    }
                    {
                        if ($SOLICITUD/ns1:DETALLE)
                        then <EXPLANATION>{fn:data($SOLICITUD/ns1:DETALLE)}</EXPLANATION>
                        else ()
                    }
                    {
                        if ($SOLICITUD/ns1:FACTURA_MONTO)
                        then <INVOICE_AMOUNT>{fn:data($SOLICITUD/ns1:FACTURA_MONTO)}</INVOICE_AMOUNT>
                        else ()
                    }
                    {
                        if ($SOLICITUD/ns1:FACTURA_MONEDA)
                        then <INVOICE_CURRENCY>{fn:data($SOLICITUD/ns1:FACTURA_MONEDA)}</INVOICE_CURRENCY>
                        else ()
                    }
                    {
                        if ($SOLICITUD/ns1:FACTURA_FECHA)
                        then <INVOICE_DATE>{fn:data($SOLICITUD/ns1:FACTURA_FECHA)}</INVOICE_DATE>
                        else ()
                    }
                    {
                        if ($SOLICITUD/ns1:FACTURA_NO)
                        then <INVOICE_ID>{fn:data($SOLICITUD/ns1:FACTURA_NO)}</INVOICE_ID>
                        else ()
                    }
                    {
                        for $BENEFICIARIO in $SOLICITUD/ns1:BENEFICIARIO
                        return 
                        <PARTICIPANT>
                            {
                                if ($BENEFICIARIO/ns1:FECHA_CITA)
                                then <APPOINTMENT_DATE>{fn:data($BENEFICIARIO/ns1:FECHA_CITA)}</APPOINTMENT_DATE>
                                else ()
                            }
                            {
                                if ($BENEFICIARIO/ns1:PORCENTAJE)
                                then <BENEF_PERCENTAGE>{fn:data($BENEFICIARIO/ns1:PORCENTAJE)}</BENEF_PERCENTAGE>
                                else ()
                            }
                            <MAN_ID>{fn:data($BENEFICIARIO/ns1:MAN_ID)}</MAN_ID>
                            {
                                if ($BENEFICIARIO/ns1:DETALLE)
                                then <NOTES>{fn:data($BENEFICIARIO/ns1:DETALLE)}</NOTES>
                                else ()
                            }
                            {
                                if ($BENEFICIARIO/ns1:BENEFICIARIO_ROL)
                                then <PARTICIPANT_ROLE>{fn:data($BENEFICIARIO/ns1:BENEFICIARIO_ROL)}</PARTICIPANT_ROLE>
                                else ()
                            }
                            {
                                if ($BENEFICIARIO/ns1:FECHA_REGISTRO)
                                then <REGISTRATION_DATE>{fn:data($BENEFICIARIO/ns1:FECHA_REGISTRO)}</REGISTRATION_DATE>
                                else ()
                            }
                            {
                                if ($BENEFICIARIO/ns1:REPORTE_FECHA)
                                then <REPORT_DATE>{fn:data($BENEFICIARIO/ns1:REPORTE_FECHA)}</REPORT_DATE>
                                else ()
                            }
                            {
                                if ($BENEFICIARIO/ns1:REPORTE_NO)
                                then <REPORT_NO>{fn:data($BENEFICIARIO/ns1:REPORTE_NO)}</REPORT_NO>
                                else ()
                            }</PARTICIPANT>
                    }
                    {
                        if ($SOLICITUD/ns1:DIAGNOSTICO_PRIMARIO_GRUPO_ID)
                        then <PRIMARY_DIAGNOSIS_GROUP_ID>{fn:data($SOLICITUD/ns1:DIAGNOSTICO_PRIMARIO_GRUPO_ID)}</PRIMARY_DIAGNOSIS_GROUP_ID>
                        else ()
                    }                    
                    {
                        if ($SOLICITUD/ns1:PROVEEDOR_CONTRATO_ID)
                        then <PROVIDER_CONTRACT_ID>{fn:data($SOLICITUD/ns1:PROVEEDOR_CONTRATO_ID)}</PROVIDER_CONTRACT_ID>
                        else ()
                    }
                    <PROVIDER_ID>{fn:data($SOLICITUD/ns1:PROVEEDOR_ID)}</PROVIDER_ID>
                    {
                        if ($SOLICITUD/ns1:PROVEEDOR_RED)
                        then <PROVIDER_NETWORK_ID>{fn:data($SOLICITUD/ns1:PROVEEDOR_RED)}</PROVIDER_NETWORK_ID>
                        else ()
                    }
                    {
                        if ($SOLICITUD/ns1:SOLICITUD_FECHA)
                        then <REQUEST_DATE>{fn:data($SOLICITUD/ns1:SOLICITUD_FECHA)}</REQUEST_DATE>
                        else ()
                    }
                    {
                        if ($SOLICITUD/ns1:SOLICITUD_TIPO)
                        then <REQUEST_TYPE>{fn:data($SOLICITUD/ns1:SOLICITUD_TIPO)}</REQUEST_TYPE>
                        else ()
                    }
                    {
                        for $SERVICIO in $SOLICITUD/ns1:SERVICIO
                        return 
                        <SERVICE>
                            <CONFIRMED_CURRENCY>{fn:data($SERVICIO/ns1:MONEDA_MANUAL)}</CONFIRMED_CURRENCY>
                            {
                                if ($SERVICIO/ns1:DOCTOR_ID)
                                then <DOCTOR_ID>{fn:data($SERVICIO/ns1:DOCTOR_ID)}</DOCTOR_ID>
                                else ()
                            }
                            {
                                if ($SERVICIO/ns1:DOCTOR_NOMBRE)
                                then <DOCTOR_NAME>{fn:data($SERVICIO/ns1:DOCTOR_NOMBRE)}</DOCTOR_NAME>
                                else ()
                            }
                            {
                                if ($SERVICIO/ns1:TRATAMIENTO/ns1:TRATAMIENTO_DIAS)
                                then <DRUG_DAYS_SUPPLY>{fn:data($SERVICIO/ns1:TRATAMIENTO/ns1:TRATAMIENTO_DIAS)}</DRUG_DAYS_SUPPLY>
                                else ()
                            }
                            {
                                if ($SERVICIO/ns1:TRATAMIENTO/ns1:TRATAMIENTO_DOSIS)
                                then <DRUG_DOSAGE_PER_DAY>{fn:data($SERVICIO/ns1:TRATAMIENTO/ns1:TRATAMIENTO_DOSIS)}</DRUG_DOSAGE_PER_DAY>
                                else ()
                            }
                            {
                                if ($SERVICIO/ns1:TRATAMIENTO/ns1:TRATAMIENTO_PRESCRIPCION_ORIGINAL)
                                then <DRUG_ORIGIN_PRESCRIPTION>{fn:data($SERVICIO/ns1:TRATAMIENTO/ns1:TRATAMIENTO_PRESCRIPCION_ORIGINAL)}</DRUG_ORIGIN_PRESCRIPTION>
                                else ()
                            }
                            {
                                if ($SERVICIO/ns1:TRATAMIENTO/ns1:TRATAMIENTO_CANTIDAD_PAQUETES)
                                then <DRUG_PACKING>{fn:data($SERVICIO/ns1:TRATAMIENTO/ns1:TRATAMIENTO_CANTIDAD_PAQUETES)}</DRUG_PACKING>
                                else ()
                            }
                            {
                                if ($SERVICIO/ns1:TRATAMIENTO/ns1:TRATAMIENTO_CANTIDAD_PAQUETES_ID)
                                then <DRUG_PACKING_DIM>{fn:data($SERVICIO/ns1:TRATAMIENTO/ns1:TRATAMIENTO_CANTIDAD_PAQUETES_ID)}</DRUG_PACKING_DIM>
                                else ()
                            }
                            {
                                if ($SERVICIO/ns1:TRATAMIENTO/ns1:TRATAMIENTO_UNIDADES_POR_PAQUETE)
                                then <DRUG_PACKING_TOTAL>{fn:data($SERVICIO/ns1:TRATAMIENTO/ns1:TRATAMIENTO_UNIDADES_POR_PAQUETE)}</DRUG_PACKING_TOTAL>
                                else ()
                            }
                            {
                                if ($SERVICIO/ns1:TRATAMIENTO/ns1:TRATAMIENTO_PRESCRIPCION)
                                then <DRUG_PRESCRIPTION>{fn:data($SERVICIO/ns1:TRATAMIENTO/ns1:TRATAMIENTO_PRESCRIPCION)}</DRUG_PRESCRIPTION>
                                else ()
                            }
                            {
                                if ($SERVICIO/ns1:TRATAMIENTO/ns1:TRATAMIENTO_FUERZA)
                                then <DRUG_STRENGHT>{fn:data($SERVICIO/ns1:TRATAMIENTO/ns1:TRATAMIENTO_FUERZA)}</DRUG_STRENGHT>
                                else ()
                            }
                            {
                                if ($SERVICIO/ns1:TRATAMIENTO/ns1:TRATAMIENTO_FUERZA_ID)
                                then <DRUG_STRENGHT_DIM>{fn:data($SERVICIO/ns1:TRATAMIENTO/ns1:TRATAMIENTO_FUERZA_ID)}</DRUG_STRENGHT_DIM>
                                else ()
                            }
                            {
                                if ($SERVICIO/ns1:TRATAMIENTO/ns1:TRATAMIENTO_UNIDAD_MEDIDA)
                                then <DRUG_UNITS>{fn:data($SERVICIO/ns1:TRATAMIENTO/ns1:TRATAMIENTO_UNIDAD_MEDIDA)}</DRUG_UNITS>
                                else ()
                            }
                            {
                                if ($SERVICIO/ns1:TRATAMIENTO/ns1:TRATAMIENTO_UNIDAD_MEDIDA_ID)
                                then <DRUG_UNIT_DIM>{fn:data($SERVICIO/ns1:TRATAMIENTO/ns1:TRATAMIENTO_UNIDAD_MEDIDA_ID)}</DRUG_UNIT_DIM>
                                else ()
                            }
                            <DSCR_TYPE>{fn:data($SERVICIO/ns1:DETALLE)}</DSCR_TYPE>
                            {
                                if ($SERVICIO/ns1:NOTAS)
                                then <NOTES>{fn:data($SERVICIO/ns1:NOTAS)}</NOTES>
                                else ()
                            }
                            {
                                if ($SERVICIO/ns1:MONTO_TOTAL)
                                then <REQUESTED_AMOUNT>{fn:data($SERVICIO/ns1:MONTO_TOTAL)}</REQUESTED_AMOUNT>
                                else ()
                            }
                            {
                                if ($SERVICIO/ns1:MONEDA)
                                then <REQUESTED_CURRENCY>{fn:data($SERVICIO/ns1:MONEDA)}</REQUESTED_CURRENCY>
                                else ()
                            }
                            {
                                if ($SERVICIO/ns1:PRECIO)
                                then <REQUESTED_PRICE>{fn:data($SERVICIO/ns1:PRECIO)}</REQUESTED_PRICE>
                                else ()
                            }
                            {
                                if ($SERVICIO/ns1:CANTIDAD)
                                then <REQUESTED_QUANTITY>{fn:data($SERVICIO/ns1:CANTIDAD)}</REQUESTED_QUANTITY>
                                else ()
                            }
                            <SERVICE_CODE>{fn:data($SERVICIO/ns1:CODIGO)}</SERVICE_CODE>
                            <SERVICE_DATE>{fn:data($SERVICIO/ns1:FECHA_INICIO)}</SERVICE_DATE>
                            {
                                if ($SERVICIO/ns1:FECHA_FINALIZACION)
                                then <SERVICE_DATE_TO>{fn:data($SERVICIO/ns1:FECHA_FINALIZACION)}</SERVICE_DATE_TO>
                                else ()
                            }
                            {
                                if ($SERVICIO/ns1:CODIGO_AGRUPACION)
                                then <SERVICE_GROUP_ID>{fn:data($SERVICIO/ns1:CODIGO_AGRUPACION)}</SERVICE_GROUP_ID>
                                else ()
                            }
                            {
                                if ($SERVICIO/ns1:LUGAR)
                                then <SERVICE_PLACE>{fn:data($SERVICIO/ns1:LUGAR)}</SERVICE_PLACE>
                                else ()
                            }
                            <SERVICE_TYPE>{fn:data($SERVICIO/ns1:TIPO)}</SERVICE_TYPE>
                            {
                                if ($SERVICIO/ns1:SUBTIPO)
                                then <SERVICE_SUBTYPE>{fn:data($SERVICIO/ns1:SUBTIPO)}</SERVICE_SUBTYPE>
                                else ()
                            }
                            {
                                if ($SERVICIO/ns1:DIENTE_NUMERO)
                                then <TOOTH_NUMBER>{fn:data($SERVICIO/ns1:DIENTE_NUMERO)}</TOOTH_NUMBER>
                                else ()
                            }
                            {
                                if ($SERVICIO/ns1:SEGMENTO_DENTAL_ID)
                                then <TOOTH_SEGMENT_ID>{fn:data($SERVICIO/ns1:SEGMENTO_DENTAL_ID)}</TOOTH_SEGMENT_ID>
                                else ()
                            }
                            {
                                if ($SERVICIO/ns1:SUPERFICIE_DENTAL_ID)
                                then <TOOTH_SURFACE_ID>{fn:data($SERVICIO/ns1:SUPERFICIE_DENTAL_ID)}</TOOTH_SURFACE_ID>
                                else ()
                            }</SERVICE>
                    }
                    {
                        if ($SOLICITUD/ns1:SERVICIO_LUGAR)
                        then <SERVICE_PLACE>{fn:data($SOLICITUD/ns1:SERVICIO_LUGAR)}</SERVICE_PLACE>
                        else ()
                    }
                    <CLAIMANT_TYPE>{fn:data($SOLICITUD/ns1:CLIENTE_TIPO)}</CLAIMANT_TYPE>
                    <CLAIMANT_ID>{fn:data($SOLICITUD/ns1:IDENTIFICACION_CLIENTE)}</CLAIMANT_ID>
                    {
                        if ($SOLICITUD/ns1:DIAGNOSTICO_PRIMARIO_ID)
                        then <DIAGNOSIS_CODE>{fn:data($SOLICITUD/ns1:DIAGNOSTICO_PRIMARIO_ID)}</DIAGNOSIS_CODE>
                        else ()
                    }
                   </REQUEST> 
            }
            {
                if ($rqReclamo/ns1:RECLAMO/ns1:STAFF_ID)
                then <STAFF_ID>{fn:data($rqReclamo/ns1:RECLAMO/ns1:STAFF_ID)}</STAFF_ID>
                else ()
            }
        </CLAIM>
    </ns2:UpdateClaimHltRq>
};

local:func($rqReclamo)
