xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://pa.sura.insis.com/crearreclamosalud";
(:: import schema at "../NXSD/ReclamoSalud_Insis_RQ.xsd" ::)
declare namespace ns1="http://www.fadata.bg/Insurance_Messages/v3.0/xml/";
(:: import schema at "../../../ComponentesComunesInsis/WSDL/xsd/insis/Insis_CSM_v3.0.xsd" ::)

declare variable $CrearReclamoSalud as element() (:: schema-element(ns2:RegistrarReclamo) ::) external;

declare function local:func($CrearReclamoSalud as element() (:: schema-element(ns2:RegistrarReclamo) ::)) as element() (:: schema-element(ns1:RegisterClaimHltRq) ::) {
    <RegisterClaimHltRq isPAR="false">
        {
            if ($CrearReclamoSalud/ns2:RECLAMO/ns2:ID_TARJETA)
            then <CardNo>{fn:data($CrearReclamoSalud/ns2:RECLAMO/ns2:ID_TARJETA)}</CardNo>
            else 
            <CardID>{fn:data($CrearReclamoSalud/ns2:RECLAMO/ns2:CODIGO_TARJETA)}</CardID>
        }
        {
            if ($CrearReclamoSalud/ns2:RECLAMO/ns2:NO_RECLAMO)
            then <ClaimNo>{fn:data($CrearReclamoSalud/ns2:RECLAMO/ns2:NO_RECLAMO)}</ClaimNo>
            else ()
        }
        {
            if ($CrearReclamoSalud/ns2:RECLAMO/ns2:FECHA_REGISTRO)
            then <ClaimStarted>{fn:data($CrearReclamoSalud/ns2:RECLAMO/ns2:FECHA_REGISTRO)}</ClaimStarted>
            else ()
        }
        {
            if ($CrearReclamoSalud/ns2:RECLAMO/ns2:TIPO_EVENTO)
            then <EventType>{fn:data($CrearReclamoSalud/ns2:RECLAMO/ns2:TIPO_EVENTO)}</EventType>
            else ()
        }
        {
            if ($CrearReclamoSalud/ns2:RECLAMO/ns2:FECHA_EVENTO)
            then <EventDate>{fn:data($CrearReclamoSalud/ns2:RECLAMO/ns2:FECHA_EVENTO)}</EventDate>
            else ()
        }
        {
            if ($CrearReclamoSalud/ns2:RECLAMO/ns2:HORA_EVENTO)
            then <EventTime>{fn:data($CrearReclamoSalud/ns2:RECLAMO/ns2:HORA_EVENTO)}</EventTime>
            else ()
        }
        {
            if ($CrearReclamoSalud/ns2:RECLAMO/ns2:CODIGO_PAIS_EVENTO)
            then <EventCountry>{fn:data($CrearReclamoSalud/ns2:RECLAMO/ns2:CODIGO_PAIS_EVENTO)}</EventCountry>
            else ()
        }
        {
            if ($CrearReclamoSalud/ns2:RECLAMO/ns2:FECHA_MUERTE)
            then <DeathDate>{fn:data($CrearReclamoSalud/ns2:RECLAMO/ns2:FECHA_MUERTE)}</DeathDate>
            else ()
        }
        {
            if ($CrearReclamoSalud/ns2:RECLAMO/ns2:NUMERO_PREAUTORIZACION)
            then 
              <CustomProperties><CustomProperty>
                <FieldName>ATTR2</FieldName>
                <Value>{fn:data($CrearReclamoSalud/ns2:RECLAMO/ns2:NUMERO_PREAUTORIZACION)}</Value>
              </CustomProperty></CustomProperties>
            else ()
        }
        {
            if ($CrearReclamoSalud/ns2:SOLICITUD) then
          <Requests>
            {
                for $SOLICITUD in $CrearReclamoSalud/ns2:SOLICITUD
                return
                <Request>
                    {
                        if ($SOLICITUD/ns2:CODIGO_PROVEEDOR)
                        then <ProviderID>{fn:data($SOLICITUD/ns2:CODIGO_PROVEEDOR)}</ProviderID>
                        else ()
                    }
                    {
                        if ($SOLICITUD/ns2:CODIGO_RED)
                        then <NetworkCode>{fn:data($SOLICITUD/ns2:CODIGO_RED)}</NetworkCode>
                        else ()
                    }
                    {
                        if ($SOLICITUD/ns2:TIPO_SOLICITUD)
                        then <RequestType>{fn:data($SOLICITUD/ns2:TIPO_SOLICITUD)}</RequestType>
                        else ()
                    }
                    {
                        if ($SOLICITUD/ns2:FECHA_SOLICITUD)
                        then <RequestDate>{fn:data($SOLICITUD/ns2:FECHA_SOLICITUD)}</RequestDate>
                        else ()
                    }
                    {
                        if ($SOLICITUD/ns2:CODIGO_DIAGNOSTICO_PRIMARIO)
                        then <PrimaryDiagnosisCode>{fn:data($SOLICITUD/ns2:CODIGO_DIAGNOSTICO_PRIMARIO)}</PrimaryDiagnosisCode>
                        else ()
                    }
                    {
                        if ($SOLICITUD/ns2:CODIGO_GRUPO_DIAGNOSTICO_PRIMARIO)
                        then <PrimaryDiagnosisGroupCode>{fn:data($SOLICITUD/ns2:CODIGO_GRUPO_DIAGNOSTICO_PRIMARIO)}</PrimaryDiagnosisGroupCode>
                        else ()
                    }
                    {
                        if ($SOLICITUD/ns2:MONTO_FACTURA)
                        then <InvoiceAmount>{fn:data($SOLICITUD/ns2:MONTO_FACTURA)}</InvoiceAmount>
                        else ()
                    }
                    {
                        if ($SOLICITUD/ns2:MONEDA_FACTURA)
                        then <InvoiceCurrency>{fn:data($SOLICITUD/ns2:MONEDA_FACTURA)}</InvoiceCurrency>
                        else ()
                    }
                    {
                        if ($SOLICITUD/ns2:NUMERO_FACTURA)
                        then <InvoiceID>{fn:data($SOLICITUD/ns2:NUMERO_FACTURA)}</InvoiceID>
                        else ()
                    }
                    {
                        if ($SOLICITUD/ns2:FECHA_FACTURA)
                        then <InvoiceDate>{fn:data($SOLICITUD/ns2:FECHA_FACTURA)}</InvoiceDate>
                        else ()
                    }
                    {
                        if ($SOLICITUD/ns2:LUGAR_SERVICIO)
                        then <ServicePlace>{fn:data($SOLICITUD/ns2:LUGAR_SERVICIO)}</ServicePlace>
                        else ()
                    }
                    {
                        if ($SOLICITUD/ns2:FECHA_ADMISION)
                        then <AdmissionDate>{fn:data($SOLICITUD/ns2:FECHA_ADMISION)}</AdmissionDate>
                        else ()
                    }
                    {
                        if ($SOLICITUD/ns2:HORA_ADMISION)
                        then <AdmissionTime>{fn:data($SOLICITUD/ns2:HORA_ADMISION)}</AdmissionTime>
                        else ()
                    }
                    {
                        if ($SOLICITUD/ns2:FECHA_ALTA)
                        then <DischargeDate>{fn:data($SOLICITUD/ns2:HORA_ADMISION)}</DischargeDate>
                        else ()
                    }
                    {
                        if ($SOLICITUD/ns2:HORA_ALTA)
                        then <DischargeTime>{fn:data($SOLICITUD/ns2:HORA_ADMISION)}</DischargeTime>
                        else ()
                    }
                    {
                        if ($SOLICITUD/ns2:FECHA_ESTIMADA_ADMISION)
                        then <ExpectedAdmissionDate>{fn:data($SOLICITUD/ns2:FECHA_ESTIMADA_ADMISION)}</ExpectedAdmissionDate>
                        else ()
                    }
                    {
                        if ($SOLICITUD/ns2:OBSERVACION)
                        then <Explanation>{fn:data($SOLICITUD/ns2:OBSERVACION)}</Explanation>
                        else ()
                    }
                    <Participants>
                      {
                      for $PARTICIPANTES in $SOLICITUD/ns2:PARTICIPANTES
                      return
                      <Participant>
                          <Entity>
                            {
                                if ($PARTICIPANTES/ns2:PERSONA/ns2:TIPO_PERSONA='N') then
                                    <PersonalData>
                                        <Name>
                                            {
                                                if ($PARTICIPANTES/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:NOMBRE)
                                                then <Given>{fn:data($PARTICIPANTES/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:NOMBRE)}</Given>
                                                else ()
                                            }
                                            {
                                                if ($PARTICIPANTES/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:PRIMER_APELLIDO)
                                                then <Surname>{fn:data($PARTICIPANTES/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:PRIMER_APELLIDO)}</Surname>
                                                else ()
                                            }
                                            {
                                                if ($PARTICIPANTES/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:SEGUNDO_APELLIDO)
                                                then <Family>{fn:data($PARTICIPANTES/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:SEGUNDO_APELLIDO)}</Family>
                                                else ()
                                            }
                                        </Name>
                                        <PID>{fn:data($PARTICIPANTES/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:IDENTIFICACION)}</PID>
                                        {
                                            if ($PARTICIPANTES/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:SEXO)
                                            then <Gender>{fn:data($PARTICIPANTES/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:SEXO)}</Gender>
                                            else ()
                                        }
                                        {
                                            if ($PARTICIPANTES/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:FECHA_DE_NACIMIENTO)
                                            then <BirthDate>{fn:data($PARTICIPANTES/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:FECHA_DE_NACIMIENTO)}</BirthDate>
                                            else ()
                                        }
                                        {
                                            if ($PARTICIPANTES/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:IDIOMA)
                                            then <Language>{fn:data($PARTICIPANTES/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:IDIOMA)}</Language>
                                            else ()
                                        }
                                        {
                                            if ($PARTICIPANTES/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:PAIS_RESIDENCIA)
                                            then <HomeCountry>{fn:data($PARTICIPANTES/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:PAIS_RESIDENCIA)}</HomeCountry>
                                            else ()
                                        }
                                    </PersonalData>
                                else
                                    <CompanyData>
                                        <Name>{fn:data($PARTICIPANTES/ns2:PERSONA/ns2:PERSONA_JURIDICA/ns2:RAZONSOCIAL)}</Name>
                                        <CustomerID>{fn:data($PARTICIPANTES/ns2:PERSONA/ns2:PERSONA_JURIDICA/ns2:ID_CLIENTE)}</CustomerID>
                                        {
                                            if ($PARTICIPANTES/ns2:PERSONA/ns2:PERSONA_JURIDICA/ns2:PERIODO_FISCAL)
                                            then <FiscalPeriod>{fn:data($PARTICIPANTES/ns2:PERSONA/ns2:PERSONA_JURIDICA/ns2:PERIODO_FISCAL)}</FiscalPeriod>
                                            else ()
                                        }
                                        {
                                            if ($PARTICIPANTES/ns2:PERSONA/ns2:PERSONA_JURIDICA/ns2:TIPO_PERSONA_JURIDICA)
                                            then <CompType>{fn:data($PARTICIPANTES/ns2:PERSONA/ns2:PERSONA_JURIDICA/ns2:TIPO_PERSONA_JURIDICA)}</CompType>
                                            else ()
                                        }
                                    </CompanyData>
                            }
                            {
                                if ($PARTICIPANTES/ns2:PERSONA/ns2:NACIONALIDAD)
                                then <Nationality>{fn:data($PARTICIPANTES/ns2:PERSONA/ns2:NACIONALIDAD)}</Nationality>
                                else ()
                            }
                            {
                                if ($PARTICIPANTES/ns2:PERSONA/ns2:INDUSTRIA)
                                then <IndustryCode>{fn:data($PARTICIPANTES/ns2:PERSONA/ns2:INDUSTRIA)}</IndustryCode>
                                else ()
                            }
                            {
                                if ($PARTICIPANTES/ns2:PERSONA/ns2:SUBINDUSTRIA)
                                then <SubIndustryCode>{fn:data($PARTICIPANTES/ns2:PERSONA/ns2:SUBINDUSTRIA)}</SubIndustryCode>
                                else ()
                            }
                            {
                                if ($PARTICIPANTES/ns2:PERSONA/ns2:FECHA_REGISTRO)
                                then <RegistrationDate>{fn:data($PARTICIPANTES/ns2:PERSONA/ns2:FECHA_REGISTRO)}</RegistrationDate>
                                else ()
                            }
                            {
                                if ($PARTICIPANTES/ns2:PERSONA/ns2:OBSERVACION)
                                then <Notes>{fn:data($PARTICIPANTES/ns2:PERSONA/ns2:OBSERVACION)}</Notes>
                                else ()
                            }
                            <Questionary>
                                {
                                    for $PREGUNTAS in $PARTICIPANTES/ns2:PERSONA/ns2:PREGUNTAS
                                    return 
                                    <Question>
                                        <ID>{fn:data($PREGUNTAS/ns2:CODIGO)}</ID>
                                        {
                                            if ($PREGUNTAS/ns2:RESPUESTA)
                                            then <Answer>{fn:data($PREGUNTAS/ns2:RESPUESTA)}</Answer>
                                            else ()
                                        }
                                        {
                                            if ($PREGUNTAS/ns2:IDENTIFICADOR)
                                            then <AnnexID>{fn:data($PREGUNTAS/ns2:IDENTIFICADOR)}</AnnexID>
                                            else ()
                                        }</Question>
                                }
                            </Questionary>
                            <PersonRelations>
                                <PersonRelation>
                                    <PID></PID>
                                    <EntityType></EntityType>
                                    <RelID></RelID>
                                    <RelName></RelName>
                                    <ValidFrom></ValidFrom>
                                    <ValidFromTime></ValidFromTime>
                                    <ValidTo></ValidTo>
                                    <ValidToTime></ValidToTime>
                                </PersonRelation>
                            </PersonRelations>
                            <CustomProperties>
                              {
                                      if ($PARTICIPANTES/ns2:PERSONA/ns2:DIGITO_VERIFICADOR)
                                      then 
                                          <CustomProperty>
                                          <FieldName>'ATTR1'</FieldName>
                                          <FieldLabel></FieldLabel>
                                          <Value>{fn:data($PARTICIPANTES/ns2:PERSONA/ns2:DIGITO_VERIFICADOR)}</Value>
                                          </CustomProperty>
                                      else ()
                              }   
                                              {
                                      if ($PARTICIPANTES/ns2:PERSONA/ns2:TIPO_IDENTIFICACION)
                                      then 
                                          <CustomProperty>
                                          <FieldName>'ATTR2'</FieldName>
                                          <FieldLabel></FieldLabel>
                                          <Value>{fn:data($PARTICIPANTES/ns2:PERSONA/ns2:TIPO_IDENTIFICACION)}</Value>
                                          </CustomProperty>
                                      else ()
                              }   
                                              {
                                      if ($PARTICIPANTES/ns2:PERSONA/ns2:FECHA_VENCIMIENTO_ID)
                                      then 
                                          <CustomProperty>
                                          <FieldName>'ATTR3'</FieldName>
                                          <FieldLabel></FieldLabel>
                                          <Value>{fn:data($PARTICIPANTES/ns2:PERSONA/ns2:TIPO_PERSONA)}</Value>
                                          </CustomProperty>
                                      else ()
                              }
                                              {
                                      if ($PARTICIPANTES/ns2:PERSONA/ns2:FECHA_VENCIMIENTO_ID)
                                      then 
                                          <CustomProperty>
                                          <FieldName>'ATTR4'</FieldName>
                                          <FieldLabel></FieldLabel>
                                          <Value>{fn:data($PARTICIPANTES/ns2:PERSONA/ns2:FECHA_VENCIMIENTO_ID)}</Value>
                                          </CustomProperty>
                                      else ()
                              }                                            
                          </CustomProperties>
                        </Entity>
                        <Addresses>
                            {
                                for $DIRECCIONES in $PARTICIPANTES/ns2:PERSONA/ns2:DIRECCIONES
                                return 
                                <Address>
                                    {
                                        if ($DIRECCIONES/ns2:NOMBRE_PAIS)
                                        then <Country>{fn:data($DIRECCIONES/ns2:NOMBRE_PAIS)}</Country>
                                        else ()
                                    }
                                    {
                                        if ($DIRECCIONES/ns2:CODIGO_PAIS)
                                        then <CountryCode>{fn:data($DIRECCIONES/ns2:CODIGO_PAIS)}</CountryCode>
                                        else ()
                                    }
                                    {
                                        if ($DIRECCIONES/ns2:NOMBRE_ESTADO)
                                        then <State>{fn:data($DIRECCIONES/ns2:NOMBRE_ESTADO)}</State>
                                        else ()
                                    }
                                    {
                                        if ($DIRECCIONES/ns2:CODIGO_ESTADO)
                                        then <CountryState>{fn:data($DIRECCIONES/ns2:CODIGO_ESTADO)}</CountryState>
                                        else ()
                                    }
                                    {
                                        if ($DIRECCIONES/ns2:NOMBRE_REGION)
                                        then <Region>{fn:data($DIRECCIONES/ns2:NOMBRE_REGION)}</Region>
                                        else ()
                                    }
                                    {
                                        if ($DIRECCIONES/ns2:CODIGO_REGION)
                                        then <StateRegion>{fn:data($DIRECCIONES/ns2:CODIGO_REGION)}</StateRegion>
                                        else ()
                                    } 
                                    {
                                        if ($DIRECCIONES/ns2:NOMBRE_CIUDAD)
                                        then <City>{fn:data($DIRECCIONES/ns2:NOMBRE_CIUDAD)}</City>
                                        else ()
                                    }
                                    {
                                        if ($DIRECCIONES/ns2:CODIGO_CIUDAD)
                                        then <CityCode>{fn:data($DIRECCIONES/ns2:CODIGO_CIUDAD)}</CityCode>
                                        else ()
                                    }
                                    <ResidentialAddress>
                                        {
                                            if ($DIRECCIONES/ns2:BARRIO)
                                            then <QuarterName>{fn:data($DIRECCIONES/ns2:BARRIO)}</QuarterName>
                                            else ()
                                        }
                                        <QuarterID></QuarterID>
                                        {
                                            if ($DIRECCIONES/ns2:CALLE_AVENIDA)
                                            then <StreetName>{fn:data($DIRECCIONES/ns2:CALLE_AVENIDA)}</StreetName>
                                            else ()
                                        }
                                        <StreetID></StreetID>
                                        {
                                            if ($DIRECCIONES/ns2:CALLE_AVENIDA_NRO)
                                            then <StreetNo>{fn:data($DIRECCIONES/ns2:CALLE_AVENIDA_NRO)}</StreetNo>
                                            else ()
                                        }
                                        {
                                            if ($DIRECCIONES/ns2:EDIFICIO)
                                            then <BlockNo>{fn:data($DIRECCIONES/ns2:EDIFICIO)}</BlockNo>
                                            else ()
                                        }
                                        {
                                            if ($DIRECCIONES/ns2:ENTRADA)
                                            then <Entrance>{fn:data($DIRECCIONES/ns2:ENTRADA)}</Entrance>
                                            else ()
                                        }
                                        {
                                            if ($DIRECCIONES/ns2:PISO)
                                            then <Floor>{fn:data($DIRECCIONES/ns2:PISO)}</Floor>
                                            else ()
                                        }
                                        {
                                            if ($DIRECCIONES/ns2:APTO_CASA)
                                            then <Apartment>{fn:data($DIRECCIONES/ns2:APTO_CASA)}</Apartment>
                                            else ()
                                        }
                                    </ResidentialAddress>
                                    <AddressType>{fn:data($DIRECCIONES/ns2:TIPO_DIRECCION)}</AddressType>
                                    {
                                        if ($DIRECCIONES/ns2:DIRECCION)
                                        then <Address>{fn:data($DIRECCIONES/ns2:DIRECCION)}</Address>
                                        else ()
                                    }
                                    {
                                        if ($DIRECCIONES/ns2:ES_CORRESPONDENCIA)
                                        then <MailYN>{fn:data($DIRECCIONES/ns2:ES_CORRESPONDENCIA)}</MailYN>
                                        else ()
                                    }
                                    {
                                        if ($DIRECCIONES/ns2:ES_FACTURACION)
                                        then <InvoiceYN>{fn:data($DIRECCIONES/ns2:ES_FACTURACION)}</InvoiceYN>
                                        else ()
                                    }
                                    {
                                        if ($DIRECCIONES/ns2:OBSERVACION)
                                        then <Notes>{fn:data($DIRECCIONES/ns2:OBSERVACION)}</Notes>
                                        else ()
                                    }
                                    {
                                        if ($DIRECCIONES/ns2:ES_PRINCIPAL)
                                        then <PrimaryFlag>{fn:data($DIRECCIONES/ns2:ES_PRINCIPAL)}</PrimaryFlag>
                                        else ()
                                    }
                                    {
                                        if ($DIRECCIONES/ns2:TELEFONO)
                                        then <Phone>{fn:data($DIRECCIONES/ns2:TELEFONO)}</Phone>
                                        else ()
                                    }
                                    {
                                        if ($DIRECCIONES/ns2:FAX)
                                        then <Fax>{fn:data($DIRECCIONES/ns2:FAX)}</Fax>
                                        else ()
                                    }
                                    {
                                        if ($DIRECCIONES/ns2:EMAIL)
                                        then <Email>{fn:data($DIRECCIONES/ns2:EMAIL)}</Email>
                                        else ()
                                    }</Address>
                            }
                        </Addresses>
                        <Contacts>
                            {
                                for $CONTACTOS in $PARTICIPANTES/ns2:PERSONA/ns2:CONTACTOS
                                return 
                                <Contact>
                                    <Type>{fn:data($CONTACTOS/ns2:TIPO)}</Type>
                                    <Details>{fn:data($CONTACTOS/ns2:VALOR)}</Details>
                                    {
                                        if ($CONTACTOS/ns2:OBSERVACION)
                                        then <ContactNote>{fn:data($CONTACTOS/ns2:OBSERVACION)}</ContactNote>
                                        else ()
                                    }
                                    {
                                        if ($CONTACTOS/ns2:ES_PRINCIPAL)
                                        then <PrimaryFlag>{fn:data($CONTACTOS/ns2:ES_PRINCIPAL)}</PrimaryFlag>
                                        else ()
                                    }
                                    {
                                        if ($CONTACTOS/ns2:IDIOMA)
                                        then <Language>{fn:data($CONTACTOS/ns2:IDIOMA)}</Language>
                                        else ()
                                    }</Contact>
                            }
                        </Contacts>
                        <ParticipantRole>{fn:data($PARTICIPANTES/ns2:PERSONA_ROL)}</ParticipantRole>
                        {
                            if ($PARTICIPANTES/ns2:FECHA_OPERACION)
                            then <AppointmentDate>{fn:data($PARTICIPANTES/ns2:FECHA_OPERACION)}</AppointmentDate>
                            else ()
                        }
                        {
                            if ($PARTICIPANTES/ns2:NUMERO_REPORTE)
                            then <ReportNo>{fn:data($PARTICIPANTES/ns2:NUMERO_REPORTE)}</ReportNo>
                            else ()
                        }
                        {
                            if ($PARTICIPANTES/ns2:FECHA_REPORTE)
                            then <ReportDate>{fn:data($PARTICIPANTES/ns2:FECHA_REPORTE)}</ReportDate>
                            else ()
                        }
                        {
                            if ($PARTICIPANTES/ns2:PORCENTAJE_REPORTE)
                            then <Percentage>{fn:data($PARTICIPANTES/ns2:PORCENTAJE_REPORTE)}</Percentage>
                            else ()
                        }
                      </Participant>
                      }
                    </Participants>
                    <ClaimServices>
                      {
                      for $SERVICIOS in $SOLICITUD/ns2:SEVICIOS
                      return
                        <ClaimService>
                        {
                            if ($SERVICIOS/ns2:TIPO_ACTIVIDAD)
                            then <ActivityType>{fn:data($SERVICIOS/ns2:TIPO_ACTIVIDAD)}</ActivityType>
                            else ()
                        }
                        {
                            if ($SERVICIOS/ns2:CODIGO_ACTIVIDAD)
                            then <ActivityCode>{fn:data($SERVICIOS/ns2:CODIGO_ACTIVIDAD)}</ActivityCode>
                            else ()
                        }
                        {
                            if ($SERVICIOS/ns2:FECHA_INICIO_SERVICIO)
                            then <ServiceDate>{fn:data($SERVICIOS/ns2:FECHA_INICIO_SERVICIO)}</ServiceDate>
                            else ()
                        }
                        {
                            if ($SERVICIOS/ns2:HORA_INICIO_SERVICIO)
                            then <ServiceDateTime>{fn:data($SERVICIOS/ns2:HORA_INICIO_SERVICIO)}</ServiceDateTime>
                            else ()
                        }
                        {
                            if ($SERVICIOS/ns2:FECHA_FIN_SERVICIO)
                            then <ServiceDateTo>{fn:data($SERVICIOS/ns2:FECHA_FIN_SERVICIO)}</ServiceDateTo>
                            else ()
                        }
                        {
                            if ($SERVICIOS/ns2:HORA_FIN_SERVICIO)
                            then <ServiceDateToTime>{fn:data($SERVICIOS/ns2:HORA_FIN_SERVICIO)}</ServiceDateToTime>
                            else ()
                        }
                        {
                            if ($SERVICIOS/ns2:TRATAMIENTO)
                            then <TreatmentGroup>{fn:data($SERVICIOS/ns2:TRATAMIENTO)}</TreatmentGroup>
                            else ()
                        }
                        {
                            if ($SERVICIOS/ns2:CANTIDAD_SERVICIO)
                            then <RequestedQuantity>{fn:data($SERVICIOS/ns2:CANTIDAD_SERVICIO)}</RequestedQuantity>
                            else ()
                        }
                        {
                            if ($SERVICIOS/ns2:PRECIO_SERVICIO)
                            then <RequestedPrice>{fn:data($SERVICIOS/ns2:PRECIO_SERVICIO)}</RequestedPrice>
                            else ()
                        }
                        {
                            if ($SERVICIOS/ns2:MONTO_SERVICIO)
                            then <RequestedAmount>{fn:data($SERVICIOS/ns2:MONTO_SERVICIO)}</RequestedAmount>
                            else ()
                        }
                        {
                            if ($SERVICIOS/ns2:MONEDA_SERVICIO)
                            then <RequestedCurrency>{fn:data($SERVICIOS/ns2:MONEDA_SERVICIO)}</RequestedCurrency>
                            else ()
                        }
                        {
                            if ($SERVICIOS/ns2:CUOTA_PACIENTE)
                            then <CollectedPatientShare>{fn:data($SERVICIOS/ns2:CUOTA_PACIENTE)}</CollectedPatientShare>
                            else ()
                        }
                        {
                            if ($SERVICIOS/ns2:CANTIDAD_CONFIRMADO)
                            then <ConfirmedQuantity>{fn:data($SERVICIOS/ns2:CANTIDAD_CONFIRMADO)}</ConfirmedQuantity>
                            else ()
                        }
                        {
                            if ($SERVICIOS/ns2:PRECIO_CONFIRMADO)
                            then <ConfirmedPrice>{fn:data($SERVICIOS/ns2:PRECIO_CONFIRMADO)}</ConfirmedPrice>
                            else ()
                        }
                        {
                            if ($SERVICIOS/ns2:MONTO_CONFIRMADO)
                            then <ConfirmedAmount>{fn:data($SERVICIOS/ns2:MONTO_CONFIRMADO)}</ConfirmedAmount>
                            else ()
                        }
                        {
                            if ($SERVICIOS/ns2:MONEDA_CONFIRMADO)
                            then <ConfirmedCurrency>{fn:data($SERVICIOS/ns2:MONEDA_CONFIRMADO)}</ConfirmedCurrency>
                            else ()
                        }
                        {
                            if ($SERVICIOS/ns2:CONTROL)
                            then <ManualControl>{fn:data($SERVICIOS/ns2:CONTROL)}</ManualControl>
                            else ()
                        }
                        {
                            if ($SERVICIOS/ns2:OBSERVACION)
                            then <Notes>{fn:data($SERVICIOS/ns2:OBSERVACION)}</Notes>
                            else ()
                        }
                        {
                            if ($SERVICIOS/ns2:DESCRIPCION)
                            then <DscrType>{fn:data($SERVICIOS/ns2:DESCRIPCION)}</DscrType>
                            else ()
                        }
                        {
                            if ($SERVICIOS/ns2:LUGAR_SERVICIO)
                            then <ServicePlace>{fn:data($SERVICIOS/ns2:LUGAR_SERVICIO)}</ServicePlace>
                            else ()
                        }
                        {
                            if ($SERVICIOS/ns2:CODIGO_PORTADA)
                            then <CoverCode>{fn:data($SERVICIOS/ns2:CODIGO_PORTADA)}</CoverCode>
                            else ()
                        }
                        </ClaimService>
                      }
                    </ClaimServices>
                </Request>
            }
          </Requests>
          else ()          
        }
    </RegisterClaimHltRq>
};
local:func($CrearReclamoSalud)
