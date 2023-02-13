xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://pa.sura.insis.com/crearreclamo";
(:: import schema at "../NXSD/Reclamo_Insis_RQ.xsd" ::)
declare namespace ns1="http://www.fadata.bg/Insurance_Messages/v3.0/xml/";
(:: import schema at "../../../ComponentesComunesInsis/WSDL/xsd/insis/Insis_CSM_v3.0.xsd" ::)

declare variable $RqCrearReclamo as element() (:: schema-element(ns2:RegistrarReclamo) ::) external;

declare function local:func($RqCrearReclamo as element() (:: schema-element(ns2:RegistrarReclamo) ::)) as element() (:: schema-element(ns1:FNOLRq) ::) {
    <FNOLRq>
        {
            if ($RqCrearReclamo/ns2:RECLAMO/ns2:NO_RECLAMO)
            then <ClaimNo>{fn:data($RqCrearReclamo/ns2:RECLAMO/ns2:NO_RECLAMO)}</ClaimNo>
            else ()
        }
        <PolicyNo>{fn:data($RqCrearReclamo/ns2:RECLAMO/ns2:NUMERO_POLIZA)}</PolicyNo>
        {
            if ($RqCrearReclamo/ns2:RECLAMO/ns2:CODIGO_PRODUCTO)
            then <ProductCode>{fn:data($RqCrearReclamo/ns2:RECLAMO/ns2:CODIGO_PRODUCTO)}</ProductCode>
            else ()
        }
        {
            if ($RqCrearReclamo/ns2:RECLAMO/ns2:FECHA_REGISTRO)
            then <ClaimStarted>{fn:data($RqCrearReclamo/ns2:RECLAMO/ns2:FECHA_REGISTRO)}</ClaimStarted>
            else ()
        }
        <ClaimType>{fn:data($RqCrearReclamo/ns2:RECLAMO/ns2:TIPO_RECLAMO)}</ClaimType>
        <CauseID>{fn:data($RqCrearReclamo/ns2:RECLAMO/ns2:CAUSA_RECLAMO)}</CauseID>
        <EventType>{fn:data($RqCrearReclamo/ns2:RECLAMO/ns2:TIPO_EVENTO)}</EventType>
        <EventDate>{fn:data($RqCrearReclamo/ns2:RECLAMO/ns2:FECHA_EVENTO)}</EventDate>
        {
            if ($RqCrearReclamo/ns2:RECLAMO/ns2:HORA_EVENTO)
            then <EventTime>{fn:data($RqCrearReclamo/ns2:RECLAMO/ns2:HORA_EVENTO)}</EventTime>
            else ()
        }
        <EventDescription>{fn:data($RqCrearReclamo/ns2:RECLAMO/ns2:CONCEPTO_RECLAMO)}</EventDescription>
        {
            if ($RqCrearReclamo/ns2:RECLAMO/ns2:CODIGO_PAIS_EVENTO)
            then <EventCountry>{fn:data($RqCrearReclamo/ns2:RECLAMO/ns2:CODIGO_PAIS_EVENTO)}</EventCountry>
            else ()
        }
        {
            if ($RqCrearReclamo/ns2:RECLAMO/ns2:LUGAR_EVENTO)
            then <EventPlace>{fn:data($RqCrearReclamo/ns2:RECLAMO/ns2:LUGAR_EVENTO)}</EventPlace>
            else ()
        }
        {
            if ($RqCrearReclamo/ns2:RECLAMO/ns2:INFORMACION_ASEGURADORA)
            then <SrcInsurer>{fn:data($RqCrearReclamo/ns2:RECLAMO/ns2:INFORMACION_ASEGURADORA)}</SrcInsurer>
            else ()
        }
        {
            if ($RqCrearReclamo/ns2:RECLAMO/ns2:NO_RECLAMO_ASEGURADORA)
            then <SrcClaimID>{fn:data($RqCrearReclamo/ns2:RECLAMO/ns2:NO_RECLAMO_ASEGURADORA)}</SrcClaimID>
            else ()
        }
        {
            if ($RqCrearReclamo/ns2:RECLAMO/ns2:COMENTARIO_RECLAMO)
            then <ClaimComment>{fn:data($RqCrearReclamo/ns2:RECLAMO/ns2:COMENTARIO_RECLAMO)}</ClaimComment>
            else ()
        }
        <ClaimAddresses>
            {
                for $DIRECCION_SINIESTRO in $RqCrearReclamo/ns2:DIRECCION_SINIESTRO
                return 
                <ClaimAddress>
                    {
                        if ($DIRECCION_SINIESTRO/ns2:NOMBRE_PAIS)
                        then <Country>{fn:data($DIRECCION_SINIESTRO/ns2:NOMBRE_PAIS)}</Country>
                        else ()
                    }
                    {
                        if ($DIRECCION_SINIESTRO/ns2:CODIGO_PAIS)
                        then <CountryCode>{fn:data($DIRECCION_SINIESTRO/ns2:CODIGO_PAIS)}</CountryCode>
                        else ()
                    }
                    {
                        if ($DIRECCION_SINIESTRO/ns2:NOMBRE_ESTADO)
                        then <State>{fn:data($DIRECCION_SINIESTRO/ns2:NOMBRE_ESTADO)}</State>
                        else ()
                    }
                    {
                        if ($DIRECCION_SINIESTRO/ns2:CODIGO_ESTADO)
                        then <CountryState>{fn:data($DIRECCION_SINIESTRO/ns2:CODIGO_ESTADO)}</CountryState>
                        else ()
                    }
                    {
                        if ($DIRECCION_SINIESTRO/ns2:NOMBRE_REGION)
                        then <Region>{fn:data($DIRECCION_SINIESTRO/ns2:NOMBRE_REGION)}</Region>
                        else ()
                    }
                    {
                        if ($DIRECCION_SINIESTRO/ns2:CODIGO_REGION)
                        then <StateRegion>{fn:data($DIRECCION_SINIESTRO/ns2:CODIGO_REGION)}</StateRegion>
                        else ()
                    }
                    {
                        if ($DIRECCION_SINIESTRO/ns2:NOMBRE_CIUDAD)
                        then <City>{fn:data($DIRECCION_SINIESTRO/ns2:NOMBRE_CIUDAD)}</City>
                        else ()
                    }
                    {
                        if ($DIRECCION_SINIESTRO/ns2:CODIGO_CIUDAD)
                        then <CityCode>{fn:data($DIRECCION_SINIESTRO/ns2:CODIGO_CIUDAD)}</CityCode>
                        else ()
                    }
                    <ResidentialAddress>
                        {
                            if ($DIRECCION_SINIESTRO/ns2:BARRIO)
                            then <QuarterName>{fn:data($DIRECCION_SINIESTRO/ns2:BARRIO)}</QuarterName>
                            else ()
                        }
                        <QuarterID></QuarterID>
                        {
                            if ($DIRECCION_SINIESTRO/ns2:CALLE_AVENIDA)
                            then <StreetName>{fn:data($DIRECCION_SINIESTRO/ns2:CALLE_AVENIDA)}</StreetName>
                            else ()
                        }
                        <StreetID></StreetID>
                        {
                            if ($DIRECCION_SINIESTRO/ns2:CALLE_AVENIDA_NRO)
                            then <StreetNo>{fn:data($DIRECCION_SINIESTRO/ns2:CALLE_AVENIDA_NRO)}</StreetNo>
                            else ()
                        }
                        {
                            if ($DIRECCION_SINIESTRO/ns2:EDIFICIO)
                            then <BlockNo>{fn:data($DIRECCION_SINIESTRO/ns2:EDIFICIO)}</BlockNo>
                            else ()
                        }
                        {
                            if ($DIRECCION_SINIESTRO/ns2:ENTRADA)
                            then <Entrance>{fn:data($DIRECCION_SINIESTRO/ns2:ENTRADA)}</Entrance>
                            else ()
                        }
                        {
                            if ($DIRECCION_SINIESTRO/ns2:PISO)
                            then <Floor>{fn:data($DIRECCION_SINIESTRO/ns2:PISO)}</Floor>
                            else ()
                        }
                        {
                            if ($DIRECCION_SINIESTRO/ns2:APTO_CASA)
                            then <Apartment>{fn:data($DIRECCION_SINIESTRO/ns2:APTO_CASA)}</Apartment>
                            else ()
                        }
                    </ResidentialAddress>
                    <AddressType>{fn:data($DIRECCION_SINIESTRO/ns2:TIPO_DIRECCION)}</AddressType>
                    {
                        if ($DIRECCION_SINIESTRO/ns2:DIRECCION)
                        then <Address>{fn:data($DIRECCION_SINIESTRO/ns2:DIRECCION)}</Address>
                        else ()
                    }
                    {
                        if ($DIRECCION_SINIESTRO/ns2:ES_CORRESPONDENCIA)
                        then <MailYN>{fn:data($DIRECCION_SINIESTRO/ns2:ES_CORRESPONDENCIA)}</MailYN>
                        else ()
                    }
                    {
                        if ($DIRECCION_SINIESTRO/ns2:ES_FACTURACION)
                        then <InvoiceYN>{fn:data($DIRECCION_SINIESTRO/ns2:ES_FACTURACION)}</InvoiceYN>
                        else ()
                    }
                    {
                        if ($DIRECCION_SINIESTRO/ns2:OBSERVACION)
                        then <Notes>{fn:data($DIRECCION_SINIESTRO/ns2:OBSERVACION)}</Notes>
                        else ()
                    }
                    {
                        if ($DIRECCION_SINIESTRO/ns2:ES_PRINCIPAL)
                        then <PrimaryFlag>{fn:data($DIRECCION_SINIESTRO/ns2:ES_PRINCIPAL)}</PrimaryFlag>
                        else ()
                    }
                    {
                        if ($DIRECCION_SINIESTRO/ns2:TELEFONO)
                        then <Phone>{fn:data($DIRECCION_SINIESTRO/ns2:TELEFONO)}</Phone>
                        else ()
                    }
                    {
                        if ($DIRECCION_SINIESTRO/ns2:FAX)
                        then <Fax>{fn:data($DIRECCION_SINIESTRO/ns2:FAX)}</Fax>
                        else ()
                    }
                    {
                        if ($DIRECCION_SINIESTRO/ns2:EMAIL)
                        then <Email>{fn:data($DIRECCION_SINIESTRO/ns2:EMAIL)}</Email>
                        else ()
                    }</ClaimAddress>
            }
        </ClaimAddresses>
        <Participants>
            {
                for $PARTICIPANTES in $RqCrearReclamo/ns2:PARTICIPANTES
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
                            <CustomProperty>
                                <FieldName></FieldName>
                                <FieldLabel></FieldLabel>
                                <Value></Value>
                            </CustomProperty>
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
                    <BankAccounts>
                        {
                            for $DATOS_BANCARIOS in $PARTICIPANTES/ns2:PERSONA/ns2:DATOS_BANCARIOS
                            return 
                            <BankAccount>
                                {
                                    if ($DATOS_BANCARIOS/ns2:IDENTIFICADOR_CUENTA)
                                    then <BankAccID>{fn:data($DATOS_BANCARIOS/ns2:IDENTIFICADOR_CUENTA)}</BankAccID>
                                    else ()
                                }
                                <BankName>{fn:data($DATOS_BANCARIOS/ns2:BANCO_NOMBRE)}</BankName>
                                <BankPID>{fn:data($DATOS_BANCARIOS/ns2:IDENTIFICADOR_BANCO)}</BankPID>
                                <AccountNo>{fn:data($DATOS_BANCARIOS/ns2:NUMERO_CUENTA)}</AccountNo>
                                <Currency>{fn:data($DATOS_BANCARIOS/ns2:MONEDA)}</Currency>
                                {
                                    if ($DATOS_BANCARIOS/ns2:ESTADO)
                                    then <AccountState>{fn:data($DATOS_BANCARIOS/ns2:ESTADO)}</AccountState>
                                    else ()
                                }
                                {
                                    if ($DATOS_BANCARIOS/ns2:ES_PRINCIPAL)
                                    then <PrimaryFlag>{fn:data($DATOS_BANCARIOS/ns2:ES_PRINCIPAL)}</PrimaryFlag>
                                    else ()
                                }</BankAccount>
                        }
                    </BankAccounts>
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
                    <ClaimBankAccounts>
                        {
                            for $DATOS_BANCARIOS_RECLAMO in $PARTICIPANTES/ns2:DATOS_BANCARIOS_RECLAMO
                            return 
                            <ClaimBankAccount>
                                <BankAccount>
                                    {
                                        if ($DATOS_BANCARIOS_RECLAMO/ns2:IDENTIFICADOR_CUENTA)
                                        then <BankAccID>{fn:data($DATOS_BANCARIOS_RECLAMO/ns2:IDENTIFICADOR_CUENTA)}</BankAccID>
                                        else ()
                                    }
                                    {
                                        if ($DATOS_BANCARIOS_RECLAMO/ns2:BANCO_NOMBRE)
                                        then <BankName>{fn:data($DATOS_BANCARIOS_RECLAMO/ns2:BANCO_NOMBRE)}</BankName>
                                        else ()
                                    }
                                    <BankPID>{fn:data($DATOS_BANCARIOS_RECLAMO/ns2:IDENTIFICADOR_BANCO)}</BankPID>
                                    <AccountNo>{fn:data($DATOS_BANCARIOS_RECLAMO/ns2:NUMERO_CUENTA)}</AccountNo>
                                    {
                                        if ($DATOS_BANCARIOS_RECLAMO/ns2:MONEDA)
                                        then <Currency>{fn:data($DATOS_BANCARIOS_RECLAMO/ns2:MONEDA)}</Currency>
                                        else ()
                                    }
                                    {
                                        if ($DATOS_BANCARIOS_RECLAMO/ns2:ESTADO)
                                        then <AccountState>{fn:data($DATOS_BANCARIOS_RECLAMO/ns2:ESTADO)}</AccountState>
                                        else ()
                                    }
                                    {
                                        if ($DATOS_BANCARIOS_RECLAMO/ns2:ES_PRINCIPAL)
                                        then <PrimaryFlag>{fn:data($DATOS_BANCARIOS_RECLAMO/ns2:ES_PRINCIPAL)}</PrimaryFlag>
                                        else ()
                                    }
                                </BankAccount>
                            </ClaimBankAccount>
                        }
                    </ClaimBankAccounts>
                </Participant>
            }
        </Participants>
        <Requests>
		{	
			for $SOLICITUDES in $RqCrearReclamo/ns2:SOLICITUDES
            return 
            <Request>
                if ($SOLICITUDES/ns2:FECHA_SOLICITUD)
					then <RequestDate>{fn:data($SOLICITUDES/ns2:FECHA_SOLICITUD)}</RequestDate>
				else ()				
                if ($SOLICITUDES/ns2:MONTO_SOLICITUD)
					then <RequestSum>{fn:data($SOLICITUDES/ns2:MONTO_SOLICITUD)}</RequestSum>
				else ()
				if ($SOLICITUDES/ns2:MONEDA_SOLICITUD)
					then <Currency>{fn:data($SOLICITUDES/ns2:MONEDA_SOLICITUD)}</Currency>
				else ()
			    <Entity>
				   {
						if ($SOLICITUDES/ns2:SOLICITANTE/ns2:TIPO_PERSONA='N') then
							<PersonalData>
								<Name>
								{
									if ($SOLICITUDES/ns2:SOLICITANTE/ns2:PERSONA_NATURAL/ns2:NOMBRE)
									then <Given>{fn:data($SOLICITUDES/ns2:SOLICITANTE/ns2:PERSONA_NATURAL/ns2:NOMBRE)}</Given>
									else ()
								}
								{
									if ($SOLICITUDES/ns2:SOLICITANTE/ns2:PERSONA_NATURAL/ns2:PRIMER_APELLIDO)
									then <Surname>{fn:data($SOLICITUDES/ns2:SOLICITANTE/ns2:PERSONA_NATURAL/ns2:PRIMER_APELLIDO)}</Surname>
									else ()
								}
								{
									if ($SOLICITUDES/ns2:SOLICITANTE/ns2:PERSONA_NATURAL/ns2:SEGUNDO_APELLIDO)
									then <Family>{fn:data($SOLICITUDES/ns2:SOLICITANTE/ns2:PERSONA_NATURAL/ns2:SEGUNDO_APELLIDO)}</Family>
									else ()
								}
							</Name>
							<PID>{fn:data($SOLICITUDES/ns2:SOLICITANTE/ns2:PERSONA_NATURAL/ns2:IDENTIFICACION)}</PID>
							{
								if ($SOLICITUDES/ns2:SOLICITANTE/ns2:PERSONA_NATURAL/ns2:SEXO)
								then <Gender>{fn:data($SOLICITUDES/ns2:SOLICITANTE/ns2:PERSONA_NATURAL/ns2:SEXO)}</Gender>
								else ()
							}
							{
								if ($SOLICITUDES/ns2:SOLICITANTE/ns2:PERSONA_NATURAL/ns2:FECHA_DE_NACIMIENTO)
								then <BirthDate>{fn:data($SOLICITUDES/ns2:SOLICITANTE/ns2:PERSONA_NATURAL/ns2:FECHA_DE_NACIMIENTO)}</BirthDate>
								else ()
							}
							{
								if ($SOLICITUDES/ns2:SOLICITANTE/ns2:PERSONA_NATURAL/ns2:IDIOMA)
								then <Language>{fn:data($SOLICITUDES/ns2:SOLICITANTE/ns2:PERSONA_NATURAL/ns2:IDIOMA)}</Language>
								else ()
							}
							{
								if ($SOLICITUDES/ns2:SOLICITANTE/ns2:PERSONA_NATURAL/ns2:PAIS_RESIDENCIA)
								then <HomeCountry>{fn:data($SOLICITUDES/ns2:SOLICITANTE/ns2:PERSONA_NATURAL/ns2:PAIS_RESIDENCIA)}</HomeCountry>
								else ()
							}
							</PersonalData>
						else
							<CompanyData>
								<Name>{fn:data($SOLICITUDES/ns2:SOLICITANTE/ns2:PERSONA_JURIDICA/ns2:RAZONSOCIAL)}</Name>
								<CustomerID>{fn:data($SOLICITUDES/ns2:SOLICITANTE/ns2:PERSONA_JURIDICA/ns2:ID_CLIENTE)}</CustomerID>
								{
									if ($SOLICITUDES/ns2:SOLICITANTE/ns2:PERSONA_JURIDICA/ns2:PERIODO_FISCAL)
									then <FiscalPeriod>{fn:data($SOLICITUDES/ns2:SOLICITANTE/ns2:PERSONA_JURIDICA/ns2:PERIODO_FISCAL)}</FiscalPeriod>
									else ()
								}
								{
									if ($SOLICITUDES/ns2:SOLICITANTE/ns2:PERSONA_JURIDICA/ns2:TIPO_PERSONA_JURIDICA)
									then <CompType>{fn:data($SOLICITUDES/ns2:SOLICITANTE/ns2:PERSONA_JURIDICA/ns2:TIPO_PERSONA_JURIDICA)}</CompType>
									else ()
								}
							</CompanyData>
					}
					{
						if ($SOLICITUDES/ns2:SOLICITANTE/ns2:NACIONALIDAD)
						then <Nationality>{fn:data($SOLICITUDES/ns2:SOLICITANTE/ns2:NACIONALIDAD)}</Nationality>
						else ()
					}
					{
						if ($SOLICITUDES/ns2:SOLICITANTE/ns2:INDUSTRIA)
						then <IndustryCode>{fn:data($SOLICITUDES/ns2:SOLICITANTE/ns2:INDUSTRIA)}</IndustryCode>
						else ()
					}
					{
						if ($SOLICITUDES/ns2:SOLICITANTE/ns2:SUBINDUSTRIA)
						then <SubIndustryCode>{fn:data($SOLICITUDES/ns2:SOLICITANTE/ns2:SUBINDUSTRIA)}</SubIndustryCode>
						else ()
					}
					{
						if ($SOLICITUDES/ns2:SOLICITANTE/ns2:FECHA_REGISTRO)
						then <RegistrationDate>{fn:data($SOLICITUDES/ns2:SOLICITANTE/ns2:FECHA_REGISTRO)}</RegistrationDate>
						else ()
					}
					{
						if ($SOLICITUDES/ns2:SOLICITANTE/ns2:OBSERVACION)
						then <Notes>{fn:data($SOLICITUDES/ns2:SOLICITANTE/ns2:OBSERVACION)}</Notes>
						else ()
					}
					<Questionary>
						{
							for $PREGUNTAS in $SOLICITUDES/ns2:SOLICITANTE/ns2:PREGUNTAS
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
						<CustomProperty>
							<FieldName></FieldName>
							<FieldLabel></FieldLabel>
							<Value></Value>
						</CustomProperty>
					</CustomProperties>
				</Entity>
				<Addresses>
					{
					for $DIRECCIONES in $SOLICITUDES/ns2:SOLICITANTE/ns2:DIRECCIONES
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
						for $CONTACTOS in $SOLICITUDES/ns2:SOLICITANTE/ns2:CONTACTOS
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
				<BankAccounts>
					{
						for $DATOS_BANCARIOS in $SOLICITUDES/ns2:SOLICITANTE/ns2:DATOS_BANCARIOS
						return 
						<BankAccount>
							{
								if ($DATOS_BANCARIOS/ns2:IDENTIFICADOR_CUENTA)
								then <BankAccID>{fn:data($DATOS_BANCARIOS/ns2:IDENTIFICADOR_CUENTA)}</BankAccID>
								else ()
							}
							<BankName>{fn:data($DATOS_BANCARIOS/ns2:BANCO_NOMBRE)}</BankName>
							<BankPID>{fn:data($DATOS_BANCARIOS/ns2:IDENTIFICADOR_BANCO)}</BankPID>
							<AccountNo>{fn:data($DATOS_BANCARIOS/ns2:NUMERO_CUENTA)}</AccountNo>
							<Currency>{fn:data($DATOS_BANCARIOS/ns2:MONEDA)}</Currency>
							{
								if ($DATOS_BANCARIOS/ns2:ESTADO)
								then <AccountState>{fn:data($DATOS_BANCARIOS/ns2:ESTADO)}</AccountState>
								else ()
							}
							{
								if ($DATOS_BANCARIOS/ns2:ES_PRINCIPAL)
								then <PrimaryFlag>{fn:data($DATOS_BANCARIOS/ns2:ES_PRINCIPAL)}</PrimaryFlag>
								else ()
							}</BankAccount>
					}
				</BankAccounts>
                if ($SOLICITUDES/ns2:TIPO_SOLICITUD)
					then <ClaimantType>{fn:data($SOLICITUDES/ns2:TIPO_SOLICITUD)}</ClaimantType>
				else ()	
				if ($SOLICITUDES/ns2:TIPO_SOLICITUD)
					then <PaymentType>{fn:data($SOLICITUDES/ns2:TIPO_SOLICITUD)}</PaymentType>
				else ()					
                if ($SOLICITUDES/ns2:TIPO_SOLICITUD)
					then <ProviderID>{fn:data($SOLICITUDES/ns2:TIPO_SOLICITUD)}</ProviderID>
				else ()	
				<InjuredObjects>
                    {
					for $OBJETO_SINIESTRO in $RqCrearReclamo/ns2:SOLICITUDES/ns2:OBJETO
					return 
					<InjuredObject>
                        {
							if ($OBJETO_SINIESTRO/ns2:SECUENCIA_OBJETO)
								then <ClaimObjSeq>{fn:data($OBJETO_SINIESTRO/ns2:SECUENCIA_OBJETO)}</ClaimObjSeq>
							else ()	
						}
						{
							if ($OBJETO_SINIESTRO/ns2:CODIGO_OBJETO)
								then <ObjectID>{fn:data($OBJETO_SINIESTRO/ns2:CODIGO_OBJETO)}</ObjectID>
							else ()	
						}
						{
							if ($OBJETO_SINIESTRO/ns2:MONTO_OBJETO)
								then <InitialReserve>{fn:data($OBJETO_SINIESTRO/ns2:MONTO_OBJETO)}</InitialReserve>
							else ()	
						}
						{
							if ($OBJETO_SINIESTRO/ns2:MONEDA_OBJETO)
								then <Currency>{fn:data($OBJETO_SINIESTRO/ns2:MONEDA_OBJETO)}</Currency>
							else ()	
						}
						<Driver>
							<Entity>
								 <PersonalData>
									<Name>
										{
											if ($OBJETO_SINIESTRO/ns2:CONDUCTOR/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:NOMBRE)
											then <Given>{fn:data($OBJETO_SINIESTRO/ns2:CONDUCTOR/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:NOMBRE)}</Given>
											else ()
										}
										{
											if ($OBJETO_SINIESTRO/ns2:CONDUCTOR/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:PRIMER_APELLIDO)
											then <Surname>{fn:data($OBJETO_SINIESTRO/ns2:CONDUCTOR/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:PRIMER_APELLIDO)}</Surname>
											else ()
										}
										{
											if ($OBJETO_SINIESTRO/ns2:CONDUCTOR/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:SEGUNDO_APELLIDO)
											then <Family>{fn:data($OBJETO_SINIESTRO/ns2:CONDUCTOR/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:SEGUNDO_APELLIDO)}</Family>
											else ()
										}
									</Name>
									<PID>{fn:data($OBJETO_SINIESTRO/ns2:CONDUCTOR/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:IDENTIFICACION)}</PID>
									{
										if ($OBJETO_SINIESTRO/ns2:CONDUCTOR/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:SEXO)
										then <Gender>{fn:data($OBJETO_SINIESTRO/ns2:CONDUCTOR/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:SEXO)}</Gender>
										else ()
									}
									{
										if ($OBJETO_SINIESTRO/ns2:CONDUCTOR/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:FECHA_DE_NACIMIENTO)
										then <BirthDate>{fn:data($OBJETO_SINIESTRO/ns2:CONDUCTOR/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:FECHA_DE_NACIMIENTO)}</BirthDate>
										else ()
									}
									{
										if ($OBJETO_SINIESTRO/ns2:CONDUCTOR/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:IDIOMA)
										then <Language>{fn:data($OBJETO_SINIESTRO/ns2:CONDUCTOR/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:IDIOMA)}</Language>
										else ()
									}
									{
										if ($OBJETO_SINIESTRO/ns2:CONDUCTOR/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:PAIS_RESIDENCIA)
										then <HomeCountry>{fn:data($OBJETO_SINIESTRO/ns2:CONDUCTOR/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:PAIS_RESIDENCIA)}</HomeCountry>
										else ()
									}
								</PersonalData>
								{
									if ($OBJETO_SINIESTRO/ns2:CONDUCTOR/ns2:PERSONA/ns2:NACIONALIDAD)
									then <Nationality>{fn:data($OBJETO_SINIESTRO/ns2:CONDUCTOR/ns2:PERSONA/ns2:NACIONALIDAD)}</Nationality>
									else ()
								}
								{
									if ($OBJETO_SINIESTRO/ns2:CONDUCTOR/ns2:PERSONA/ns2:INDUSTRIA)
									then <IndustryCode>{fn:data($OBJETO_SINIESTRO/ns2:CONDUCTOR/ns2:PERSONA/ns2:INDUSTRIA)}</IndustryCode>
									else ()
								}
								{
									if ($OBJETO_SINIESTRO/ns2:CONDUCTOR/ns2:PERSONA/ns2:SUBINDUSTRIA)
									then <SubIndustryCode>{fn:data($OBJETO_SINIESTRO/ns2:CONDUCTOR/ns2:PERSONA/ns2:SUBINDUSTRIA)}</SubIndustryCode>
									else ()
								}
								{
									if ($OBJETO_SINIESTRO/ns2:CONDUCTOR/ns2:PERSONA/ns2:FECHA_REGISTRO)
									then <RegistrationDate>{fn:data($OBJETO_SINIESTRO/ns2:CONDUCTOR/ns2:PERSONA/ns2:FECHA_REGISTRO)}</RegistrationDate>
									else ()
								}
								{
									if ($OBJETO_SINIESTRO/ns2:CONDUCTOR/ns2:PERSONA/ns2:OBSERVACION)
									then <Notes>{fn:data($OBJETO_SINIESTRO/ns2:CONDUCTOR/ns2:PERSONA/ns2:OBSERVACION)}</Notes>
									else ()
								}
								<Questionary>
									{
										for $PREGUNTAS in $OBJETO_SINIESTRO/ns2:CONDUCTOR/ns2:PERSONA/ns2:PREGUNTAS
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
										<Part2ID></Part2ID>
										<RelID></RelID>
										<RelName></RelName>
										<ValidFrom></ValidFrom>
										<ValidFromTime></ValidFromTime>
										<ValidTo></ValidTo>
										<ValidToTime></ValidToTime>
									</PersonRelation>
								</PersonRelations>
								<CustomProperties>
									<CustomProperty>
										<FieldName></FieldName>
										<FieldLabel></FieldLabel>
										<Value></Value>
									</CustomProperty>
								</CustomProperties>
							</Entity>
							<Addresses>
								{
								for $DIRECCIONES in $OBJETO_SINIESTRO/ns2:CONDUCTOR/ns2:PERSONA/ns2:DIRECCIONES
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
									for $CONTACTOS in $OBJETO_SINIESTRO/ns2:CONDUCTOR/ns2:PERSONA/ns2:CONTACTOS
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
							<BankAccounts>
								{
									for $DATOS_BANCARIOS in $OBJETO_SINIESTRO/ns2:CONDUCTOR/ns2:PERSONA/ns2:DATOS_BANCARIOS
									return 
									<BankAccount>
										{
											if ($DATOS_BANCARIOS/ns2:IDENTIFICADOR_CUENTA)
											then <BankAccID>{fn:data($DATOS_BANCARIOS/ns2:IDENTIFICADOR_CUENTA)}</BankAccID>
											else ()
										}
										<BankName>{fn:data($DATOS_BANCARIOS/ns2:BANCO_NOMBRE)}</BankName>
										<BankPID>{fn:data($DATOS_BANCARIOS/ns2:IDENTIFICADOR_BANCO)}</BankPID>
										<AccountNo>{fn:data($DATOS_BANCARIOS/ns2:NUMERO_CUENTA)}</AccountNo>
										<Currency>{fn:data($DATOS_BANCARIOS/ns2:MONEDA)}</Currency>
										{
											if ($DATOS_BANCARIOS/ns2:ESTADO)
											then <AccountState>{fn:data($DATOS_BANCARIOS/ns2:ESTADO)}</AccountState>
											else ()
										}
										{
											if ($DATOS_BANCARIOS/ns2:ES_PRINCIPAL)
											then <PrimaryFlag>{fn:data($DATOS_BANCARIOS/ns2:ES_PRINCIPAL)}</PrimaryFlag>
											else ()
										}</BankAccount>
								}
							</BankAccounts>
                            {
								if ($OBJETO_SINIESTRO/ns2:CONDUCTOR/ns2:NRO_LICENCIA)
								then <LicenseID>{fn:data($OBJETO_SINIESTRO/ns2:CONDUCTOR/ns2:NRO_LICENCIA)}</LicenseID>
								else ()
							}
                            {
								if ($OBJETO_SINIESTRO/ns2:CONDUCTOR/ns2:EXPERIENCIA)
								then <Experience>{fn:data($OBJETO_SINIESTRO/ns2:CONDUCTOR/ns2:EXPERIENCIA)}</Experience>
								else ()
							}
                            {
								if ($OBJETO_SINIESTRO/ns2:CONDUCTOR/ns2:EDAD)
								then <Age>{fn:data($OBJETO_SINIESTRO/ns2:CONDUCTOR/ns2:EDAD)}</Age>
								else ()
							}
                        </Driver>
                        <CustomProperties>
                            <CustomProperty>
                                <FieldName></FieldName>
                                <FieldLabel></FieldLabel>
                                <Value></Value>
                            </CustomProperty>
                        </CustomProperties>
                    </InjuredObject>
					}
				</InjuredObjects>
                <ClaimAddresses>
				{
					for $DIRECCIONES_SOL in $RqCrearReclamo/ns2:SOLICITUDES/ns2:DIRECCION_SOLICITUD
					return 
                    <ClaimAddress>
                        {
							if ($DIRECCIONES_SOL/ns2:NOMBRE_PAIS)
							then <Country>{fn:data($DIRECCIONES_SOL/ns2:NOMBRE_PAIS)}</Country>
							else ()
						}
						{
							if ($DIRECCIONES_SOL/ns2:CODIGO_PAIS)
							then <CountryCode>{fn:data($DIRECCIONES_SOL/ns2:CODIGO_PAIS)}</CountryCode>
							else ()
						}
						{
							if ($DIRECCIONES_SOL/ns2:NOMBRE_ESTADO)
							then <State>{fn:data($DIRECCIONES_SOL/ns2:NOMBRE_ESTADO)}</State>
							else ()
						}
						{
							if ($DIRECCIONES_SOL/ns2:CODIGO_ESTADO)
							then <CountryState>{fn:data($DIRECCIONES_SOL/ns2:CODIGO_ESTADO)}</CountryState>
							else ()
						}
						{
							if ($DIRECCIONES_SOL/ns2:NOMBRE_REGION)
							then <Region>{fn:data($DIRECCIONES_SOL/ns2:NOMBRE_REGION)}</Region>
							else ()
						}
						{
							if ($DIRECCIONES_SOL/ns2:CODIGO_REGION)
							then <StateRegion>{fn:data($DIRECCIONES_SOL/ns2:CODIGO_REGION)}</StateRegion>
							else ()
						}
						{
							if ($DIRECCIONES_SOL/ns2:NOMBRE_CIUDAD)
							then <City>{fn:data($DIRECCIONES_SOL/ns2:NOMBRE_CIUDAD)}</City>
							else ()
						}
						{
							if ($DIRECCIONES_SOL/ns2:CODIGO_CIUDAD)
							then <CityCode>{fn:data($DIRECCIONES_SOL/ns2:CODIGO_CIUDAD)}</CityCode>
							else ()
						}
						<ResidentialAddress>
							{
								if ($DIRECCIONES_SOL/ns2:BARRIO)
								then <QuarterName>{fn:data($DIRECCIONES_SOL/ns2:BARRIO)}</QuarterName>
								else ()
							}
							<QuarterID></QuarterID>
							{
								if ($DIRECCIONES_SOL/ns2:CALLE_AVENIDA)
								then <StreetName>{fn:data($DIRECCIONES_SOL/ns2:CALLE_AVENIDA)}</StreetName>
								else ()
							}
							<StreetID></StreetID>
							{
								if ($DIRECCIONES_SOL/ns2:CALLE_AVENIDA_NRO)
								then <StreetNo>{fn:data($DIRECCIONES_SOL/ns2:CALLE_AVENIDA_NRO)}</StreetNo>
								else ()
							}
							{
								if ($DIRECCIONES_SOL/ns2:EDIFICIO)
								then <BlockNo>{fn:data($DIRECCIONES_SOL/ns2:EDIFICIO)}</BlockNo>
								else ()
							}
							{
								if ($DIRECCIONES_SOL/ns2:ENTRADA)
								then <Entrance>{fn:data($DIRECCIONES_SOL/ns2:ENTRADA)}</Entrance>
								else ()
							}
							{
								if ($DIRECCIONES_SOL/ns2:PISO)
								then <Floor>{fn:data($DIRECCIONES_SOL/ns2:PISO)}</Floor>
								else ()
							}
							{
								if ($DIRECCIONES_SOL/ns2:APTO_CASA)
								then <Apartment>{fn:data($DIRECCIONES_SOL/ns2:APTO_CASA)}</Apartment>
								else ()
							}
						</ResidentialAddress>
						<AddressType>{fn:data($DIRECCIONES_SOL/ns2:TIPO_DIRECCION)}</AddressType>
						{
							if ($DIRECCIONES_SOL/ns2:DIRECCION)
							then <Address>{fn:data($DIRECCIONES_SOL/ns2:DIRECCION)}</Address>
							else ()
						}
						{
							if ($DIRECCIONES_SOL/ns2:ES_CORRESPONDENCIA)
							then <MailYN>{fn:data($DIRECCIONES_SOL/ns2:ES_CORRESPONDENCIA)}</MailYN>
							else ()
						}
						{
							if ($DIRECCIONES_SOL/ns2:ES_FACTURACION)
							then <InvoiceYN>{fn:data($DIRECCIONES_SOL/ns2:ES_FACTURACION)}</InvoiceYN>
							else ()
						}
						{
							if ($DIRECCIONES_SOL/ns2:OBSERVACION)
							then <Notes>{fn:data($DIRECCIONES_SOL/ns2:OBSERVACION)}</Notes>
							else ()
						}
						{
							if ($DIRECCIONES_SOL/ns2:ES_PRINCIPAL)
							then <PrimaryFlag>{fn:data($DIRECCIONES_SOL/ns2:ES_PRINCIPAL)}</PrimaryFlag>
							else ()
						}
						{
							if ($DIRECCIONES_SOL/ns2:TELEFONO)
							then <Phone>{fn:data($DIRECCIONES_SOL/ns2:TELEFONO)}</Phone>
							else ()
						}
						{
							if ($DIRECCIONES_SOL/ns2:FAX)
							then <Fax>{fn:data($DIRECCIONES_SOL/ns2:FAX)}</Fax>
							else ()
						}
						{
							if ($DIRECCIONES_SOL/ns2:EMAIL)
							then <Email>{fn:data($DIRECCIONES_SOL/ns2:EMAIL)}</Email>
							else ()
						}
                    </ClaimAddress>
				}	
                </ClaimAddresses>
                <Participants>
					{
					for $PARTICIPANTES_SOL in $RqCrearReclamo/ns2:SOLICITUDES/ns2:PARTICIPANTES
					return 
                    <Participant>
                        <Entity>
                            {
								if ($PARTICIPANTES_SOL/ns2:PERSONA/ns2:TIPO_PERSONA='N') then
                                    <PersonalData>
										<Name>
											{
												if ($PARTICIPANTES_SOL/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:NOMBRE)
												then <Given>{fn:data($PARTICIPANTES_SOL/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:NOMBRE)}</Given>
												else ()
											}
											{
												if ($PARTICIPANTES_SOL/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:PRIMER_APELLIDO)
												then <Surname>{fn:data($PARTICIPANTES_SOL/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:PRIMER_APELLIDO)}</Surname>
												else ()
											}
											{
												if ($PARTICIPANTES_SOL/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:SEGUNDO_APELLIDO)
												then <Family>{fn:data($PARTICIPANTES_SOL/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:SEGUNDO_APELLIDO)}</Family>
												else ()
											}
										</Name>
										<PID>{fn:data($PARTICIPANTES_SOL/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:IDENTIFICACION)}</PID>
										{
											if ($PARTICIPANTES_SOL/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:SEXO)
											then <Gender>{fn:data($PARTICIPANTES_SOL/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:SEXO)}</Gender>
											else ()
										}
										{
											if ($PARTICIPANTES_SOL/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:FECHA_DE_NACIMIENTO)
											then <BirthDate>{fn:data($PARTICIPANTES_SOL/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:FECHA_DE_NACIMIENTO)}</BirthDate>
											else ()
										}
										{
											if ($PARTICIPANTES_SOL/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:IDIOMA)
											then <Language>{fn:data($PARTICIPANTES_SOL/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:IDIOMA)}</Language>
											else ()
										}
										{
											if ($PARTICIPANTES_SOL/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:PAIS_RESIDENCIA)
											then <HomeCountry>{fn:data($PARTICIPANTES_SOL/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:PAIS_RESIDENCIA)}</HomeCountry>
											else ()
										}
									</PersonalData>
                                else
                                    <CompanyData>
										<Name>{fn:data($PARTICIPANTES_SOL/ns2:PERSONA/ns2:PERSONA_JURIDICA/ns2:RAZONSOCIAL)}</Name>
										<CustomerID>{fn:data($PARTICIPANTES_SOL/ns2:PERSONA/ns2:PERSONA_JURIDICA/ns2:ID_CLIENTE)}</CustomerID>
										{
											if ($PARTICIPANTES_SOL/ns2:PERSONA/ns2:PERSONA_JURIDICA/ns2:PERIODO_FISCAL)
											then <FiscalPeriod>{fn:data($PARTICIPANTES_SOL/ns2:PERSONA/ns2:PERSONA_JURIDICA/ns2:PERIODO_FISCAL)}</FiscalPeriod>
											else ()
										}
										{
											if ($PARTICIPANTES_SOL/ns2:PERSONA/ns2:PERSONA_JURIDICA/ns2:TIPO_PERSONA_JURIDICA)
											then <CompType>{fn:data($PARTICIPANTES_SOL/ns2:PERSONA/ns2:PERSONA_JURIDICA/ns2:TIPO_PERSONA_JURIDICA)}</CompType>
											else ()
										}
									</CompanyData>
                            }
                            {
								if ($PARTICIPANTES_SOL/ns2:PERSONA/ns2:NACIONALIDAD)
								then <Nationality>{fn:data($PARTICIPANTES_SOL/ns2:PERSONA/ns2:NACIONALIDAD)}</Nationality>
								else ()
							}
							{
								if ($PARTICIPANTES_SOL/ns2:PERSONA/ns2:INDUSTRIA)
								then <IndustryCode>{fn:data($PARTICIPANTES_SOL/ns2:PERSONA/ns2:INDUSTRIA)}</IndustryCode>
								else ()
							}
							{
								if ($PARTICIPANTES_SOL/ns2:PERSONA/ns2:SUBINDUSTRIA)
								then <SubIndustryCode>{fn:data($PARTICIPANTES_SOL/ns2:PERSONA/ns2:SUBINDUSTRIA)}</SubIndustryCode>
								else ()
							}
							{
								if ($PARTICIPANTES_SOL/ns2:PERSONA/ns2:FECHA_REGISTRO)
								then <RegistrationDate>{fn:data($PARTICIPANTES_SOL/ns2:PERSONA/ns2:FECHA_REGISTRO)}</RegistrationDate>
								else ()
							}
							{
								if ($PARTICIPANTES_SOL/ns2:PERSONA/ns2:OBSERVACION)
								then <Notes>{fn:data($PARTICIPANTES_SOL/ns2:PERSONA/ns2:OBSERVACION)}</Notes>
								else ()
							}
                            <Questionary>
                                {
                                for $PREGUNTAS in $PARTICIPANTES_SOL/ns2:PERSONA/ns2:PREGUNTAS
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
                                    }
								</Question>
                            }
                            </Questionary>
                            <PersonRelations>
                                <PersonRelation>
                                    <RelID></RelID>
                                    <RelName></RelName>
                                    <ValidFrom></ValidFrom>
                                    <ValidFromTime></ValidFromTime>
                                    <ValidTo></ValidTo>
                                    <ValidToTime></ValidToTime>
                                </PersonRelation>
                            </PersonRelations>
                            <CustomProperties>
                                <CustomProperty>
                                    <FieldName></FieldName>
                                    <FieldLabel></FieldLabel>
                                    <Value></Value>
                                </CustomProperty>
                            </CustomProperties>
                        </Entity>
                        <Addresses>
							{
							for $DIRECCIONES in $PARTICIPANTES_SOL/ns2:PERSONA/ns2:DIRECCIONES
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
								for $CONTACTOS in $PARTICIPANTES_SOL/ns2:PERSONA/ns2:CONTACTOS
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
                        <BankAccounts>
                            {
                            for $DATOS_BANCARIOS in $PARTICIPANTES_SOL/ns2:PERSONA/ns2:DATOS_BANCARIOS
                            return 
                            <BankAccount>
                                {
                                    if ($DATOS_BANCARIOS/ns2:IDENTIFICADOR_CUENTA)
                                    then <BankAccID>{fn:data($DATOS_BANCARIOS/ns2:IDENTIFICADOR_CUENTA)}</BankAccID>
                                    else ()
                                }
                                <BankName>{fn:data($DATOS_BANCARIOS/ns2:BANCO_NOMBRE)}</BankName>
                                <BankPID>{fn:data($DATOS_BANCARIOS/ns2:IDENTIFICADOR_BANCO)}</BankPID>
                                <AccountNo>{fn:data($DATOS_BANCARIOS/ns2:NUMERO_CUENTA)}</AccountNo>
                                <Currency>{fn:data($DATOS_BANCARIOS/ns2:MONEDA)}</Currency>
                                {
                                    if ($DATOS_BANCARIOS/ns2:ESTADO)
                                    then <AccountState>{fn:data($DATOS_BANCARIOS/ns2:ESTADO)}</AccountState>
                                    else ()
                                }
                                {
                                    if ($DATOS_BANCARIOS/ns2:ES_PRINCIPAL)
                                    then <PrimaryFlag>{fn:data($DATOS_BANCARIOS/ns2:ES_PRINCIPAL)}</PrimaryFlag>
                                    else ()
                                }
							</BankAccount>
                        }
                        </BankAccounts>
                        {
							if ($PARTICIPANTES_SOL/ns2:RELACION)
							then <ParticipantRole>{fn:data($PARTICIPANTES_SOL/ns2:RELACION)}</ParticipantRole>
							else ()
						}
						{
							if ($PARTICIPANTES_SOL/ns2:FECHA_OPERACION)
							then <AppointmentDate>{fn:data($PARTICIPANTES_SOL/ns2:FECHA_OPERACION)}</AppointmentDate>
							else ()
						}
						{
							if ($PARTICIPANTES_SOL/ns2:NUMERO_REPORTE)
							then <ReportNo>{fn:data($PARTICIPANTES_SOL/ns2:NUMERO_REPORTE)}</ReportNo>
							else ()
						}
						{
							if ($PARTICIPANTES_SOL/ns2:FECHA_REPORTE)
							then <ReportDate>{fn:data($PARTICIPANTES_SOL/ns2:FECHA_REPORTE)}</ReportDate>
							else ()
						}
						{
							if ($PARTICIPANTES_SOL/ns2:PORCENTAJE_REPORTE)
							then <Percentage>{fn:data($PARTICIPANTES_SOL/ns2:PORCENTAJE_REPORTE)}</Percentage>
							else ()
						}
						<ClaimBankAccounts>
                            <ClaimBankAccount>
                                <BankAccount>
                                    {
										if ($PARTICIPANTES_SOL/ns2:DATOS_BANCARIOS_RECLAMO/ns2:IDENTIFICADOR_CUENTA)
										then <BankAccID>{fn:data($PARTICIPANTES_SOL/ns2:DATOS_BANCARIOS_RECLAMO/ns2:IDENTIFICADOR_CUENTA)}</BankAccID>
										else ()
									}
									<BankName>{fn:data($PARTICIPANTES_SOL/ns2:DATOS_BANCARIOS_RECLAMO/ns2:BANCO_NOMBRE)}</BankName>
									<BankPID>{fn:data($PARTICIPANTES_SOL/ns2:DATOS_BANCARIOS_RECLAMO/ns2:IDENTIFICADOR_BANCO)}</BankPID>
									<AccountNo>{fn:data($PARTICIPANTES_SOL/ns2:DATOS_BANCARIOS_RECLAMO/ns2:NUMERO_CUENTA)}</AccountNo>
									<Currency>{fn:data($PARTICIPANTES_SOL/ns2:DATOS_BANCARIOS_RECLAMO/ns2:MONEDA)}</Currency>
									{
										if ($PARTICIPANTES_SOL/ns2:DATOS_BANCARIOS_RECLAMO/ns2:ESTADO)
										then <AccountState>{fn:data($PARTICIPANTES_SOL/ns2:DATOS_BANCARIOS_RECLAMO/ns2:ESTADO)}</AccountState>
										else ()
									}
									{
										if ($PARTICIPANTES_SOL/ns2:DATOS_BANCARIOS_RECLAMO/ns2:ES_PRINCIPAL)
										then <PrimaryFlag>{fn:data($PARTICIPANTES_SOL/ns2:DATOS_BANCARIOS_RECLAMO/ns2:ES_PRINCIPAL)}</PrimaryFlag>
										else ()
									}
                                </BankAccount>                                
                            </ClaimBankAccount>
                        </ClaimBankAccounts>
                    </Participant>
					}
				</Participants>
                <Questionary>
                    {
					for $PREGUNTAS_SOL in $RqCrearReclamo/ns2:SOLICITUDES/ns2:PREGUNTAS
					return 
					<Question>
						<ID>{fn:data($PREGUNTAS_SOL/ns2:CODIGO)}</ID>
						{
							if ($PREGUNTAS_SOL/ns2:RESPUESTA)
							then <Answer>{fn:data($PREGUNTAS_SOL/ns2:RESPUESTA)}</Answer>
							else ()
						}
						{
							if ($PREGUNTAS_SOL/ns2:IDENTIFICADOR)
							then <AnnexID>{fn:data($PREGUNTAS_SOL/ns2:IDENTIFICADOR)}</AnnexID>
							else ()
						}
					</Question>
					}
                </Questionary>
                <Guilty>
                    <GuiltyPerson>
                        <Entity>
                            {
                            if ($RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:PERSONA/ns2:TIPO_PERSONA='N') then
							<PersonalData>
								<Name>
									{
										if ($RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:NOMBRE)
										then <Given>{fn:data($RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:NOMBRE)}</Given>
										else ()
									}
									{
										if ($RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:PRIMER_APELLIDO)
										then <Surname>{fn:data($RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:PRIMER_APELLIDO)}</Surname>
										else ()
									}
									{
										if ($RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:SEGUNDO_APELLIDO)
										then <Family>{fn:data($RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:SEGUNDO_APELLIDO)}</Family>
										else ()
									}
								</Name>
								<PID>{fn:data($RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:IDENTIFICACION)}</PID>
								{
									if ($RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:SEXO)
									then <Gender>{fn:data($RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:SEXO)}</Gender>
									else ()
								}
								{
									if ($RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:FECHA_DE_NACIMIENTO)
									then <BirthDate>{fn:data($RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:FECHA_DE_NACIMIENTO)}</BirthDate>
									else ()
								}
								{
									if ($RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:IDIOMA)
									then <Language>{fn:data($RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:IDIOMA)}</Language>
									else ()
								}
								{
									if ($RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:PAIS_RESIDENCIA)
									then <HomeCountry>{fn:data($RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:PERSONA/ns2:PERSONA_NATURAL/ns2:PAIS_RESIDENCIA)}</HomeCountry>
									else ()
								}
							</PersonalData>
                            else
                                <CompanyData>
                                    <Name>{fn:data($RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:PERSONA/ns2:PERSONA_JURIDICA/ns2:RAZONSOCIAL)}</Name>
                                    <CustomerID>{fn:data($RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:PERSONA/ns2:PERSONA_JURIDICA/ns2:ID_CLIENTE)}</CustomerID>
                                    {
                                        if ($RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:PERSONA/ns2:PERSONA_JURIDICA/ns2:PERIODO_FISCAL)
                                        then <FiscalPeriod>{fn:data($RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:PERSONA/ns2:PERSONA_JURIDICA/ns2:PERIODO_FISCAL)}</FiscalPeriod>
                                        else ()
                                    }
                                    {
                                        if ($RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:PERSONA/ns2:PERSONA_JURIDICA/ns2:TIPO_PERSONA_JURIDICA)
                                        then <CompType>{fn:data($RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:PERSONA/ns2:PERSONA_JURIDICA/ns2:TIPO_PERSONA_JURIDICA)}</CompType>
                                        else ()
                                    }
                                </CompanyData>
                            }
                            {
								if ($RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:PERSONA/ns2:NACIONALIDAD)
								then <Nationality>{fn:data($RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:PERSONA/ns2:NACIONALIDAD)}</Nationality>
								else ()
							}
							{
								if ($RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:PERSONA/ns2:INDUSTRIA)
								then <IndustryCode>{fn:data($RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:PERSONA/ns2:INDUSTRIA)}</IndustryCode>
								else ()
							}
							{
								if ($RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:PERSONA/ns2:SUBINDUSTRIA)
								then <SubIndustryCode>{fn:data($RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:PERSONA/ns2:SUBINDUSTRIA)}</SubIndustryCode>
								else ()
							}
							{
								if ($RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:PERSONA/ns2:FECHA_REGISTRO)
								then <RegistrationDate>{fn:data($RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:PERSONA/ns2:FECHA_REGISTRO)}</RegistrationDate>
								else ()
							}
							{
								if ($RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:PERSONA/ns2:OBSERVACION)
								then <Notes>{fn:data($RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:PERSONA/ns2:OBSERVACION)}</Notes>
								else ()
							}
                            <Questionary>
                                {
									for $PREGUNTAS in $RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:PERSONA/ns2:PREGUNTAS
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
                                    <Part2ID></Part2ID>
                                    <RelID></RelID>
                                    <RelName></RelName>
                                    <ValidFrom></ValidFrom>
                                    <ValidFromTime></ValidFromTime>
                                    <ValidTo></ValidTo>
                                    <ValidToTime></ValidToTime>
                                </PersonRelation>
                            </PersonRelations>
                            <CustomProperties>
                                <CustomProperty>
                                    <FieldName></FieldName>
                                    <FieldLabel></FieldLabel>
                                    <Value></Value>
                                </CustomProperty>
                            </CustomProperties>
                        </Entity>
                        <Addresses>
                            {
								for $DIRECCIONES in $RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:PERSONA/ns2:DIRECCIONES
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
								for $CONTACTOS in $RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:PERSONA/ns2:CONTACTOS
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
						<BankAccounts>
                        {
                            for $DATOS_BANCARIOS in $RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:PERSONA/ns2:DATOS_BANCARIOS
                            return 
                            <BankAccount>
                                {
                                    if ($DATOS_BANCARIOS/ns2:IDENTIFICADOR_CUENTA)
                                    then <BankAccID>{fn:data($DATOS_BANCARIOS/ns2:IDENTIFICADOR_CUENTA)}</BankAccID>
                                    else ()
                                }
                                <BankName>{fn:data($DATOS_BANCARIOS/ns2:BANCO_NOMBRE)}</BankName>
                                <BankPID>{fn:data($DATOS_BANCARIOS/ns2:IDENTIFICADOR_BANCO)}</BankPID>
                                <AccountNo>{fn:data($DATOS_BANCARIOS/ns2:NUMERO_CUENTA)}</AccountNo>
                                <Currency>{fn:data($DATOS_BANCARIOS/ns2:MONEDA)}</Currency>
                                {
                                    if ($DATOS_BANCARIOS/ns2:ESTADO)
                                    then <AccountState>{fn:data($DATOS_BANCARIOS/ns2:ESTADO)}</AccountState>
                                    else ()
                                }
                                {
                                    if ($DATOS_BANCARIOS/ns2:ES_PRINCIPAL)
                                    then <PrimaryFlag>{fn:data($DATOS_BANCARIOS/ns2:ES_PRINCIPAL)}</PrimaryFlag>
                                    else ()
                                }</BankAccount>
                        }
						</BankAccounts>
					</GuiltyPerson>
                    {
						if ($RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:NUMERO_POLIZA_CULPABLE)
						then <PolicyNo>{fn:data($RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:NUMERO_POLIZA_CULPABLE)}</PolicyNo>
						else ()
					}
					{
						if ($RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:RAZON_CULPABLE)
						then <RegressReason>{fn:data($RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:RAZON_CULPABLE)}</RegressReason>
						else ()
					}
					{
						if ($RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:ASEGURADORA_CULPABLE)
						then <InsurerID>{fn:data($RqCrearReclamo/ns2:SOLICITUDES/ns2:CULPABLE/ns2:ASEGURADORA_CULPABLE)}</InsurerID>
						else ()
					}
                </Guilty>
                <AnnuityRecipients>
                    {
						for $BENEFICIARIOS_RECLAMO in $RqCrearReclamo/ns2:SOLICITUDES/ns2:BENEFICIARIOS
						return 
						<AnnuityRecipient>
							{
								if ($BENEFICIARIOS_RECLAMO/ns2:IDENTIFICACION_BENEFICIARIO)
								then <PID>{fn:data($BENEFICIARIOS_RECLAMO/ns2:IDENTIFICACION_BENEFICIARIO)}</PID>
								else ()
							}
							{
								if ($BENEFICIARIOS_RECLAMO/ns2:TIPO_PERSONA)
								then <EntityType>{fn:data($BENEFICIARIOS_RECLAMO/ns2:TIPO_PERSONA)}</EntityType>
								else ()
							}
							{
								if ($BENEFICIARIOS_RECLAMO/ns2:NOMBRE)
								then <RecipientName>{fn:data($BENEFICIARIOS_RECLAMO/ns2:NOMBRE)}</RecipientName>
								else ()
							}
							{
								if ($BENEFICIARIOS_RECLAMO/ns2:TIPO_BENEFICIARIO)
								then <AnnuityType>{fn:data($BENEFICIARIOS_RECLAMO/ns2:TIPO_BENEFICIARIO)}</AnnuityType>
								else ()
							}
							{
								if ($BENEFICIARIOS_RECLAMO/ns2:ESTADO_BENEFICIARIO)
								then <RecipientState>{fn:data($BENEFICIARIOS_RECLAMO/ns2:ESTADO_BENEFICIARIO)}</RecipientState>
								else ()
							}
							{
								if ($BENEFICIARIOS_RECLAMO/ns2:MONTO_BENEFICIARIO)
								then <AnnualAmnt>{fn:data($BENEFICIARIOS_RECLAMO/ns2:MONTO_BENEFICIARIO)}</AnnualAmnt>
								else ()
							}
							{
								if ($BENEFICIARIOS_RECLAMO/ns2:MONTO_SOLICITUD_BENEFICIARIO)
								then <AnnuityClaimAmount>{fn:data($BENEFICIARIOS_RECLAMO/ns2:MONTO_SOLICITUD_BENEFICIARIO)}</AnnuityClaimAmount>
								else ()
							}
							{
								if ($BENEFICIARIOS_RECLAMO/ns2:PLAZO_PAGO)
								then <InstallmentAmnt>{fn:data($BENEFICIARIOS_RECLAMO/ns2:PLAZO_PAGO)}</InstallmentAmnt>
								else ()
							}
							{
								if ($BENEFICIARIOS_RECLAMO/ns2:MONEDA)
								then <Currency>{fn:data($BENEFICIARIOS_RECLAMO/ns2:MONEDA)}</Currency>
								else ()
							}
							{
								if ($BENEFICIARIOS_RECLAMO/ns2:FECHA_INICIO_BENEFICIARIO)
								then <AnnuityStartDate>{fn:data($BENEFICIARIOS_RECLAMO/ns2:FECHA_INICIO_BENEFICIARIO)}</AnnuityStartDate>
								else ()
							}
							{
								if ($BENEFICIARIOS_RECLAMO/ns2:DURACION_BENEFICIARIO)
								then <AnnuityDuration>{fn:data($BENEFICIARIOS_RECLAMO/ns2:DURACION_BENEFICIARIO)}</AnnuityDuration>
								else ()
							}
							{
								if ($BENEFICIARIOS_RECLAMO/ns2:EDAD_BENEFICIARIO)
								then <Age>{fn:data($BENEFICIARIOS_RECLAMO/ns2:EDAD_BENEFICIARIO)}</Age>
								else ()
							}
							{
								if ($BENEFICIARIOS_RECLAMO/ns2:SEXO_BENEFICIARIO)
								then <Gender>{fn:data($BENEFICIARIOS_RECLAMO/ns2:SEXO_BENEFICIARIO)}</Gender>
								else ()
							}
							{
								if ($BENEFICIARIOS_RECLAMO/ns2:FECHA_MUERTE_BENEFICIARIO)
								then <DeathDate>{fn:data($BENEFICIARIOS_RECLAMO/ns2:FECHA_MUERTE_BENEFICIARIO)}</DeathDate>
								else ()
							}
							{
								if ($BENEFICIARIOS_RECLAMO/ns2:TIEMPO_GARANTIA_BENEFICIARIO)
								then <GuarantyPeriod>{fn:data($BENEFICIARIOS_RECLAMO/ns2:TIEMPO_GARANTIA_BENEFICIARIO)}</GuarantyPeriod>
								else ()
							}
							{
								if ($BENEFICIARIOS_RECLAMO/ns2:DIA_PAGO_BENEFICIARIO)
								then <PaymentDay>{fn:data($BENEFICIARIOS_RECLAMO/ns2:DIA_PAGO_BENEFICIARIO)}</PaymentDay>
								else ()
							}
							{
								if ($BENEFICIARIOS_RECLAMO/ns2:MODO_PAGO_BENEFICIARIO)
								then <PaymentMode>{fn:data($BENEFICIARIOS_RECLAMO/ns2:MODO_PAGO_BENEFICIARIO)}</PaymentMode>
								else ()
							}
							{
								if ($BENEFICIARIOS_RECLAMO/ns2:FECHA_INICIO)
								then <ValidFrom>{fn:data($BENEFICIARIOS_RECLAMO/ns2:FECHA_INICIO)}</ValidFrom>
								else ()
							}
							{
								if ($BENEFICIARIOS_RECLAMO/ns2:HORA_INICIO)
								then <ValidFromTime>{fn:data($BENEFICIARIOS_RECLAMO/ns2:HORA_INICIO)}</ValidFromTime>
								else ()
							}
							{
								if ($BENEFICIARIOS_RECLAMO/ns2:FECHA_FIN)
								then <ValidTo>{fn:data($BENEFICIARIOS_RECLAMO/ns2:FECHA_FIN)}</ValidTo>
								else ()
							}
							{
								if ($BENEFICIARIOS_RECLAMO/ns2:HORA_FIN)
								then <ValidToTime>{fn:data($BENEFICIARIOS_RECLAMO/ns2:HORA_FIN)}</ValidToTime>
								else ()
							}						
						</AnnuityRecipient>
					}
                </AnnuityRecipients>
            </Request>
        }
		</Requests>
    </FNOLRq>
};

local:func($RqCrearReclamo)