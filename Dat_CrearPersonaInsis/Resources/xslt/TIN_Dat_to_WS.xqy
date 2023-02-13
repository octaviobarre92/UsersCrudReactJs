xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://pa.sura.insis.com/crearpersona";
(:: import schema at "../NXSD/Persona_Insis_RQ.xsd" ::)
declare namespace ns2="http://www.fadata.bg/Insurance_Messages/v3.0/xml/";
(:: import schema at "../../../ComponentesComunesInsis/WSDL/insisPDM.wsdl" ::)


declare variable $RqPersona as element() (:: schema-element(ns1:DatosBasicos) ::) external;

declare function local:func($RqPersona as element() (:: schema-element(ns1:DatosBasicos) ::)) as element() (:: schema-element(ns2:RegisterNewPersonRq) ::) {
    <RegisterNewPersonRq>
        <Entity>
            {
            if ($RqPersona/ns1:PERSONA/ns1:TIPO_PERSONA='N') then
              <PersonalData>
                <Name>
                    {
                        if ($RqPersona/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:NOMBRE)
                        then <Given>{fn:data($RqPersona/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:NOMBRE)}</Given>
                        else ()
                    }
                    {
                        if ($RqPersona/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:PRIMER_APELLIDO)
                        then <Surname>{fn:data($RqPersona/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:PRIMER_APELLIDO)}</Surname>
                        else ()
                    }
                    {
                        if ($RqPersona/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:SEGUNDO_APELLIDO)
                        then <Family>{fn:data($RqPersona/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:SEGUNDO_APELLIDO)}</Family>
                        else ()
                    }
                </Name>
                <PID>{fn:data($RqPersona/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:IDENTIFICACION)}</PID>
                {
                    if ($RqPersona/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:SEXO)
                    then <Gender>{fn:data($RqPersona/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:SEXO)}</Gender>
                    else ()
                }
                {
                    if ($RqPersona/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:FECHA_DE_NACIMIENTO)
                    then <BirthDate>{fn:data($RqPersona/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:FECHA_DE_NACIMIENTO)}</BirthDate>
                    else ()
                }
                {
                    if ($RqPersona/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:IDIOMA)
                    then <Language>{fn:data($RqPersona/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:IDIOMA)}</Language>
                    else ()
                }
                {
                    if ($RqPersona/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:PAIS_RESIDENCIA)
                    then <HomeCountry>{fn:data($RqPersona/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:PAIS_RESIDENCIA)}</HomeCountry>
                    else ()
                }
            </PersonalData>
                else
                    <CompanyData>
                        {
                            if ($RqPersona/ns1:PERSONA/ns1:PERSONA_JURIDICA/ns1:RAZONSOCIAL)
                            then <Name>{fn:data($RqPersona/ns1:PERSONA/ns1:PERSONA_JURIDICA/ns1:RAZONSOCIAL)}</Name>
                            else ()
                        }
                        <CustomerID>{fn:data($RqPersona/ns1:PERSONA/ns1:PERSONA_JURIDICA/ns1:ID_CLIENTE)}</CustomerID>
                        {
                            if ($RqPersona/ns1:PERSONA/ns1:PERSONA_JURIDICA/ns1:PERIODO_FISCAL)
                            then <FiscalPeriod>{fn:data($RqPersona/ns1:PERSONA/ns1:PERSONA_JURIDICA/ns1:PERIODO_FISCAL)}</FiscalPeriod>
                            else ()
                        }
                        {
                            if ($RqPersona/ns1:PERSONA/ns1:PERSONA_JURIDICA/ns1:TIPO_PERSONA_JURIDICA)
                            then <CompType>{fn:data($RqPersona/ns1:PERSONA/ns1:PERSONA_JURIDICA/ns1:TIPO_PERSONA_JURIDICA)}</CompType>
                            else ()
                        }
                    </CompanyData>
            }
            {
                if ($RqPersona/ns1:PERSONA/ns1:NACIONALIDAD)
                then <Nationality>{fn:data($RqPersona/ns1:PERSONA/ns1:NACIONALIDAD)}</Nationality>
                else ()
            }
            {
                if ($RqPersona/ns1:PERSONA/ns1:INDUSTRIA)
                then <IndustryCode>{fn:data($RqPersona/ns1:PERSONA/ns1:INDUSTRIA)}</IndustryCode>
                else ()
            }
            {
                if ($RqPersona/ns1:PERSONA/ns1:FECHA_REGISTRO)
                then <RegistrationDate>{fn:data($RqPersona/ns1:PERSONA/ns1:FECHA_REGISTRO)}</RegistrationDate>
                else ()
            }
            {
                if ($RqPersona/ns1:PERSONA/ns1:OBSERVACION)
                then <Notes>{fn:data($RqPersona/ns1:PERSONA/ns1:OBSERVACION)}</Notes>
                else ()
            }
            <Questionary>
                {
                    for $PREGUNTAS in $RqPersona/ns1:PERSONA/ns1:PREGUNTAS
                    return 
                    <Question>
                        <ID>{fn:data($PREGUNTAS/ns1:CODIGO)}</ID>
                        {
                            if ($PREGUNTAS/ns1:RESPUESTA)
                            then <Answer>{fn:data($PREGUNTAS/ns1:RESPUESTA)}</Answer>
                            else ()
                        }
                        {
                            if ($PREGUNTAS/ns1:IDENTIFICADOR)
                            then <AnnexID>{fn:data($PREGUNTAS/ns1:IDENTIFICADOR)}</AnnexID>
                            else ()
                        }</Question>
                }
            </Questionary>
            <CustomProperties>
                {
                        if ($RqPersona/ns1:PERSONA/ns1:DIGITO_VERIFICADOR)
                        then 
                            <CustomProperty>
                            <FieldName>ATTR1</FieldName>
                            <FieldLabel></FieldLabel>
                            <Value>{fn:data($RqPersona/ns1:PERSONA/ns1:DIGITO_VERIFICADOR)}</Value>
                            </CustomProperty>
                        else ()
                }   
				{
                        if ($RqPersona/ns1:PERSONA/ns1:TIPO_IDENTIFICACION)
                        then 
                            <CustomProperty>
                            <FieldName>ATTR2</FieldName>
                            <FieldLabel></FieldLabel>
                            <Value>{fn:data($RqPersona/ns1:PERSONA/ns1:TIPO_IDENTIFICACION)}</Value>
                            </CustomProperty>
                        else ()
                }   
				{
                        if ($RqPersona/ns1:PERSONA/ns1:FECHA_VENCIMIENTO_ID)
                        then 
                            <CustomProperty>
                            <FieldName>ATTR3</FieldName>
                            <FieldLabel></FieldLabel>
                            <Value>{fn:data($RqPersona/ns1:PERSONA/ns1:TIPO_PERSONA)}</Value>
                            </CustomProperty>
                        else ()
                }
				{
                        if ($RqPersona/ns1:PERSONA/ns1:FECHA_VENCIMIENTO_ID)
                        then 
                            <CustomProperty>
                            <FieldName>ATTR4</FieldName>
                            <FieldLabel></FieldLabel>
                            <Value>{fn:data($RqPersona/ns1:PERSONA/ns1:FECHA_VENCIMIENTO_ID)}</Value>
                            </CustomProperty>
                        else ()
                }
   				{
                        if ($RqPersona/ns1:PERSONA/ns1:FECHA_OPERACION)
                        then 
                            <CustomProperty>
                            <FieldName>ATTR5</FieldName>
                            <FieldLabel></FieldLabel>
                            <Value>{fn:data($RqPersona/ns1:PERSONA/ns1:FECHA_OPERACION)}</Value>
                            </CustomProperty>
                        else ()
                }
            </CustomProperties>
        </Entity>
        <Addresses>
            {
                for $DIRECCIONES in $RqPersona/ns1:DIRECCIONES
                return 
                <Address>
                    {
                        if ($DIRECCIONES/ns1:NOMBRE_PAIS)
                        then <Country>{fn:data($DIRECCIONES/ns1:NOMBRE_PAIS)}</Country>
                        else ()
                    }
                    {
                        if ($DIRECCIONES/ns1:CODIGO_PAIS)
                        then <CountryCode>{fn:data($DIRECCIONES/ns1:CODIGO_PAIS)}</CountryCode>
                        else ()
                    }
                    {
                        if ($DIRECCIONES/ns1:NOMBRE_ESTADO)
                        then <State>{fn:data($DIRECCIONES/ns1:NOMBRE_ESTADO)}</State>
                        else ()
                    }
                    {
                        if ($DIRECCIONES/ns1:CODIGO_ESTADO)
                        then <CountryState>{fn:data($DIRECCIONES/ns1:CODIGO_ESTADO)}</CountryState>
                        else ()
                    }
                    {
                        if ($DIRECCIONES/ns1:NOMBRE_REGION)
                        then <Region>{fn:data($DIRECCIONES/ns1:NOMBRE_REGION)}</Region>
                        else ()
                    }
                    {
                        if ($DIRECCIONES/ns1:CODIGO_REGION)
                        then <StateRegion>{fn:data($DIRECCIONES/ns1:CODIGO_REGION)}</StateRegion>
                        else ()
                    }
                    {
                        if ($DIRECCIONES/ns1:NOMBRE_CIUDAD)
                        then <City>{fn:data($DIRECCIONES/ns1:NOMBRE_CIUDAD)}</City>
                        else ()
                    }
                    {
                        if ($DIRECCIONES/ns1:CODIGO_CIUDAD)
                        then <CityCode>{fn:data($DIRECCIONES/ns1:CODIGO_CIUDAD)}</CityCode>
                        else ()
                    }
                    <ResidentialAddress>
                        {
                            if ($DIRECCIONES/ns1:BARRIO)
                            then <QuarterName>{fn:data($DIRECCIONES/ns1:BARRIO)}</QuarterName>
                            else ()
                        }
                        <QuarterID></QuarterID>
                        {
                            if ($DIRECCIONES/ns1:CALLE_AVENIDA)
                            then <StreetName>{fn:data($DIRECCIONES/ns1:CALLE_AVENIDA)}</StreetName>
                            else ()
                        }
                        <StreetID></StreetID>
                        {
                            if ($DIRECCIONES/ns1:CALLE_AVENIDA_NRO)
                            then <StreetNo>{fn:data($DIRECCIONES/ns1:CALLE_AVENIDA_NRO)}</StreetNo>
                            else ()
                        }
                        {
                            if ($DIRECCIONES/ns1:EDIFICIO)
                            then <BlockNo>{fn:data($DIRECCIONES/ns1:EDIFICIO)}</BlockNo>
                            else ()
                        }
                        {
                            if ($DIRECCIONES/ns1:ENTRADA)
                            then <Entrance>{fn:data($DIRECCIONES/ns1:ENTRADA)}</Entrance>
                            else ()
                        }
                        {
                            if ($DIRECCIONES/ns1:PISO)
                            then <Floor>{fn:data($DIRECCIONES/ns1:PISO)}</Floor>
                            else ()
                        }
                        {
                            if ($DIRECCIONES/ns1:APTO_CASA)
                            then <Apartment>{fn:data($DIRECCIONES/ns1:APTO_CASA)}</Apartment>
                            else ()
                        }
                    </ResidentialAddress>
                    <AddressType>{fn:data($DIRECCIONES/ns1:TIPO_DIRECCION)}</AddressType>
                    {
                        if ($DIRECCIONES/ns1:DIRECCION)
                        then <Address>{fn:data($DIRECCIONES/ns1:DIRECCION)}</Address>
                        else ()
                    }
                    {
                        if ($DIRECCIONES/ns1:ES_CORRESPONDENCIA)
                        then <MailYN>{fn:data($DIRECCIONES/ns1:ES_CORRESPONDENCIA)}</MailYN>
                        else ()
                    }
                    {
                        if ($DIRECCIONES/ns1:ES_FACTURACION)
                        then <InvoiceYN>{fn:data($DIRECCIONES/ns1:ES_FACTURACION)}</InvoiceYN>
                        else ()
                    }
                    {
                        if ($DIRECCIONES/ns1:OBSERVACION)
                        then <Notes>{fn:data($DIRECCIONES/ns1:OBSERVACION)}</Notes>
                        else ()
                    }
                    {
                        if ($DIRECCIONES/ns1:ES_PRINCIPAL)
                        then <PrimaryFlag>{fn:data($DIRECCIONES/ns1:ES_PRINCIPAL)}</PrimaryFlag>
                        else ()
                    }
                    {
                        if ($DIRECCIONES/ns1:TELEFONO)
                        then <Phone>{fn:data($DIRECCIONES/ns1:TELEFONO)}</Phone>
                        else ()
                    }
                    {
                        if ($DIRECCIONES/ns1:FAX)
                        then <Fax>{fn:data($DIRECCIONES/ns1:FAX)}</Fax>
                        else ()
                    }
                    {
                        if ($DIRECCIONES/ns1:EMAIL)
                        then <Email>{fn:data($DIRECCIONES/ns1:EMAIL)}</Email>
                        else ()
                    }</Address>
            }
        </Addresses>
        <Contacts>
            {
                for $CONTACTOS in $RqPersona/ns1:CONTACTOS
                return 
                <Contact>
                    <Type>{fn:data($CONTACTOS/ns1:TIPO)}</Type>
                    {
                        if ($CONTACTOS/ns1:VALOR)
                        then <Details>{fn:data($CONTACTOS/ns1:VALOR)}</Details>
                        else ()
                    }
                    {
                        if ($CONTACTOS/ns1:OBSERVACION)
                        then <ContactNote>{fn:data($CONTACTOS/ns1:OBSERVACION)}</ContactNote>
                        else ()
                    }
                    {
                        if ($CONTACTOS/ns1:ES_PRINCIPAL)
                        then <PrimaryFlag>{fn:data($CONTACTOS/ns1:ES_PRINCIPAL)}</PrimaryFlag>
                        else ()
                    }
                    {
                        if ($CONTACTOS/ns1:IDIOMA)
                        then <Language>{fn:data($CONTACTOS/ns1:IDIOMA)}</Language>
                        else ()
                    }</Contact>
            }
        </Contacts>
        <BankAccounts>
            {
                for $DATOS_BANCARIOS in $RqPersona/ns1:DATOS_BANCARIOS
                return 
                <BankAccount>
                    {
                        if ($DATOS_BANCARIOS/ns1:IDENTIFICADOR_CUENTA)
                        then <BankAccID>{fn:data($DATOS_BANCARIOS/ns1:IDENTIFICADOR_CUENTA)}</BankAccID>
                        else ()
                    }
                    {
                        if ($DATOS_BANCARIOS/ns1:BANCO_NOMBRE)
                        then <BankName>{fn:data($DATOS_BANCARIOS/ns1:BANCO_NOMBRE)}</BankName>
                        else ()
                    }
                    <BankPID>{fn:data($DATOS_BANCARIOS/ns1:IDENTIFICADOR_BANCO)}</BankPID>
                    <AccountNo>{fn:data($DATOS_BANCARIOS/ns1:NUMERO_CUENTA)}</AccountNo>
                    {
                        if ($DATOS_BANCARIOS/ns1:MONEDA)
                        then <Currency>{fn:data($DATOS_BANCARIOS/ns1:MONEDA)}</Currency>
                        else ()
                    }
                    {
                        if ($DATOS_BANCARIOS/ns1:ESTADO)
                        then <AccountState>{fn:data($DATOS_BANCARIOS/ns1:ESTADO)}</AccountState>
                        else ()
                    }
                    {
                        if ($DATOS_BANCARIOS/ns1:ES_PRINCIPAL)
                        then <PrimaryFlag>{fn:data($DATOS_BANCARIOS/ns1:ES_PRINCIPAL)}</PrimaryFlag>
                        else ()
                    }</BankAccount>
            }
        </BankAccounts>
    </RegisterNewPersonRq>
};

local:func($RqPersona)

