xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://pa.sura.insis.com/crearpoliza";
(:: import schema at "../NXSD/Poliza_Insis_RQ.xsd" ::)
declare namespace ns2="http://www.fadata.bg/Insurance_Messages/v3.0/xml/";
(:: import schema at "../../../ComponentesComunesInsis/WSDL/insisPAM.wsdl" ::)

declare variable $crearPoliza as element() (:: schema-element(ns1:RegistrarPoliza) ::) external;

declare function local:func($crearPoliza as element() (:: schema-element(ns1:RegistrarPoliza) ::)) as element() (:: schema-element(ns2:RegisterApplicationRq) ::) {
    <RegisterApplicationRq>
        <Client>
            <Entity>
                {
                    if ($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:TIPO_PERSONA='N') then
                        <PersonalData>
                            <Name>
                                {
                                    if ($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:NOMBRE)
                                    then <Given>{fn:data($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:NOMBRE)}</Given>
                                    else ()
                                }
                                {
                                    if ($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:PRIMER_APELLIDO)
                                    then <Surname>{fn:data($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:PRIMER_APELLIDO)}</Surname>
                                    else ()
                                }
                                {
                                    if ($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:SEGUNDO_APELLIDO)
                                    then <Family>{fn:data($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:SEGUNDO_APELLIDO)}</Family>
                                    else ()
                                }
                            </Name>
                            <PID>{fn:data($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:IDENTIFICACION)}</PID>
                            {
                                if ($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:SEXO)
                                then <Gender>{fn:data($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:SEXO)}</Gender>
                                else ()
                            }
                            {
                                if ($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:FECHA_DE_NACIMIENTO)
                                then <BirthDate>{fn:data($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:FECHA_DE_NACIMIENTO)}</BirthDate>
                                else ()
                            }
							{
                                if ($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:IDIOMA)
                                then <Language>{fn:data($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:IDIOMA)}</Language>
                                else ()
                            }
							{
                                if ($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:PAIS_RESIDENCIA)
                                then <HomeCountry>{fn:data($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:PAIS_RESIDENCIA)}</HomeCountry>
                                else ()
                            }
                        </PersonalData>
                    else
                        <CompanyData>
                            <Name>{fn:data($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:PERSONA_JURIDICA/ns1:RAZONSOCIAL)}</Name>
                            <CustomerID>{fn:data($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:PERSONA_JURIDICA/ns1:ID_CLIENTE)}</CustomerID>
                            {
                                if ($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:PERSONA_JURIDICA/ns1:PERIODO_FISCAL)
                                then <FiscalPeriod>{fn:data($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:PERSONA_JURIDICA/ns1:PERIODO_FISCAL)}</FiscalPeriod>
                                else ()
                            }
                            {
                                if ($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:PERSONA_JURIDICA/ns1:TIPO_PERSONA_JURIDICA)
                                then <CompType>{fn:data($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:PERSONA_JURIDICA/ns1:TIPO_PERSONA_JURIDICA)}</CompType>
                                else ()
                            }
                        </CompanyData>
                }
                {
                    if ($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:NACIONALIDAD)
                    then <Nationality>{fn:data($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:NACIONALIDAD)}</Nationality>
                    else ()
                }
                {
                    if ($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:INDUSTRIA)
                    then <IndustryCode>{fn:data($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:INDUSTRIA)}</IndustryCode>
                    else ()
                }
                {
                    if ($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:SUBINDUSTRIA)
                    then <SubIndustryCode>{fn:data($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:SUBINDUSTRIA)}</SubIndustryCode>
                    else ()
                }
                {
                    if ($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:FECHA_REGISTRO)
                    then <RegistrationDate>{fn:data($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:FECHA_REGISTRO)}</RegistrationDate>
                    else ()
                }
                {
                    if ($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:OBSERVACION)
                    then <Notes>{fn:data($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:OBSERVACION)}</Notes>
                    else ()
                }
				{
                    if ($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:PREGUNTAS) then
					<Questionary>
						{
							for $PREGUNTAS in $crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:PREGUNTAS
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
					else ()
				}	
				{
                    if ($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:DOCUMENTOS) then
					<Documents>
						{
							for $DOCUMENTOS in $crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:DOCUMENTOS
							return 
							<Document>
								<DocumentID>{fn:data($DOCUMENTOS/ns1:CODIGO_DOCUMENTO)}</DocumentID>
								{
									if ($DOCUMENTOS/ns1:NOMBRE_DOCUMENTO)
									then <DocumentName>{fn:data($DOCUMENTOS/ns1:NOMBRE_DOCUMENTO)}</DocumentName>
									else ()
								}
								{
									if ($DOCUMENTOS/ns1:FECHA)
									then <DocumentDate>{fn:data($DOCUMENTOS/ns1:FECHA)}</DocumentDate>
									else ()
								}
								 {
									if ($DOCUMENTOS/ns1:DESCRIPCION)
									then <Description>{fn:data($DOCUMENTOS/ns1:DESCRIPCION)}</Description>
									else ()
								}
								 {
									if ($DOCUMENTOS/ns1:FECHA_RECEPCION)
									then <ReceiveDate>{fn:data($DOCUMENTOS/ns1:FECHA_RECEPCION)}</ReceiveDate>
									else ()
								}
								 {
									if ($DOCUMENTOS/ns1:ESTATUS)
									then <DocState>{fn:data($DOCUMENTOS/ns1:ESTATUS)}</DocState>
									else ()
								}
								 {
									if ($DOCUMENTOS/ns1:OBSERVACIONES)
									then <Notes>{fn:data($DOCUMENTOS/ns1:OBSERVACIONES)}</Notes>
									else ()
								}
							</Document>
						}
					</Documents>  
					else ()
				}
				{
                    if ($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:RELACION_PERSONAL) then
					<PersonRelations>
						{
							for $RELACIONES in $crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:RELACION_PERSONAL
							return 
							<PersonRelation>
								<PID>{fn:data($RELACIONES/ns1:IDENTIFICACION)}</PID>
								{
									if ($RELACIONES/ns1:TIPO_PERSONA)
									then <EntityType>{fn:data($RELACIONES/ns1:TIPO_PERSONA)}</EntityType>
									else ()
								}
								{
									if ($RELACIONES/ns1:CODIGO_RELACION)
									then <RelID>{fn:data($RELACIONES/ns1:CODIGO_RELACION)}</RelID>
									else ()
								}
								 {
									if ($RELACIONES/ns1:NOMBRE_RELACION)
									then <RelName>{fn:data($RELACIONES/ns1:NOMBRE_RELACION)}</RelName>
									else ()
								}							 
							</PersonRelation>
						}
					</PersonRelations>
					else ()
				}
            </Entity>
			{
                 if ($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:DIRECCIONES) then
				<Addresses>
					{
						for $DIRECCIONES in $crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:DIRECCIONES
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
								{
									if ($DIRECCIONES/ns1:CALLE_AVENIDA)
									then <StreetName>{fn:data($DIRECCIONES/ns1:CALLE_AVENIDA)}</StreetName>
									else ()
								}
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
				else ()
			}
			{
                 if ($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:CONTACTOS) then
				<Contacts>
					{
						for $CONTACTO in $crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:CONTACTOS
						return 
						<Contact>
							{
								if ($CONTACTO/ns1:TIPO)
								then <Type>{fn:data($CONTACTO/ns1:TIPO)}</Type>
								else ()
							}
							{
								if ($CONTACTO/ns1:VALOR)
								then <Details>{fn:data($CONTACTO/ns1:VALOR)}</Details>
								else ()
							}
							{
								if ($CONTACTO/ns1:OBSERVACION)
								then <ContactNote>{fn:data($CONTACTO/ns1:OBSERVACION)}</ContactNote>
								else ()
							}
							{
								if ($CONTACTO/ns1:ES_PRINCIPAL)
								then <PrimaryFlag>{fn:data($CONTACTO/ns1:ES_PRINCIPAL)}</PrimaryFlag>
								else ()
							}
							{
								if ($CONTACTO/ns1:IDIOMA)
								then <Language>{fn:data($CONTACTO/ns1:IDIOMA)}</Language>
								else ()
							}
							</Contact>
					}
				</Contacts>  
				else ()
			}
        </Client>
        <Insureds>
             {
			 for $POLIZAS in $crearPoliza/ns1:POLIZAS
             return 
				<Insured>
					<InsuredEntity>						
						{
							if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:TIPO_OBJETO)
							then <ObjectType>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:TIPO_OBJETO)}</ObjectType>
							else ()
						}
						{	
						if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE) then 
							<OAccidentInsured>
								<Entity>
								{
								if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:PERSONA/ns1:TIPO_PERSONA='N') then
									<PersonalData>
										<Name>
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:NOMBRE)
												then <Given>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:NOMBRE)}</Given>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:PRIMER_APELLIDO)
												then <Surname>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:PRIMER_APELLIDO)}</Surname>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:SEGUNDO_APELLIDO)
												then <Family>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:SEGUNDO_APELLIDO)}</Family>
												else ()
											}
										</Name>
										<PID>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:IDENTIFICACION)}</PID>
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:SEXO)
											then <Gender>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:SEXO)}</Gender>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:FECHA_DE_NACIMIENTO)
											then <BirthDate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:FECHA_DE_NACIMIENTO)}</BirthDate>
											else ()
										}
									</PersonalData>
								else
									<CompanyData>
										<Name>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:PERSONA/ns1:PERSONA_JURIDICA/ns1:RAZONSOCIAL)}</Name>
										<CustomerID>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:PERSONA/ns1:PERSONA_JURIDICA/ns1:ID_CLIENTE)}</CustomerID>
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:PERSONA/ns1:PERSONA_JURIDICA/ns1:PERIODO_FISCAL)
											then <FiscalPeriod>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:PERSONA/ns1:PERSONA_JURIDICA/ns1:PERIODO_FISCAL)}</FiscalPeriod>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:PERSONA/ns1:PERSONA_JURIDICA/ns1:TIPO_PERSONA_JURIDICA)
											then <CompType>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:PERSONA/ns1:PERSONA_JURIDICA/ns1:TIPO_PERSONA_JURIDICA)}</CompType>
											else ()
										}
									</CompanyData>
								}
								{
									if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:PERSONA/ns1:NACIONALIDAD)
									then <Nationality>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:PERSONA/ns1:NACIONALIDAD)}</Nationality>
									else ()
								}
								{
									if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:PERSONA/ns1:INDUSTRIA)
									then <IndustryCode>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:PERSONA/ns1:INDUSTRIA)}</IndustryCode>
									else ()
								}
								{
									if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:PERSONA/ns1:SUBINDUSTRIA)
									then <SubIndustryCode>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:PERSONA/ns1:SUBINDUSTRIA)}</SubIndustryCode>
									else ()
								}
								{
									if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:PERSONA/ns1:FECHA_REGISTRO)
									then <RegistrationDate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:PERSONA/ns1:FECHA_REGISTRO)}</RegistrationDate>
									else ()
								}
								{
									if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:PERSONA/ns1:OBSERVACION)
									then <Notes>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:PERSONA/ns1:OBSERVACION)}</Notes>
									else ()
								}
								<Questionary>
									{
										for $PREGUNTAS in $POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:PERSONA/ns1:PREGUNTAS
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
								</Entity>
								{
									if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:EDAD)
									then <Age>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:EDAD)}</Age>
									else ()
								}							
								{
									if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:TIPO_ACCIDENTE)
									then <AccinsType>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:TIPO_ACCIDENTE)}</AccinsType>
									else ()
								}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:SUBTIPO_ACCIDENTE)
										then <AccinsSubtype>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:SUBTIPO_ACCIDENTE)}</AccinsSubtype>
										else ()
									}
									<CustomProperties>
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:ESTATUS_EVALUACION_MEDICA)
										then 
											<CustomProperty>
												<FieldName>'OAIP1'</FieldName>
												<Value>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:ESTATUS_EVALUACION_MEDICA)}</Value>
											</CustomProperty>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:DETALLE_EVALUACION_MEDICA)
										then 
											<CustomProperty>
												<FieldName>'OAIP2'</FieldName>
												<Value>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:DETALLE_EVALUACION_MEDICA)}</Value>
											</CustomProperty>
										else ()
									}
									</CustomProperties>
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:SEXO)
										then <Gender>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:SEXO)}</Gender>
										else ()
									}
									<DependentOn>
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:IDENTIFICACION_REPRESENTANTE)
										then <PID>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:IDENTIFICACION_REPRESENTANTE)}</PID>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:RELACION_FAMILIAR)
										then <EntityType>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ACCIDENTE/ns1:RELACION_FAMILIAR)}</EntityType>
										else ()
									}
									</DependentOn>											
							</OAccidentInsured>
						else ()
						}
						{
						if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EQUIPO) then 
							<OAdditionalEquipment>
								{
									if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EQUIPO/ns1:IDENTIFICADOR_EQUIPO)
									then <ParentObjectID>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EQUIPO/ns1:IDENTIFICADOR_EQUIPO)}</ParentObjectID>
									else ()
								}
								{
									if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EQUIPO/ns1:TIPO_EQUIPO)
									then <EquipmentType>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EQUIPO/ns1:TIPO_EQUIPO)}</EquipmentType>
									else ()
								}
								{
									if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EQUIPO/ns1:SUBTIPO_EQUIPO)
									then <EquipmentSubtype>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EQUIPO/ns1:SUBTIPO_EQUIPO)}</EquipmentSubtype>
									else ()
								}
								{
									if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EQUIPO/ns1:MODELO)
									then <Model>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EQUIPO/ns1:MODELO)}</Model>
									else ()
								}
								{
									if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EQUIPO/ns1:SERIAL)
									then <SerialNo>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EQUIPO/ns1:SERIAL)}</SerialNo>
									else ()
								}
								{
									if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EQUIPO/ns1:VALOR_EQUIPO)
									then <AvValue>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EQUIPO/ns1:VALOR_EQUIPO)}</AvValue>
									else ()
								}
								{
									if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EQUIPO/ns1:MONEDA)
									then <Currency>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EQUIPO/ns1:MONEDA)}</Currency>
									else ()
								}
								<Creditors>
									{
									if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EQUIPO/ns1:CREDITO) then 
									<ObjectCredited>
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EQUIPO/ns1:CREDITO/ns1:IDENTIFICADOR_CREDITO)
											then <CreditorID>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EQUIPO/ns1:CREDITO/ns1:IDENTIFICADOR_CREDITO)}</CreditorID>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EQUIPO/ns1:CREDITO/ns1:MONTO)
											then <Amount>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EQUIPO/ns1:CREDITO/ns1:MONTO)}</Amount>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EQUIPO/ns1:CREDITO/ns1:FECHA)
											then <LendDate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EQUIPO/ns1:CREDITO/ns1:FECHA)}</LendDate>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EQUIPO/ns1:CREDITO/ns1:FECHA_FINALIZACION)
											then <ExpireDate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EQUIPO/ns1:CREDITO/ns1:FECHA_FINALIZACION)}</ExpireDate>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EQUIPO/ns1:CREDITO/ns1:TASA_INTERES)
											then <InterestRate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EQUIPO/ns1:CREDITO/ns1:TASA_INTERES)}</InterestRate>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EQUIPO/ns1:CREDITO/ns1:NUMERO_PAGOS)
											then <NumOfInstallments>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EQUIPO/ns1:CREDITO/ns1:NUMERO_PAGOS)}</NumOfInstallments>
											else ()
										}											
									</ObjectCredited>
									else ()
									}
								</Creditors>
							</OAdditionalEquipment>
							else ()
						}
						{
							if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CULTIVO) then 
							<OAgriculture>
								{
									if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CULTIVO/ns1:TIPO_CULTIVO)
									then <CultureType>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CULTIVO/ns1:TIPO_CULTIVO)}</CultureType>
									else ()
								}
								{
									if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CULTIVO/ns1:SUBTIPO_CULTIVO)
									then <CultureSubtype>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CULTIVO/ns1:SUBTIPO_CULTIVO)}</CultureSubtype>
									else ()
								}
								{
									if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CULTIVO/ns1:AREA)
									then <Area>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CULTIVO/ns1:AREA)}</Area>
									else ()
								}
								{
									if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CULTIVO/ns1:REGION)
									then <RegionID>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CULTIVO/ns1:REGION)}</RegionID>
									else ()
								}
								{
									if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CULTIVO/ns1:RIESGO)
									then <RiskLocationID>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CULTIVO/ns1:RIESGO)}</RiskLocationID>
									else ()
								}										
								<Creditors>
									{
									if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CULTIVO/ns1:CREDITO) then 
									<ObjectCredited>
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CULTIVO/ns1:CREDITO/ns1:IDENTIFICADOR_CREDITO)
											then <CreditorID>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CULTIVO/ns1:CREDITO/ns1:IDENTIFICADOR_CREDITO)}</CreditorID>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CULTIVO/ns1:CREDITO/ns1:MONTO)
											then <Amount>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CULTIVO/ns1:CREDITO/ns1:MONTO)}</Amount>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CULTIVO/ns1:CREDITO/ns1:FECHA)
											then <LendDate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CULTIVO/ns1:CREDITO/ns1:FECHA)}</LendDate>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CULTIVO/ns1:CREDITO/ns1:FECHA_FINALIZACION)
											then <ExpireDate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CULTIVO/ns1:CREDITO/ns1:FECHA_FINALIZACION)}</ExpireDate>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CULTIVO/ns1:CREDITO/ns1:TASA_INTERES)
											then <InterestRate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CULTIVO/ns1:CREDITO/ns1:TASA_INTERES)}</InterestRate>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CULTIVO/ns1:CREDITO/ns1:NUMERO_PAGOS)
											then <NumOfInstallments>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CULTIVO/ns1:CREDITO/ns1:NUMERO_PAGOS)}</NumOfInstallments>
											else ()
										}											
									</ObjectCredited>
									else ()
									}
								</Creditors>
							</OAgriculture>
							else()
						}
						{
						if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ANIMALES) then 
							<OAnimal>
								{
									if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ANIMALES/ns1:TIPO_ANIMALES)
									then <AnimalType>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ANIMALES/ns1:TIPO_ANIMALES)}</AnimalType>
									else ()
								}
								{
									if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ANIMALES/ns1:SUBTIPO_ANIMALES)
									then <AnimalSubtype>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ANIMALES/ns1:SUBTIPO_ANIMALES)}</AnimalSubtype>
									else ()
								}
								{
									if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ANIMALES/ns1:RAZA)
									then <Breed>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ANIMALES/ns1:RAZA)}</Breed>
									else ()
								}
								{
									if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ANIMALES/ns1:NOMBRE)
									then <Name>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ANIMALES/ns1:NOMBRE)}</Name>
									else ()
								}
								{
									if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ANIMALES/ns1:CARACTERISTICAS)
									then <Distinction>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ANIMALES/ns1:CARACTERISTICAS)}</Distinction>
									else ()
								}
								<Creditors>
									{
									if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ANIMALES/ns1:CREDITO) then 
									<ObjectCredited>
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ANIMALES/ns1:CREDITO/ns1:IDENTIFICADOR_CREDITO)
											then <CreditorID>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ANIMALES/ns1:CREDITO/ns1:IDENTIFICADOR_CREDITO)}</CreditorID>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ANIMALES/ns1:CREDITO/ns1:MONTO)
											then <Amount>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ANIMALES/ns1:CREDITO/ns1:MONTO)}</Amount>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ANIMALES/ns1:CREDITO/ns1:FECHA)
											then <LendDate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ANIMALES/ns1:CREDITO/ns1:FECHA)}</LendDate>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ANIMALES/ns1:CREDITO/ns1:FECHA_FINALIZACION)
											then <ExpireDate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ANIMALES/ns1:CREDITO/ns1:FECHA_FINALIZACION)}</ExpireDate>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ANIMALES/ns1:CREDITO/ns1:TASA_INTERES)
											then <InterestRate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ANIMALES/ns1:CREDITO/ns1:TASA_INTERES)}</InterestRate>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ANIMALES/ns1:CREDITO/ns1:NUMERO_PAGOS)
											then <NumOfInstallments>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:ANIMALES/ns1:CREDITO/ns1:NUMERO_PAGOS)}</NumOfInstallments>
											else ()
										}											
									</ObjectCredited>
									else()
																				}
								</Creditors>
							</OAnimal>
							else()
						}
						{
							if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO) then 
								<OCar>
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:NUMERO_PLACA)
										then <RegNo>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:NUMERO_PLACA)}</RegNo>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:TIPO_AUTO)
										then <CarType>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:TIPO_AUTO)}</CarType>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:SUBTIPO_AUTO)
										then <CarSubtype>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:SUBTIPO_AUTO)}</CarSubtype>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:MODELO)
										then <Model>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:MODELO)}</Model>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:MARCA)
										then <Make>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:MARCA)}</Make>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:CHASIS)
										then <Chassis>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:CHASIS)}</Chassis>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:NO_MOTOR)
										then <Engine>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:NO_MOTOR)}</Engine>
										else ()
									}											
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:TONELAJE)
										then <CCMTon>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:TONELAJE)}</CCMTon>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:ACTIVIDAD)
										then <CarUsage>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:ACTIVIDAD)}</CarUsage>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:NUMERO_ASIENTOS)
										then <SeatsNum>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:NUMERO_ASIENTOS)}</SeatsNum>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:NUMERO_PUERTAS)
										then <DoorNum>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:NUMERO_PUERTAS)}</DoorNum>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:TIPO_PINTURA)
										then <PaintType>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:TIPO_PINTURA)}</PaintType>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:ANNIO)
										then <ProdYear>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:ANNIO)}</ProdYear>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:CANTIDAD_ANNIO)
										then <CarAge>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:CANTIDAD_ANNIO)}</CarAge>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:COLOR)
										then <CarColor>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:COLOR)}</CarColor>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:REGISTRO)
										then <RegType>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:REGISTRO)}</RegType>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:CABALLOS_FUERZA)
										then <EnginePower>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:CABALLOS_FUERZA)}</EnginePower>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:TONELAJE_CARGA)
										then <Tonage>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:TONELAJE_CARGA)}</Tonage>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:TIPO_MOTOR)
										then <EngineType>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:TIPO_MOTOR)}</EngineType>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:TIPO_COMBUSTIBLE)
										then <FuelType>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:TIPO_COMBUSTIBLE)}</FuelType>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:TIPO_CONDUCTOR)
										then <DriveType>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:TIPO_CONDUCTOR)}</DriveType>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:TIPO_CARROCERIA)
										then <CarBodyType>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:TIPO_CARROCERIA)}</CarBodyType>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:COLOR_VENTANAS)
										then <WindowColor>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:COLOR_VENTANAS)}</WindowColor>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:DESCRIPCION)
										then <Notes>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:DESCRIPCION)}</Notes>
										else ()
									}
									<SupplementaryEquipment>
										<OAdditionalEquipment>
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:EQUIPO_SUPLEMENTARIO/ns1:IDENTIFICADOR_PADRE)
												then <ParentObjectID>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:EQUIPO_SUPLEMENTARIO/ns1:IDENTIFICADOR_PADRE)}</ParentObjectID>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:TIPO_EQUIPO)
												then <EquipmentType>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:TIPO_EQUIPO)}</EquipmentType>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:SUBTIPO_EQUIPO)
												then <EquipmentSubtype>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:SUBTIPO_EQUIPO)}</EquipmentSubtype>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:MODELO)
												then <Model>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:MODELO)}</Model>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:SERIAL)
												then <SerialNo>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:SERIAL)}</SerialNo>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:VALOR_EQUIPO)
												then <AvValue>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:VALOR_EQUIPO)}</AvValue>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:MONEDA)
												then <Currency>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:MONEDA)}</Currency>
												else ()
											}
											<Creditors>
												{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:CREDITO) then 
												<ObjectCredited>
													{
														if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:CREDITO/ns1:IDENTIFICADOR_CREDITO)
														then <CreditorID>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:CREDITO/ns1:IDENTIFICADOR_CREDITO)}</CreditorID>
														else ()
													}
													{
														if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:CREDITO/ns1:MONTO)
														then <Amount>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:CREDITO/ns1:MONTO)}</Amount>
														else ()
													}
													{
														if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:CREDITO/ns1:FECHA)
														then <LendDate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:CREDITO/ns1:FECHA)}</LendDate>
														else ()
													}
													{
														if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:CREDITO/ns1:FECHA_FINALIZACION)
														then <ExpireDate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:CREDITO/ns1:FECHA_FINALIZACION)}</ExpireDate>
														else ()
													}
													{
														if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:CREDITO/ns1:TASA_INTERES)
														then <InterestRate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:CREDITO/ns1:TASA_INTERES)}</InterestRate>
														else ()
													}
													{
														if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:CREDITO/ns1:NUMERO_PAGOS)
														then <NumOfInstallments>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:CREDITO/ns1:NUMERO_PAGOS)}</NumOfInstallments>
														else ()
													}											
												</ObjectCredited>
												else()
																										}
											</Creditors>
										</OAdditionalEquipment>
									</SupplementaryEquipment>
									<Creditors>
									{
									if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:CREDITO) then 
									<ObjectCredited>
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:CREDITO/ns1:IDENTIFICADOR_CREDITO)
											then <CreditorID>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:CREDITO/ns1:IDENTIFICADOR_CREDITO)}</CreditorID>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:CREDITO/ns1:MONTO)
											then <Amount>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:CREDITO/ns1:MONTO)}</Amount>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:CREDITO/ns1:FECHA)
											then <LendDate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:CREDITO/ns1:FECHA)}</LendDate>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:CREDITO/ns1:FECHA_FINALIZACION)
											then <ExpireDate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:CREDITO/ns1:FECHA_FINALIZACION)}</ExpireDate>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:CREDITO/ns1:TASA_INTERES)
											then <InterestRate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:CREDITO/ns1:TASA_INTERES)}</InterestRate>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:CREDITO/ns1:NUMERO_PAGOS)
											then <NumOfInstallments>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:CREDITO/ns1:NUMERO_PAGOS)}</NumOfInstallments>
											else ()
										}											
									</ObjectCredited>
									else()
																				}
									</Creditors>
								</OCar>
							else()
						}
						{
							if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA) then 
								<OCargo>
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:TIPO_CARGA)
										then <CargoType>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:TIPO_CARGA)}</CargoType>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:SUBTIPO_CARGA)
										then <CargoSubtype>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:SUBTIPO_CARGA)}</CargoSubtype>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:POLITICAS_CARGA)
										then <CargoPolicyType>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:POLITICAS_CARGA)}</CargoPolicyType>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:DESCRIPCION)
										then <Description>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:DESCRIPCION)}</Description>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:TIPO_EMBALAJE)
										then <PackingType>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:TIPO_EMBALAJE)}</PackingType>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:IDENTIFICADOR_CAJA)
										then <BoxNumber>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:IDENTIFICADOR_CAJA)}</BoxNumber>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:IDENTIFICADOR_TERRITORIO)
										then <TeritoryID>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:IDENTIFICADOR_TERRITORIO)}</TeritoryID>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:PAIS_ORIGEN)
										then <FromPlace>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:PAIS_ORIGEN)}</FromPlace>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:PAIS_DESTINO)
										then <ToPlace>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:PAIS_DESTINO)}</ToPlace>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:VIA)
										then <Via>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:VIA)}</Via>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:DESTINO)
										then <Destination>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:DESTINO)}</Destination>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:TIPO_TRANSPORTE)
										then <TransportType>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:TIPO_TRANSPORTE)}</TransportType>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:TIPO_VEHICULO)
										then <VehicleType>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:TIPO_VEHICULO)}</VehicleType>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:NUMERO_ENVIO)
										then <ShipmentDoc>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:NUMERO_ENVIO)}</ShipmentDoc>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:FECHA_ENVIO)
										then <ShipmentDate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:FECHA_ENVIO)}</ShipmentDate>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:DESCRIPCION_MERCANCIA)
										then <ToOrder>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:DESCRIPCION_MERCANCIA)}</ToOrder>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:DISTANCIA)
										then <AverageAgent>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:DISTANCIA)}</AverageAgent>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:AGENTE_MEDIADOR)
										then <Distance>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:AGENTE_MEDIADOR)}</Distance>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:MEDIO_TRANSPORTE)
										then <TransportMeans>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:MEDIO_TRANSPORTE)}</TransportMeans>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:IDENTIFICADOR_RIESGO)
										then <RiskLocationID>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:IDENTIFICADOR_RIESGO)}</RiskLocationID>
										else ()
									}
									<Creditors>
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:CREDITO) then 
										<ObjectCredited>
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:CREDITO/ns1:IDENTIFICADOR_CREDITO)
												then <CreditorID>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:CREDITO/ns1:IDENTIFICADOR_CREDITO)}</CreditorID>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:CREDITO/ns1:MONTO)
												then <Amount>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:CREDITO/ns1:MONTO)}</Amount>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:CREDITO/ns1:FECHA)
												then <LendDate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:CREDITO/ns1:FECHA)}</LendDate>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:CREDITO/ns1:FECHA_FINALIZACION)
												then <ExpireDate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:CREDITO/ns1:FECHA_FINALIZACION)}</ExpireDate>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:CREDITO/ns1:TASA_INTERES)
												then <InterestRate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:CREDITO/ns1:TASA_INTERES)}</InterestRate>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:CREDITO/ns1:NUMERO_PAGOS)
												then <NumOfInstallments>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CARGA/ns1:CREDITO/ns1:NUMERO_PAGOS)}</NumOfInstallments>
												else ()
											}											
										</ObjectCredited>
									else()
																				}	
									</Creditors>
								</OCargo>
							else()
						}
						{
							if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:GRUPO) then 
								<OInsuredGroups>
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:GRUPO/ns1:TIPO_GRUPO)
										then <GrpType>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:GRUPO/ns1:TIPO_GRUPO)}</GrpType>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:GRUPO/ns1:SUBTIPO_GRUPO)
										then <GrpSubtype>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:GRUPO/ns1:SUBTIPO_GRUPO)}</GrpSubtype>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:GRUPO/ns1:DESCRIPCION)
										then <Description>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:GRUPO/ns1:DESCRIPCION)}</Description>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:GRUPO/ns1:RIESGO)
										then <RiskLocationID>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:GRUPO/ns1:RIESGO)}</RiskLocationID>
										else ()
									}
									<Creditors>
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:GRUPO/ns1:CREDITO) then 
										<ObjectCredited>
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:GRUPO/ns1:CREDITO/ns1:IDENTIFICADOR_CREDITO)
												then <CreditorID>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:GRUPO/ns1:CREDITO/ns1:IDENTIFICADOR_CREDITO)}</CreditorID>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:GRUPO/ns1:CREDITO/ns1:MONTO)
												then <Amount>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:GRUPO/ns1:CREDITO/ns1:MONTO)}</Amount>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:GRUPO/ns1:CREDITO/ns1:FECHA)
												then <LendDate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:GRUPO/ns1:CREDITO/ns1:FECHA)}</LendDate>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:GRUPO/ns1:CREDITO/ns1:FECHA_FINALIZACION)
												then <ExpireDate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:GRUPO/ns1:CREDITO/ns1:FECHA_FINALIZACION)}</ExpireDate>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:GRUPO/ns1:CREDITO/ns1:TASA_INTERES)
												then <InterestRate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:GRUPO/ns1:CREDITO/ns1:TASA_INTERES)}</InterestRate>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:GRUPO/ns1:CREDITO/ns1:NUMERO_PAGOS)
												then <NumOfInstallments>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:GRUPO/ns1:CREDITO/ns1:NUMERO_PAGOS)}</NumOfInstallments>
												else ()
											}											
										</ObjectCredited>
									else()
																				}	
									</Creditors>
								</OInsuredGroups>
							else()
						}
						{
							if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD) then 
								<OLiability>
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:DESCRIPCION)
										then <LiabDesc>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:DESCRIPCION)}</LiabDesc>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:TIPO_RESPONSABILIDAD)
										then <LiabType>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:TIPO_RESPONSABILIDAD)}</LiabType>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:SUBTIPO_RESPONSABILIDAD)
										then <LiabSubtype>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:SUBTIPO_RESPONSABILIDAD)}</LiabSubtype>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:RIESGO)
										then <RiskLocationID>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:RIESGO)}</RiskLocationID>
										else ()
									}
									<NewAddress>
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:DIRECCION/ns1:NOMBRE_PAIS)
											then <Country>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:DIRECCION/ns1:NOMBRE_PAIS)}</Country>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:DIRECCION/ns1:CODIGO_PAIS)
											then <CountryCode>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:DIRECCION/ns1:CODIGO_PAIS)}</CountryCode>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:DIRECCION/ns1:NOMBRE_ESTADO)
											then <State>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:DIRECCION/ns1:NOMBRE_ESTADO)}</State>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:DIRECCION/ns1:CODIGO_ESTADO)
											then <CountryState>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:DIRECCION/ns1:CODIGO_ESTADO)}</CountryState>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:DIRECCION/ns1:NOMBRE_REGION)
											then <Region>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:DIRECCION/ns1:NOMBRE_REGION)}</Region>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:DIRECCION/ns1:CODIGO_REGION)
											then <StateRegion>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:DIRECCION/ns1:CODIGO_REGION)}</StateRegion>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:DIRECCION/ns1:NOMBRE_CIUDAD)
											then <City>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:DIRECCION/ns1:NOMBRE_CIUDAD)}</City>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:DIRECCION/ns1:CODIGO_CIUDAD)
											then <CityCode>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:DIRECCION/ns1:CODIGO_CIUDAD)}</CityCode>
											else ()
										}
										<ResidentialAddress>
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:DIRECCION/ns1:BARRIO)
												then <QuarterName>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:DIRECCION/ns1:BARRIO)}</QuarterName>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:DIRECCION/ns1:CALLE_AVENIDA)
												then <StreetName>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:DIRECCION/ns1:CALLE_AVENIDA)}</StreetName>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:DIRECCION/ns1:CALLE_AVENIDA_NRO)
												then <StreetNo>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:DIRECCION/ns1:CALLE_AVENIDA_NRO)}</StreetNo>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:DIRECCION/ns1:EDIFICIO)
												then <BlockNo>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:DIRECCION/ns1:EDIFICIO)}</BlockNo>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:DIRECCION/ns1:ENTRADA)
												then <Entrance>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:DIRECCION/ns1:ENTRADA)}</Entrance>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:DIRECCION/ns1:PISO)
												then <Floor>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:DIRECCION/ns1:PISO)}</Floor>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:DIRECCION/ns1:APTO_CASA)
												then <Apartment>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:DIRECCION/ns1:APTO_CASA)}</Apartment>
												else ()
											}
										</ResidentialAddress>
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:DIRECCION/ns1:DIRECCION)
											then <Address>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:DIRECCION/ns1:DIRECCION)}</Address>
											else ()
										}												
									</NewAddress>
									<Creditors>
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:CREDITO) then 
										<ObjectCredited>
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:CREDITO/ns1:IDENTIFICADOR_CREDITO)
												then <CreditorID>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:CREDITO/ns1:IDENTIFICADOR_CREDITO)}</CreditorID>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:CREDITO/ns1:MONTO)
												then <Amount>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:CREDITO/ns1:MONTO)}</Amount>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:CREDITO/ns1:FECHA)
												then <LendDate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:CREDITO/ns1:FECHA)}</LendDate>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:CREDITO/ns1:FECHA_FINALIZACION)
												then <ExpireDate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:CREDITO/ns1:FECHA_FINALIZACION)}</ExpireDate>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:CREDITO/ns1:TASA_INTERES)
												then <InterestRate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:CREDITO/ns1:TASA_INTERES)}</InterestRate>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:CREDITO/ns1:NUMERO_PAGOS)
												then <NumOfInstallments>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:RESPONSABILIDAD/ns1:CREDITO/ns1:NUMERO_PAGOS)}</NumOfInstallments>
												else ()
											}											
										</ObjectCredited>
									else()
																				}	
									</Creditors>
								</OLiability>
							else()
						}
						{
							if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:OBJETO_PERDIDO) then 								
								<OLoss>
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:OBJETO_PERDIDO/ns1:DESCRIPCION)
										then <Description>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:OBJETO_PERDIDO/ns1:DESCRIPCION)}</Description>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:OBJETO_PERDIDO/ns1:NOTAS)
										then <Notes>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:OBJETO_PERDIDO/ns1:NOTAS)}</Notes>
										else ()
									}
									<Creditors>
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:OBJETO_PERDIDO/ns1:CREDITO) then 
										<ObjectCredited>
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:OBJETO_PERDIDO/ns1:CREDITO/ns1:IDENTIFICADOR_CREDITO)
												then <CreditorID>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:OBJETO_PERDIDO/ns1:CREDITO/ns1:IDENTIFICADOR_CREDITO)}</CreditorID>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:OBJETO_PERDIDO/ns1:CREDITO/ns1:MONTO)
												then <Amount>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:OBJETO_PERDIDO/ns1:CREDITO/ns1:MONTO)}</Amount>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:OBJETO_PERDIDO/ns1:CREDITO/ns1:FECHA)
												then <LendDate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:OBJETO_PERDIDO/ns1:CREDITO/ns1:FECHA)}</LendDate>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:OBJETO_PERDIDO/ns1:CREDITO/ns1:FECHA_FINALIZACION)
												then <ExpireDate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:OBJETO_PERDIDO/ns1:CREDITO/ns1:FECHA_FINALIZACION)}</ExpireDate>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:OBJETO_PERDIDO/ns1:CREDITO/ns1:TASA_INTERES)
												then <InterestRate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:OBJETO_PERDIDO/ns1:CREDITO/ns1:TASA_INTERES)}</InterestRate>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:OBJETO_PERDIDO/ns1:CREDITO/ns1:NUMERO_PAGOS)
												then <NumOfInstallments>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:OBJETO_PERDIDO/ns1:CREDITO/ns1:NUMERO_PAGOS)}</NumOfInstallments>
												else ()
											}											
										</ObjectCredited>
									else()
																				}	
									</Creditors>
								</OLoss>
							else()
						}
						{
							if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA) then 										
								<OPerson>
									<PersonalData>
										<Name>
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:NOMBRE)
												then <Given>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:NOMBRE)}</Given>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:PRIMER_APELLIDO)
												then <Surname>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:PRIMER_APELLIDO)}</Surname>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:SEGUNDO_APELLIDO)
												then <Family>{fn:data($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:SEGUNDO_APELLIDO)}</Family>
												else ()
											}
										</Name>
										<PID>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:IDENTIFICACION)}</PID>
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:SEXO)
											then <Gender>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:SEXO)}</Gender>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:FECHA_DE_NACIMIENTO)
											then <BirthDate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:FECHA_DE_NACIMIENTO)}</BirthDate>
											else ()
										}
									</PersonalData>
									<Addresses>
										{
											for $DIRECCIONES in $POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:PERSONA/ns1:DIRECCIONES
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
											for $CONTACTOS in $POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:PERSONA/ns1:CONTACTOS
											return 
											<Contact>
												<Type>{fn:data($CONTACTOS/ns1:TIPO)}</Type>
												<Details>{fn:data($CONTACTOS/ns1:VALOR)}</Details>
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
											for $DATOS_BANCARIOS in $POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:PERSONA/ns1:DATOS_BANCARIOS
											return 
											<BankAccount>
												{
													if ($DATOS_BANCARIOS/ns1:IDENTIFICADOR_CUENTA)
													then <BankAccID>{fn:data($DATOS_BANCARIOS/ns1:IDENTIFICADOR_CUENTA)}</BankAccID>
													else ()
												}
												<BankName>{fn:data($DATOS_BANCARIOS/ns1:BANCO_NOMBRE)}</BankName>
												<BankPID>{fn:data($DATOS_BANCARIOS/ns1:IDENTIFICADOR_BANCO)}</BankPID>
												<AccountNo>{fn:data($DATOS_BANCARIOS/ns1:NUMERO_CUENTA)}</AccountNo>
												<Currency>{fn:data($DATOS_BANCARIOS/ns1:MONEDA)}</Currency>
												{
													if ($DATOS_BANCARIOS/ns1:ESTADO)
													then <AccountState>{fn:data($DATOS_BANCARIOS/ns1:ESTADO)}</AccountState>
													else ()
												}
												{
													if ($DATOS_BANCARIOS/ns1:ES_PRINCIPAL)
													then <PrimaryFlag>{fn:data($DATOS_BANCARIOS/ns1:ES_PRINCIPAL)}</PrimaryFlag>
													else ()
												}
											</BankAccount>
										}
									</BankAccounts>
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:ROL)
										then <InsuredRole>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:ROL)}</InsuredRole>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:RIESGO)
										then <RiskClass>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:RIESGO)}</RiskClass>
										else ()
									}
									<Creditors>
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:CREDITO) then 
										<ObjectCredited>
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:CREDITO/ns1:IDENTIFICADOR_CREDITO)
												then <CreditorID>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:CREDITO/ns1:IDENTIFICADOR_CREDITO)}</CreditorID>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:CREDITO/ns1:MONTO)
												then <Amount>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:CREDITO/ns1:MONTO)}</Amount>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:CREDITO/ns1:FECHA)
												then <LendDate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:CREDITO/ns1:FECHA)}</LendDate>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:CREDITO/ns1:FECHA_FINALIZACION)
												then <ExpireDate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:CREDITO/ns1:FECHA_FINALIZACION)}</ExpireDate>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:CREDITO/ns1:TASA_INTERES)
												then <InterestRate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:CREDITO/ns1:TASA_INTERES)}</InterestRate>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:CREDITO/ns1:NUMERO_PAGOS)
												then <NumOfInstallments>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:CREDITO/ns1:NUMERO_PAGOS)}</NumOfInstallments>
												else ()
											}											
										</ObjectCredited>
									else()
																				}	
									</Creditors>
								</OPerson>
							else()
						}
						{
							if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AVION) then 	
								<OPlane>
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AVION/ns1:FABRICANTE)
										then <Make>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AVION/ns1:FABRICANTE)}</Make>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AVION/ns1:NRO_REGISTRO)
										then <RegNo>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AVION/ns1:NRO_REGISTRO)}</RegNo>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AVION/ns1:TIPO_AVION)
										then <PlaneType>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AVION/ns1:TIPO_AVION)}</PlaneType>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AVION/ns1:SUBTIPO_AVION)
										then <PlaneSubtype>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AVION/ns1:SUBTIPO_AVION)}</PlaneSubtype>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AVION/ns1:NRO_PRODUCTO)
										then <ProdNo>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AVION/ns1:NRO_PRODUCTO)}</ProdNo>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AVION/ns1:ANIO)
										then <ProdYear>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AVION/ns1:ANIO)}</ProdYear>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AVION/ns1:PESO)
										then <CCMTon>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AVION/ns1:PESO)}</CCMTon>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AVION/ns1:NRO_ASIENTOS)
										then <SeatsNum>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AVION/ns1:NRO_ASIENTOS)}</SeatsNum>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AVION/ns1:HISTORIAL_VUELO)
										then <PlaneHistory>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AVION/ns1:HISTORIAL_VUELO)}</PlaneHistory>
										else ()
									}
									<Creditors>
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AVION/ns1:CREDITO) then 
										<ObjectCredited>
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AVION/ns1:CREDITO/ns1:IDENTIFICADOR_CREDITO)
												then <CreditorID>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AVION/ns1:CREDITO/ns1:IDENTIFICADOR_CREDITO)}</CreditorID>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AVION/ns1:CREDITO/ns1:MONTO)
												then <Amount>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AVION/ns1:CREDITO/ns1:MONTO)}</Amount>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AVION/ns1:CREDITO/ns1:FECHA)
												then <LendDate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AVION/ns1:CREDITO/ns1:FECHA)}</LendDate>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AVION/ns1:CREDITO/ns1:FECHA_FINALIZACION)
												then <ExpireDate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AVION/ns1:CREDITO/ns1:FECHA_FINALIZACION)}</ExpireDate>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AVION/ns1:CREDITO/ns1:TASA_INTERES)
												then <InterestRate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AVION/ns1:CREDITO/ns1:TASA_INTERES)}</InterestRate>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AVION/ns1:CREDITO/ns1:NUMERO_PAGOS)
												then <NumOfInstallments>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AVION/ns1:CREDITO/ns1:NUMERO_PAGOS)}</NumOfInstallments>
												else ()
											}											
										</ObjectCredited>
									else()
																				}	
									</Creditors>
								</OPlane>
							else()
						}
						{
							if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD) then 
								<OProperty>
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:TIPO_PROPIEDAD)
										then <PropertyKind>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:TIPO_PROPIEDAD)}</PropertyKind>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:SUBTIPO_PROPIEDAD)
										then <PropertyType>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:SUBTIPO_PROPIEDAD)}</PropertyType>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:NOMBRE)
										then <Name>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:NOMBRE)}</Name>
										else ()
									}
									<NewAddress>
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:DIRECCION/ns1:NOMBRE_PAIS)
											then <Country>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:DIRECCION/ns1:NOMBRE_PAIS)}</Country>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:DIRECCION/ns1:CODIGO_PAIS)
											then <CountryCode>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:DIRECCION/ns1:CODIGO_PAIS)}</CountryCode>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:DIRECCION/ns1:NOMBRE_ESTADO)
											then <State>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:DIRECCION/ns1:NOMBRE_ESTADO)}</State>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:DIRECCION/ns1:CODIGO_ESTADO)
											then <CountryState>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:DIRECCION/ns1:CODIGO_ESTADO)}</CountryState>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:DIRECCION/ns1:NOMBRE_REGION)
											then <Region>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:DIRECCION/ns1:NOMBRE_REGION)}</Region>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:DIRECCION/ns1:CODIGO_REGION)
											then <StateRegion>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:DIRECCION/ns1:CODIGO_REGION)}</StateRegion>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:DIRECCION/ns1:NOMBRE_CIUDAD)
											then <City>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:DIRECCION/ns1:NOMBRE_CIUDAD)}</City>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:DIRECCION/ns1:CODIGO_CIUDAD)
											then <CityCode>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:DIRECCION/ns1:CODIGO_CIUDAD)}</CityCode>
											else ()
										}
										<ResidentialAddress>
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:DIRECCION/ns1:BARRIO)
												then <QuarterName>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:DIRECCION/ns1:BARRIO)}</QuarterName>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:DIRECCION/ns1:CALLE_AVENIDA)
												then <StreetName>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:DIRECCION/ns1:CALLE_AVENIDA)}</StreetName>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:DIRECCION/ns1:CALLE_AVENIDA_NRO)
												then <StreetNo>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:DIRECCION/ns1:CALLE_AVENIDA_NRO)}</StreetNo>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:DIRECCION/ns1:EDIFICIO)
												then <BlockNo>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:DIRECCION/ns1:EDIFICIO)}</BlockNo>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:DIRECCION/ns1:ENTRADA)
												then <Entrance>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:DIRECCION/ns1:ENTRADA)}</Entrance>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:DIRECCION/ns1:PISO)
												then <Floor>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:DIRECCION/ns1:PISO)}</Floor>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:DIRECCION/ns1:APTO_CASA)
												then <Apartment>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:DIRECCION/ns1:APTO_CASA)}</Apartment>
												else ()
											}
										</ResidentialAddress>
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:DIRECCION/ns1:DIRECCION)
											then <Address>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:DIRECCION/ns1:DIRECCION)}</Address>
											else ()
										}												
									</NewAddress>
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:RIESGO)
										then <RiskLocationID>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:RIESGO)}</RiskLocationID>
										else ()
									}
									<Creditors>
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:CREDITO) then 
										<ObjectCredited>
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:CREDITO/ns1:IDENTIFICADOR_CREDITO)
												then <CreditorID>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:CREDITO/ns1:IDENTIFICADOR_CREDITO)}</CreditorID>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:CREDITO/ns1:MONTO)
												then <Amount>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:CREDITO/ns1:MONTO)}</Amount>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:CREDITO/ns1:FECHA)
												then <LendDate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:CREDITO/ns1:FECHA)}</LendDate>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:CREDITO/ns1:FECHA_FINALIZACION)
												then <ExpireDate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:CREDITO/ns1:FECHA_FINALIZACION)}</ExpireDate>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:CREDITO/ns1:TASA_INTERES)
												then <InterestRate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:CREDITO/ns1:TASA_INTERES)}</InterestRate>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:CREDITO/ns1:NUMERO_PAGOS)
												then <NumOfInstallments>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:PROPIEDAD/ns1:CREDITO/ns1:NUMERO_PAGOS)}</NumOfInstallments>
												else ()
											}											
										</ObjectCredited>
									else()
																				}	
									</Creditors>
								</OProperty>
							else()
						}
						{
							if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION) then 
								<OPropBri>
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:TIPO_CONSTRUCCION)
										then <ConstructionType>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:TIPO_CONSTRUCCION)}</ConstructionType>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:AREA)
										then <Area>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:AREA)}</Area>
										else ()
									}
									<NewAddress>
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:DIRECCION/ns1:NOMBRE_PAIS)
											then <Country>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:DIRECCION/ns1:NOMBRE_PAIS)}</Country>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:DIRECCION/ns1:CODIGO_PAIS)
											then <CountryCode>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:DIRECCION/ns1:CODIGO_PAIS)}</CountryCode>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:DIRECCION/ns1:NOMBRE_ESTADO)
											then <State>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:DIRECCION/ns1:NOMBRE_ESTADO)}</State>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:DIRECCION/ns1:CODIGO_ESTADO)
											then <CountryState>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:DIRECCION/ns1:CODIGO_ESTADO)}</CountryState>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:DIRECCION/ns1:NOMBRE_REGION)
											then <Region>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:DIRECCION/ns1:NOMBRE_REGION)}</Region>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:DIRECCION/ns1:CODIGO_REGION)
											then <StateRegion>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:DIRECCION/ns1:CODIGO_REGION)}</StateRegion>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:DIRECCION/ns1:NOMBRE_CIUDAD)
											then <City>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:DIRECCION/ns1:NOMBRE_CIUDAD)}</City>
											else ()
										}
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:DIRECCION/ns1:CODIGO_CIUDAD)
											then <CityCode>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:DIRECCION/ns1:CODIGO_CIUDAD)}</CityCode>
											else ()
										}
										<ResidentialAddress>
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:DIRECCION/ns1:BARRIO)
												then <QuarterName>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:DIRECCION/ns1:BARRIO)}</QuarterName>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:DIRECCION/ns1:CALLE_AVENIDA)
												then <StreetName>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:DIRECCION/ns1:CALLE_AVENIDA)}</StreetName>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:DIRECCION/ns1:CALLE_AVENIDA_NRO)
												then <StreetNo>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:DIRECCION/ns1:CALLE_AVENIDA_NRO)}</StreetNo>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:DIRECCION/ns1:EDIFICIO)
												then <BlockNo>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:DIRECCION/ns1:EDIFICIO)}</BlockNo>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:DIRECCION/ns1:ENTRADA)
												then <Entrance>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:DIRECCION/ns1:ENTRADA)}</Entrance>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:DIRECCION/ns1:PISO)
												then <Floor>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:DIRECCION/ns1:PISO)}</Floor>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:DIRECCION/ns1:APTO_CASA)
												then <Apartment>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:DIRECCION/ns1:APTO_CASA)}</Apartment>
												else ()
											}
										</ResidentialAddress>
										{
											if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:DIRECCION/ns1:DIRECCION)
											then <Address>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:DIRECCION/ns1:DIRECCION)}</Address>
											else ()
										}												
									</NewAddress>
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:DESCRIPCION)
										then <BriDescription>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:DESCRIPCION)}</BriDescription>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:RIESGO)
										then <RiskLocationID>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:RIESGO)}</RiskLocationID>
										else ()
									}
									<Creditors>
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:CREDITO) then 
										<ObjectCredited>
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:CREDITO/ns1:IDENTIFICADOR_CREDITO)
												then <CreditorID>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:CREDITO/ns1:IDENTIFICADOR_CREDITO)}</CreditorID>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:CREDITO/ns1:MONTO)
												then <Amount>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:CREDITO/ns1:MONTO)}</Amount>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:CREDITO/ns1:FECHA)
												then <LendDate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:CREDITO/ns1:FECHA)}</LendDate>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:CREDITO/ns1:FECHA_FINALIZACION)
												then <ExpireDate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:CREDITO/ns1:FECHA_FINALIZACION)}</ExpireDate>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:CREDITO/ns1:TASA_INTERES)
												then <InterestRate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:CREDITO/ns1:TASA_INTERES)}</InterestRate>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:CREDITO/ns1:NUMERO_PAGOS)
												then <NumOfInstallments>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:CONSTRUCCION/ns1:CREDITO/ns1:NUMERO_PAGOS)}</NumOfInstallments>
												else ()
											}											
										</ObjectCredited>
									else()
																				}	
									</Creditors>
								</OPropBri>
							else()
						}
						{
							if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION) then 
								<OShip>
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:NOMBRE)
										then <Name>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:NOMBRE)}</Name>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:CLASE_EMBARCACION)
										then <ShipClass>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:CLASE_EMBARCACION)}</ShipClass>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:TIPO_EMBARCACION)
										then <ShipType>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:TIPO_EMBARCACION)}</ShipType>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:SUBTIPO_EMBARCACION)
										then <ShipSubtype>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:SUBTIPO_EMBARCACION)}</ShipSubtype>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:NRO_REGISTRO)
										then <RegNo>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:NRO_REGISTRO)}</RegNo>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:PUERTO_REGISTRO)
										then <RegPort>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:PUERTO_REGISTRO)}</RegPort>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:ARQUEO_BRUTO)
										then <GrossTonage>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:ARQUEO_BRUTO)}</GrossTonage>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:ARQUEO_NETO)
										then <NetTonage>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:ARQUEO_NETO)}</NetTonage>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:CLASE_PROPIETARIO)
										then <OwnerClass>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:CLASE_PROPIETARIO)}</OwnerClass>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:LARGO)
										then <Length>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:LARGO)}</Length>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:ALTO)
										then <Height>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:ALTO)}</Height>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:ANCHO)
										then <Wide>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:ANCHO)}</Wide>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:VADEO)
										then <Wade>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:VADEO)}</Wade>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:PESO_MUERTO)
										then <DeadWeight>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:PESO_MUERTO)}</DeadWeight>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:REGION)
										then <Region>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:REGION)}</Region>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:ASEGURADORA_ANTERIOR)
										then <PreviousInsurer>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:ASEGURADORA_ANTERIOR)}</PreviousInsurer>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:NRO_PASAJEROS)
										then <PassengerNum>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:NRO_PASAJEROS)}</PassengerNum>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:NRO_TRIPULACION)
										then <CrewNum>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:NRO_TRIPULACION)}</CrewNum>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:FECHA_MANTENIMIENTO)
										then <LastMaintenanceDate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:FECHA_MANTENIMIENTO)}</LastMaintenanceDate>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:MOTOR)
										then <Engine>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:MOTOR)}</Engine>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:INFORMACION_PRODUCCION)
										then <ProdInfo>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:INFORMACION_PRODUCCION)}</ProdInfo>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:ANIO_PRODUCCION)
										then <ProdYear>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:ANIO_PRODUCCION)}</ProdYear>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:FABRICANTE)
										then <Producer>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:FABRICANTE)}</Producer>
										else ()
									}
									<SupplementaryEquipment>
										<OAdditionalEquipment>
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:EQUIPO_SUPLEMENTARIO/ns1:IDENTIFICADOR_PADRE)
												then <ParentObjectID>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:EQUIPO_SUPLEMENTARIO/ns1:IDENTIFICADOR_PADRE)}</ParentObjectID>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:TIPO_EQUIPO)
												then <EquipmentType>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:TIPO_EQUIPO)}</EquipmentType>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:SUBTIPO_EQUIPO)
												then <EquipmentSubtype>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:SUBTIPO_EQUIPO)}</EquipmentSubtype>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:MODELO)
												then <Model>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:MODELO)}</Model>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:SERIAL)
												then <SerialNo>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:SERIAL)}</SerialNo>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:VALOR_EQUIPO)
												then <AvValue>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:VALOR_EQUIPO)}</AvValue>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:MONEDA)
												then <Currency>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:MONEDA)}</Currency>
												else ()
											}
											<Creditors>
												{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:CREDITO) then 
												<ObjectCredited>
													{
														if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:CREDITO/ns1:IDENTIFICADOR_CREDITO)
														then <CreditorID>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:CREDITO/ns1:IDENTIFICADOR_CREDITO)}</CreditorID>
														else ()
													}
													{
														if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:CREDITO/ns1:MONTO)
														then <Amount>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:CREDITO/ns1:MONTO)}</Amount>
														else ()
													}
													{
														if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:CREDITO/ns1:FECHA)
														then <LendDate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:CREDITO/ns1:FECHA)}</LendDate>
														else ()
													}
													{
														if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:CREDITO/ns1:FECHA_FINALIZACION)
														then <ExpireDate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:CREDITO/ns1:FECHA_FINALIZACION)}</ExpireDate>
														else ()
													}
													{
														if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:CREDITO/ns1:TASA_INTERES)
														then <InterestRate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:CREDITO/ns1:TASA_INTERES)}</InterestRate>
														else ()
													}
													{
														if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:CREDITO/ns1:NUMERO_PAGOS)
														then <NumOfInstallments>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:EQUIPO_SUPLEMENTARIO/ns1:EQUIPO/ns1:CREDITO/ns1:NUMERO_PAGOS)}</NumOfInstallments>
														else ()
													}											
												</ObjectCredited>
												else()
																										}
											</Creditors>
										</OAdditionalEquipment>
									</SupplementaryEquipment>
									<Creditors>
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:CREDITO) then 
										<ObjectCredited>
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:CREDITO/ns1:IDENTIFICADOR_CREDITO)
												then <CreditorID>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:CREDITO/ns1:IDENTIFICADOR_CREDITO)}</CreditorID>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:CREDITO/ns1:MONTO)
												then <Amount>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:CREDITO/ns1:MONTO)}</Amount>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:CREDITO/ns1:FECHA)
												then <LendDate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:CREDITO/ns1:FECHA)}</LendDate>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:CREDITO/ns1:FECHA_FINALIZACION)
												then <ExpireDate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:CREDITO/ns1:FECHA_FINALIZACION)}</ExpireDate>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:CREDITO/ns1:TASA_INTERES)
												then <InterestRate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:CREDITO/ns1:TASA_INTERES)}</InterestRate>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:CREDITO/ns1:NUMERO_PAGOS)
												then <NumOfInstallments>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:EMBARCACION/ns1:CREDITO/ns1:NUMERO_PAGOS)}</NumOfInstallments>
												else ()
											}											
										</ObjectCredited>
									else()
																				}	
									</Creditors>
								</OShip>
							else()
						}
						{
							if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:TREN) then 
								<OTrain>
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:TREN/ns1:NRO_REGISTRO)
										then <RegNo>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:TREN/ns1:NRO_REGISTRO)}</RegNo>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:TREN/ns1:NOMBRE)
										then <Name>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:TREN/ns1:NOMBRE)}</Name>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:TREN/ns1:TIPO_EMBARCACION)
										then <TrainType>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:TREN/ns1:TIPO_EMBARCACION)}</TrainType>
										else ()
									}
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:TREN/ns1:SUBTIPO_EMBARCACION)
										then <TrainSubtype>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:TREN/ns1:SUBTIPO_EMBARCACION)}</TrainSubtype>
										else ()
									}
									<Creditors>
									{
										if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:TREN/ns1:CREDITO) then 
										<ObjectCredited>
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:TREN/ns1:CREDITO/ns1:IDENTIFICADOR_CREDITO)
												then <CreditorID>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:TREN/ns1:CREDITO/ns1:IDENTIFICADOR_CREDITO)}</CreditorID>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:TREN/ns1:CREDITO/ns1:MONTO)
												then <Amount>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:TREN/ns1:CREDITO/ns1:MONTO)}</Amount>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:TREN/ns1:CREDITO/ns1:FECHA)
												then <LendDate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:TREN/ns1:CREDITO/ns1:FECHA)}</LendDate>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:TREN/ns1:CREDITO/ns1:FECHA_FINALIZACION)
												then <ExpireDate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:TREN/ns1:CREDITO/ns1:FECHA_FINALIZACION)}</ExpireDate>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:TREN/ns1:CREDITO/ns1:TASA_INTERES)
												then <InterestRate>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:TREN/ns1:CREDITO/ns1:TASA_INTERES)}</InterestRate>
												else ()
											}
											{
												if ($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:TREN/ns1:CREDITO/ns1:NUMERO_PAGOS)
												then <NumOfInstallments>{fn:data($POLIZAS/ns1:OBJETO_ASEGURADO/ns1:TREN/ns1:CREDITO/ns1:NUMERO_PAGOS)}</NumOfInstallments>
												else ()
											}											
										</ObjectCredited>
									else()
																				}	
									</Creditors>
								</OTrain>
							else()
						}												
					</InsuredEntity>
					{
						if ($POLIZAS/ns1:MONTO_ASEGURADO)
						then <InsuredAmount>{fn:data($POLIZAS/ns1:MONTO_ASEGURADO)}</InsuredAmount>
						else ()
					}
					{
						if ($POLIZAS/ns1:MONEDA)
						then <Currency>{fn:data($POLIZAS/ns1:MONEDA)}</Currency>
						else ()
					}
					{
						if ($POLIZAS/ns1:VALOR_ACTUAL)
						then <ActualValue>{fn:data($POLIZAS/ns1:VALOR_ACTUAL)}</ActualValue>
						else ()
					}
					{
						if ($POLIZAS/ns1:MONEDA_VALOR_ACTUAL)
						then <AVCurrency>{fn:data($POLIZAS/ns1:MONEDA_VALOR_ACTUAL)}</AVCurrency>
						else ()
					}
					{
						if ($POLIZAS/ns1:FECHA_INICIO)
						then <InsrBegin>{fn:data($POLIZAS/ns1:FECHA_INICIO)}</InsrBegin>
						else ()
					}
					{
						if ($POLIZAS/ns1:FECHA_FIN)
						then <InsrEnd>{fn:data($POLIZAS/ns1:FECHA_FIN)}</InsrEnd>
						else ()
					}
					{
						if ($POLIZAS/ns1:DURACION_PAGOS)
						then <PaymentDuration>{fn:data($POLIZAS/ns1:DURACION_PAGOS)}</PaymentDuration>
						else ()
					}
					{
						if ($POLIZAS/ns1:TIPO_DURACION)
						then <DurDimension>{fn:data($POLIZAS/ns1:TIPO_DURACION)}</DurDimension>
						else ()
					}					
					<Covers>
					{
						for $COVER in $POLIZAS/ns1:COBERTURAS
						return 
						<Cover>
							{
								if ($COVER/ns1:CODIGO)
								then <CoverCode>{fn:data($COVER/ns1:CODIGO)}</CoverCode>
								else ()
							}
							{
								if ($COVER/ns1:NUMERO_OBJETOS)
								then <ObjectNum>{fn:data($COVER/ns1:NUMERO_OBJETOS)}</ObjectNum>
								else ()
							}
							{
								if ($COVER/ns1:ANEXO_ID)
								then <AnnexID>{fn:data($COVER/ns1:ANEXO_ID)}</AnnexID>
								else ()
							}
							{
								if ($COVER/ns1:MONTO)
								then <InsuredAmount>{fn:data($COVER/ns1:MONTO)}</InsuredAmount>
								else ()
							}
							{
								if ($COVER/ns1:MONEDA)
								then <Currency>{fn:data($COVER/ns1:MONEDA)}</Currency>
								else ()
							}
							{
								if ($COVER/ns1:FECHA_INICIO)
								then <InsrBegin>{fn:data($COVER/ns1:FECHA_INICIO)}</InsrBegin>
								else ()
							}
							{
								if ($COVER/ns1:FECHA_FIN)
								then <InsrEnd>{fn:data($COVER/ns1:FECHA_FIN)}</InsrEnd>
								else ()
							}
							{
								if ($COVER/ns1:ESTADO)
								then <State>{fn:data($COVER/ns1:ESTADO)}</State>
								else ()
							}													
							<Premium>
								{
									if ($COVER/ns1:MONTO_PRIMA_COBERTURA)
									then <TotalAmount>{fn:data($COVER/ns1:MONTO_PRIMA_COBERTURA)}</TotalAmount>
									else ()
								}
								{
									if ($COVER/ns1:MONTO_PAGO_PRIMA_COBERTURA)
									then <PaidAmount>{fn:data($COVER/ns1:MONTO_PAGO_PRIMA_COBERTURA)}</PaidAmount>
									else ()
								}
								{
									if ($COVER/ns1:MONTO_PENDIENTE_PRIMA_COBERTURA)
									then <OutstandingAmount>{fn:data($COVER/ns1:MONTO_PENDIENTE_PRIMA_COBERTURA)}</OutstandingAmount>
									else ()
								}
								{
									if ($COVER/ns1:MONTO_EXCESO_PRIMA_COBERTURA)
									then <OverpaidAmount>{fn:data($COVER/ns1:MONTO_EXCESO_PRIMA_COBERTURA)}</OverpaidAmount>
									else ()
								}
								{
									if ($COVER/ns1:MONTO_PROXIMO_PRIMA_COBERTURA)
									then <NextDueAmount>{fn:data($COVER/ns1:MONTO_PROXIMO_PRIMA_COBERTURA)}</NextDueAmount>
									else ()
								}
							</Premium>
							{
								if ($COVER/ns1:TIPO_PRIMA)
								then <PremiumType>{fn:data($COVER/ns1:TIPO_PRIMA)}</PremiumType>
								else ()
							}
							<Risks>
							{
								for $RIESGO in $POLIZAS/ns1:COBERTURAS/ns1:RIESGOS
								return 
								<Risk>
									{
										if ($RIESGO/ns1:TIPO_RIESGO)
										then <RiskType>{fn:data($RIESGO/ns1:TIPO_RIESGO)}</RiskType>
										else ()
									}
									{
										if ($RIESGO/ns1:TIPO_FRANQUICIA)
										then <FranchiseType>{fn:data($RIESGO/ns1:TIPO_FRANQUICIA)}</FranchiseType>
										else ()
									}
									{
										if ($RIESGO/ns1:DIMENSION_FRANQUICIA)
										then <FranchiseDimension>{fn:data($RIESGO/ns1:DIMENSION_FRANQUICIA)}</FranchiseDimension>
										else ()
									}
									{
										if ($RIESGO/ns1:MONTO_FRANQUICIA)
										then <FranchiseValue>{fn:data($RIESGO/ns1:MONTO_FRANQUICIA)}</FranchiseValue>
										else ()
									}
									{
										if ($RIESGO/ns1:MINIMO_FRANQUICIA)
										then <FranchiseMin>{fn:data($RIESGO/ns1:MINIMO_FRANQUICIA)}</FranchiseMin>
										else ()
									}
									{
										if ($RIESGO/ns1:MAXIMO_FRANQUICIA)
										then <FranchiseMax>{fn:data($RIESGO/ns1:MAXIMO_FRANQUICIA)}</FranchiseMax>
										else ()
									}
									{
										if ($RIESGO/ns1:MONEDA_FRANQUICIA)
										then <FranchiseCurrency>{fn:data($RIESGO/ns1:MONEDA_FRANQUICIA)}</FranchiseCurrency>
										else ()
									}
									<Limits>
										{
										for $LIMITE in $RIESGO/ns1:LIMITE
										return 
											<Limit>
												{
													if ($LIMITE/ns1:TIPO_PERDIDA)
													then <LossType>{fn:data($LIMITE/ns1:TIPO_PERDIDA)}</LossType>
													else ()
												}
												{
													if ($LIMITE/ns1:TIPO_LIMITE)
													then <LimitType>{fn:data($LIMITE/ns1:TIPO_LIMITE)}</LimitType>
													else ()
												}
												{
													if ($LIMITE/ns1:MONTO_LIMITE)
													then <Amount>{fn:data($LIMITE/ns1:MONTO_LIMITE)}</Amount>
													else ()
												}
												{
													if ($LIMITE/ns1:MONEDA_LIMITE)
													then <Currency>{fn:data($LIMITE/ns1:MONEDA_LIMITE)}</Currency>
													else ()
												}
												{
													if ($LIMITE/ns1:DIMENSION_LIMITE)
													then <Dimension>{fn:data($LIMITE/ns1:DIMENSION_LIMITE)}</Dimension>
													else ()
												}
											</Limit>
										}	
									</Limits>
									<Territories>
										{
										for $TERRITORIO in $RIESGO/ns1:TERRITORIO
										return 
										<Territory>
											{
												if ($TERRITORIO/ns1:CODIGO_TERRITORIO) then 
													<TerritoryID>{fn:data($TERRITORIO/ns1:CODIGO_TERRITORIO)}</TerritoryID>
												else
													<CountryID>{fn:data($TERRITORIO/ns1:CODIGO_PAIS)}</CountryID>
											}
											{
												if ($TERRITORIO/ns1:FECHA_INICIO)
												then <ValidFrom>{fn:data($TERRITORIO/ns1:FECHA_INICIO)}</ValidFrom>
												else ()
											}
											{
												if ($TERRITORIO/ns1:HORA_INICIO)
												then <ValidFromTime>{fn:data($TERRITORIO/ns1:HORA_INICIO)}</ValidFromTime>
												else ()
											}
											{
												if ($TERRITORIO/ns1:FECHA_FIN)
												then <ValidTo>{fn:data($TERRITORIO/ns1:FECHA_FIN)}</ValidTo>
												else ()
											}
											{
												if ($TERRITORIO/ns1:HORA_FIN)
												then <ValidToTime>{fn:data($TERRITORIO/ns1:HORA_FIN)}</ValidToTime>
												else ()
											}																		
										</Territory>
										}
									</Territories>
								</Risk>
							}
							</Risks>												
							<Contributions>
								{
								for $CONTRIBUCIONES in $POLIZAS/ns1:COBERTURAS/ns1:CONTRIBUCIONES
								return 
								<Contribution>
									{
										if ($CONTRIBUCIONES/ns1:IDENTIFICADOR_PLAN)
										then <PPlanID>{fn:data($CONTRIBUCIONES/ns1:IDENTIFICADOR_PLAN)}</PPlanID>
										else ()
									}	
									{
										if ($CONTRIBUCIONES/ns1:IDENTIFICADOR_CUENTA)
										then <AccountID>{fn:data($CONTRIBUCIONES/ns1:IDENTIFICADOR_CUENTA)}</AccountID>
										else ()
									}
									{
										if ($CONTRIBUCIONES/ns1:IDENTIFICADOR_POLIZA)
										then <PolicyID>{fn:data($CONTRIBUCIONES/ns1:IDENTIFICADOR_POLIZA)}</PolicyID>
										else ()
									}
									{
										if ($CONTRIBUCIONES/ns1:IDENTIFICADOR_ANEXO)
										then <AnnexID>{fn:data($CONTRIBUCIONES/ns1:IDENTIFICADOR_ANEXO)}</AnnexID>
										else ()
									}
									{
										if ($CONTRIBUCIONES/ns1:TIPO_CUENTA_PAGO)
										then <AccountPaymentType>{fn:data($CONTRIBUCIONES/ns1:TIPO_CUENTA_PAGO)}</AccountPaymentType>
										else ()
									}
									{
										if ($CONTRIBUCIONES/ns1:TIPO_CUENTA_FRAC)
										then <AccountFractType>{fn:data($CONTRIBUCIONES/ns1:TIPO_CUENTA_FRAC)}</AccountFractType>
										else ()
									}
									{
										if ($CONTRIBUCIONES/ns1:MONTO)
										then <Amount>{fn:data($CONTRIBUCIONES/ns1:MONTO)}</Amount>
										else ()
									}
									{
										if ($CONTRIBUCIONES/ns1:MONEDA)
										then <Currency>{fn:data($CONTRIBUCIONES/ns1:MONEDA)}</Currency>
										else ()
									}
									{
										if ($CONTRIBUCIONES/ns1:PERIODO)
										then <Period>{fn:data($CONTRIBUCIONES/ns1:PERIODO)}</Period>
										else ()
									}
									{
										if ($CONTRIBUCIONES/ns1:FECHA_VENCIMIENTO)
										then <DueDate>{fn:data($CONTRIBUCIONES/ns1:FECHA_VENCIMIENTO)}</DueDate>
										else ()
									}															
								</Contribution>
								}
							</Contributions>
							<Endorsements>
								{
								for $ENDOSO in $POLIZAS/ns1:COBERTURAS/ns1:ENDOSOS
								return 
								<Endorsement>
									{
										if ($ENDOSO/ns1:CODIGO_ENDOSO)
										then <EndorsementCode>{fn:data($ENDOSO/ns1:CODIGO_ENDOSO)}</EndorsementCode>
										else ()
									}
									{
										if ($ENDOSO/ns1:TIPO_ENDOSO)
										then <EndorsementType>{fn:data($ENDOSO/ns1:TIPO_ENDOSO)}</EndorsementType>
										else ()
									}
									{
										if ($ENDOSO/ns1:SUBTIPO_ENDOSO)
										then <EndorsementSubType>{fn:data($ENDOSO/ns1:SUBTIPO_ENDOSO)}</EndorsementSubType>
										else ()
									}
									{
										if ($ENDOSO/ns1:ORDEN_ENDOSO)
										then <EndorsementOrder>{fn:data($ENDOSO/ns1:ORDEN_ENDOSO)}</EndorsementOrder>
										else ()
									}
									{
										if ($ENDOSO/ns1:DESCRIPCION)
										then <Text>{fn:data($ENDOSO/ns1:DESCRIPCION)}</Text>
										else ()
									}
									{
										if ($ENDOSO/ns1:FECHA_INICIO)
										then <BeginDate>{fn:data($ENDOSO/ns1:FECHA_INICIO)}</BeginDate>
										else ()
									}
									{
										if ($ENDOSO/ns1:HORA_INICIO)
										then <BeginDateTime>{fn:data($ENDOSO/ns1:HORA_INICIO)}</BeginDateTime>
										else ()
									}
									{
										if ($ENDOSO/ns1:FECHA_FIN)
										then <EndDate>{fn:data($ENDOSO/ns1:FECHA_FIN)}</EndDate>
										else ()
									}
									{
										if ($ENDOSO/ns1:HORA_FIN)
										then <EndDateTime>{fn:data($ENDOSO/ns1:HORA_FIN)}</EndDateTime>
										else ()
									}															
								</Endorsement>
								}	
							</Endorsements>
							<Territories>
								{
								for $TERRITORIO in $POLIZAS/ns1:COBERTURAS/ns1:TERRITORIOS
								return 
								<Territory>
									{
										if ($TERRITORIO/ns1:CODIGO_TERRITORIO) then 
											<TerritoryID>{fn:data($TERRITORIO/ns1:CODIGO_TERRITORIO)}</TerritoryID>
										else
											<CountryID>{fn:data($TERRITORIO/ns1:CODIGO_PAIS)}</CountryID>
									}
									{
										if ($TERRITORIO/ns1:FECHA_INICIO)
										then <ValidFrom>{fn:data($TERRITORIO/ns1:FECHA_INICIO)}</ValidFrom>
										else ()
									}
									{
										if ($TERRITORIO/ns1:HORA_INICIO)
										then <ValidFromTime>{fn:data($TERRITORIO/ns1:HORA_INICIO)}</ValidFromTime>
										else ()
									}
									{
										if ($TERRITORIO/ns1:FECHA_FIN)
										then <ValidTo>{fn:data($TERRITORIO/ns1:FECHA_FIN)}</ValidTo>
										else ()
									}
									{
										if ($TERRITORIO/ns1:HORA_FIN)
										then <ValidToTime>{fn:data($TERRITORIO/ns1:HORA_FIN)}</ValidToTime>
										else ()
									}																		
								</Territory>
								}
							</Territories>
							<Discounts>
								{
								for $DESCUENTO in $POLIZAS/ns1:COBERTURAS/ns1:DESCUENTOS
								return 
								<Discount>
									{
										if ($DESCUENTO/ns1:TIPO_DESCUENTO)
										then <DiscountType>{fn:data($DESCUENTO/ns1:TIPO_DESCUENTO)}</DiscountType>
										else ()
									}
									{
										if ($DESCUENTO/ns1:VALOR)
										then <DiscountValue>{fn:data($DESCUENTO/ns1:VALOR)}</DiscountValue>
										else ()
									}
									{
										if ($DESCUENTO/ns1:ES_ACUMULATIVO)
										then <AccumulativeFlag>{fn:data($DESCUENTO/ns1:ES_ACUMULATIVO)}</AccumulativeFlag>
										else ()
									}
									{
										if ($DESCUENTO/ns1:ES_APLICADO)
										then <Applied>{fn:data($DESCUENTO/ns1:ES_APLICADO)}</Applied>
										else ()
									}
									{
										if ($DESCUENTO/ns1:TARIFA)
										then <TariffDiscount>{fn:data($DESCUENTO/ns1:TARIFA)}</TariffDiscount>
										else ()
									}
									{
										if ($DESCUENTO/ns1:PORCENTAJE)
										then <DiscountPercent>{fn:data($DESCUENTO/ns1:PORCENTAJE)}</DiscountPercent>
										else ()
									}
									{
										if ($DESCUENTO/ns1:ORDEN)
										then <DiscountOrder>{fn:data($DESCUENTO/ns1:ORDEN)}</DiscountOrder>
										else ()
									}											
								</Discount>
								}
							</Discounts>
							<Indemnities>
								{
								for $INDEMNIZACION in $POLIZAS/ns1:COBERTURAS/ns1:INDEMNIZACIONES
								return 
								<Indemnity>
									{
										if ($INDEMNIZACION/ns1:TIPO_FRANQUICIA)
										then <FranchiseType>{fn:data($INDEMNIZACION/ns1:TIPO_FRANQUICIA)}</FranchiseType>
										else ()
									}
									{
										if ($INDEMNIZACION/ns1:DIMENSION_FRANQUICIA)
										then <FranchiseDimension>{fn:data($INDEMNIZACION/ns1:DIMENSION_FRANQUICIA)}</FranchiseDimension>
										else ()
									}
									{
										if ($INDEMNIZACION/ns1:VALOR_FRANQUICIA)
										then <FranchiseValue>{fn:data($INDEMNIZACION/ns1:VALOR_FRANQUICIA)}</FranchiseValue>
										else ()
									}
									{
										if ($INDEMNIZACION/ns1:MINIMO_FRANQUICIA)
										then <FranchiseMin>{fn:data($INDEMNIZACION/ns1:MINIMO_FRANQUICIA)}</FranchiseMin>
										else ()
									}
									{
										if ($INDEMNIZACION/ns1:MAXIMO_FRANQUICIA)
										then <FranchiseMax>{fn:data($INDEMNIZACION/ns1:MAXIMO_FRANQUICIA)}</FranchiseMax>
										else ()
									}
									{
										if ($INDEMNIZACION/ns1:MONEDA)
										then <FranchiseCurrency>{fn:data($INDEMNIZACION/ns1:MONEDA)}</FranchiseCurrency>
										else ()
									}
									{
										if ($INDEMNIZACION/ns1:IDENTIFICADOR_RECLAMO)
										then <FranchiseClaim>{fn:data($INDEMNIZACION/ns1:IDENTIFICADOR_RECLAMO)}</FranchiseClaim>
										else ()
									}
									{
										if ($INDEMNIZACION/ns1:PORCENTAJE)
										then <IndemnityPercent>{fn:data($INDEMNIZACION/ns1:PORCENTAJE)}</IndemnityPercent>
										else ()
									}
								</Indemnity>
								}
							</Indemnities>
							<Taxes>
								{
								for $IMPUESTOS in $POLIZAS/ns1:COBERTURAS/ns1:IMPUESTOS
								return 
								<Tax>
									{
										if ($IMPUESTOS/ns1:TIPO_IMPUESTO)
										then <TaxType>{fn:data($IMPUESTOS/ns1:TIPO_IMPUESTO)}</TaxType>
										else ()
									}
									{
										if ($IMPUESTOS/ns1:REGLA_CALCULO)
										then <CalcRule>{fn:data($IMPUESTOS/ns1:REGLA_CALCULO)}</CalcRule>
										else ()
									}
									{
										if ($IMPUESTOS/ns1:TASA)
										then <TaxRate>{fn:data($IMPUESTOS/ns1:TASA)}</TaxRate>
										else ()
									}
									{
										if ($IMPUESTOS/ns1:MONTO)
										then <TaxAmount>{fn:data($IMPUESTOS/ns1:MONTO)}</TaxAmount>
										else ()
									}
									{
										if ($IMPUESTOS/ns1:ES_INCLUIDO)
										then <Included>{fn:data($IMPUESTOS/ns1:ES_INCLUIDO)}</Included>
										else ()
									}
									{
										if ($IMPUESTOS/ns1:ES_APLICADO)
										then <Applied>{fn:data($IMPUESTOS/ns1:ES_APLICADO)}</Applied>
										else ()
									}
									{
										if ($IMPUESTOS/ns1:ES_MANUAL)
										then <ManualTaxRate>{fn:data($IMPUESTOS/ns1:ES_MANUAL)}</ManualTaxRate>
										else ()
									}
								</Tax>
								}
							</Taxes>
							<Limits>
								{
								for $LIMITE in $POLIZAS/ns1:COBERTURAS/ns1:LIMITES
								return 
									<Limit>
										{
											if ($LIMITE/ns1:TIPO_PERDIDA)
											then <LossType>{fn:data($LIMITE/ns1:TIPO_PERDIDA)}</LossType>
											else ()
										}
										{
											if ($LIMITE/ns1:TIPO_LIMITE)
											then <LimitType>{fn:data($LIMITE/ns1:TIPO_LIMITE)}</LimitType>
											else ()
										}
										{
											if ($LIMITE/ns1:MONTO_LIMITE)
											then <Amount>{fn:data($LIMITE/ns1:MONTO_LIMITE)}</Amount>
											else ()
										}
										{
											if ($LIMITE/ns1:MONEDA_LIMITE)
											then <Currency>{fn:data($LIMITE/ns1:MONEDA_LIMITE)}</Currency>
											else ()
										}
										{
											if ($LIMITE/ns1:DIMENSION_LIMITE)
											then <Dimension>{fn:data($LIMITE/ns1:DIMENSION_LIMITE)}</Dimension>
											else ()
										}
									</Limit>
								}	
							</Limits>
						</Cover>
					}
				</Covers>
					<Questionary>
						{
						for $PREGUNTA in $POLIZAS/ns1:PREGUNTAS
						return 
						<Question>
							{
								if ($PREGUNTA/ns1:CODIGO)
								then <ID>{fn:data($PREGUNTA/ns1:CODIGO)}</ID>
								else ()
							}
							{
								if ($PREGUNTA/ns1:RESPUESTA)
								then <Answer>{fn:data($PREGUNTA/ns1:RESPUESTA)}</Answer>
								else ()
							}
							{
								if ($PREGUNTA/ns1:IDENTIFICADOR)
								then <AnnexID>{fn:data($PREGUNTA/ns1:IDENTIFICADOR)}</AnnexID>
								else ()
							}															
						</Question>
						}
					</Questionary>
					<Documents>
						{
						for $DOCUMENTO in $POLIZAS/ns1:DOCUMENTOS
						return 
						<Document>
							{
								if ($DOCUMENTO/ns1:CODIGO_DOCUMENTO)
								then <DocumentID>{fn:data($DOCUMENTO/ns1:CODIGO_DOCUMENTO)}</DocumentID>
								else ()
							}
							{
								if ($DOCUMENTO/ns1:NOMBRE_DOCUMENTO)
								then <DocumentName>{fn:data($DOCUMENTO/ns1:NOMBRE_DOCUMENTO)}</DocumentName>
								else ()
							}
							{
								if ($DOCUMENTO/ns1:FECHA)
								then <DocumentDate>{fn:data($DOCUMENTO/ns1:FECHA)}</DocumentDate>
								else ()
							}
							{
								if ($DOCUMENTO/ns1:DESCRIPCION)
								then <Description>{fn:data($DOCUMENTO/ns1:DESCRIPCION)}</Description>
								else ()
							}	
							{
								if ($DOCUMENTO/ns1:FECHA_RECEPCION)
								then <ReceiveDate>{fn:data($DOCUMENTO/ns1:FECHA_RECEPCION)}</ReceiveDate>
								else ()
							}
							{
								if ($DOCUMENTO/ns1:ESTATUS)
								then <DocState>{fn:data($DOCUMENTO/ns1:ESTATUS)}</DocState>
								else ()
							}
							{
								if ($DOCUMENTO/ns1:OBSERVACIONES)
								then <Notes>{fn:data($DOCUMENTO/ns1:OBSERVACIONES)}</Notes>
								else ()
							}
						</Document>
						}
					</Documents>
					<ApprovalConditions>
						{
						for $CONDICION in $POLIZAS/ns1:CONDICIONES_APROBACION
						return 
						<ApprovalReqirement>
							{
								if ($CONDICION/ns1:RED_CODIGO)
								then <NetworkCode>{fn:data($CONDICION/ns1:RED_CODIGO)}</NetworkCode>
								else ()
							}
							{
								if ($CONDICION/ns1:LIMITE)
								then <ParLimit>{fn:data($CONDICION/ns1:LIMITE)}</ParLimit>
								else ()
							}
							{
								if ($CONDICION/ns1:MONEDA)
								then <Currency>{fn:data($CONDICION/ns1:MONEDA)}</Currency>
								else ()
							}							
						</ApprovalReqirement>
						}
					</ApprovalConditions>
					<Providers>
						{
						for $PROVEEDOR in $POLIZAS/ns1:PROVEEDORES
						return 
						<Provider>
							{
								if ($PROVEEDOR/ns1:CODIGO_POLIZA)
								then <PolicyID>{fn:data($PROVEEDOR/ns1:CODIGO_POLIZA)}</PolicyID>
								else ()
							}
							{
								if ($PROVEEDOR/ns1:CODIGO_PRODUCTO)
								then <ProductCode>{fn:data($PROVEEDOR/ns1:CODIGO_PRODUCTO)}</ProductCode>
								else ()
							}
							{
								if ($PROVEEDOR/ns1:ID_PROVEEDOR)
								then <ProviderID>{fn:data($PROVEEDOR/ns1:ID_PROVEEDOR)}</ProviderID>
								else ()
							}
							{
								if ($PROVEEDOR/ns1:CODIGO_PROVEEDOR)
								then <ProviderCode>{fn:data($PROVEEDOR/ns1:CODIGO_PROVEEDOR)}</ProviderCode>
								else ()
							}
							{
								if ($PROVEEDOR/ns1:CONTRATO_ID)
								then <ContractID>{fn:data($PROVEEDOR/ns1:CONTRATO_ID)}</ContractID>
								else ()
							}
							{
								if ($PROVEEDOR/ns1:CONTRATO_NUMERO)
								then <ContractNo>{fn:data($PROVEEDOR/ns1:CONTRATO_NUMERO)}</ContractNo>
								else ()
							}
							{
								if ($PROVEEDOR/ns1:ID_GRUPO)
								then <GroupID>{fn:data($PROVEEDOR/ns1:ID_GRUPO)}</GroupID>
								else ()
							}
							{
								if ($PROVEEDOR/ns1:CODIGO_COBERTURA)
								then <CoverCode>{fn:data($PROVEEDOR/ns1:CODIGO_COBERTURA)}</CoverCode>
								else ()
							}
							{
								if ($PROVEEDOR/ns1:TIPO_PAQUETE)
								then <PackageType>{fn:data($PROVEEDOR/ns1:TIPO_PAQUETE)}</PackageType>
								else ()
							}
							{
								if ($PROVEEDOR/ns1:TIPO_ASIENTO)
								then <SettlementType>{fn:data($PROVEEDOR/ns1:TIPO_ASIENTO)}</SettlementType>
								else ()
							}
							{
								if ($PROVEEDOR/ns1:FECHA_INICIO)
								then <InsrBegin>{fn:data($PROVEEDOR/ns1:FECHA_INICIO)}</InsrBegin>
								else ()
							}
							{
								if ($PROVEEDOR/ns1:FECHA_FIN)
								then <InsrEnd>{fn:data($PROVEEDOR/ns1:FECHA_FIN)}</InsrEnd>
								else ()
							}
						</Provider>
						}
					</Providers>
				</Insured>
			}
        </Insureds>
		<InsuranceConditions>
			{
				if ($crearPoliza/ns1:CONDICIONES/ns1:CODIGO_AGENTE)
				then <AgentNo>{fn:data($crearPoliza/ns1:CONDICIONES/ns1:CODIGO_AGENTE)}</AgentNo>
				else ()
			}
			{
				if ($crearPoliza/ns1:CONDICIONES/ns1:CODIGO_PRODUCTO)
				then <ProductCode>{fn:data($crearPoliza/ns1:CONDICIONES/ns1:CODIGO_PRODUCTO)}</ProductCode>
				else ()
			}
			{
				if ($crearPoliza/ns1:CONDICIONES/ns1:FORMA_PAGO)
				then <PaymentWay>{fn:data($crearPoliza/ns1:CONDICIONES/ns1:FORMA_PAGO)}</PaymentWay>
				else ()
			}
			{
				if ($crearPoliza/ns1:CONDICIONES/ns1:RENOVACION)
				then <Renewal>{fn:data($crearPoliza/ns1:CONDICIONES/ns1:RENOVACION)}</Renewal>
				else ()
			}
			<Endorsements>
			{
			for $ENDOSO in $crearPoliza/ns1:CONDICIONES/ns1:ENDOSOS
			return 
			<Endorsement>
				{
					if ($ENDOSO/ns1:CODIGO_ENDOSO)
					then <EndorsementCode>{fn:data($ENDOSO/ns1:CODIGO_ENDOSO)}</EndorsementCode>
					else ()
				}
				{
					if ($ENDOSO/ns1:TIPO_ENDOSO)
					then <EndorsementType>{fn:data($ENDOSO/ns1:TIPO_ENDOSO)}</EndorsementType>
					else ()
				}
				{
					if ($ENDOSO/ns1:SUBTIPO_ENDOSO)
					then <EndorsementSubType>{fn:data($ENDOSO/ns1:SUBTIPO_ENDOSO)}</EndorsementSubType>
					else ()
				}
				{
					if ($ENDOSO/ns1:ORDEN_ENDOSO)
					then <EndorsementOrder>{fn:data($ENDOSO/ns1:ORDEN_ENDOSO)}</EndorsementOrder>
					else ()
				}
				{
					if ($ENDOSO/ns1:DESCRIPCION)
					then <Text>{fn:data($ENDOSO/ns1:DESCRIPCION)}</Text>
					else ()
				}
				{
					if ($ENDOSO/ns1:FECHA_INICIO)
					then <BeginDate>{fn:data($ENDOSO/ns1:FECHA_INICIO)}</BeginDate>
					else ()
				}
				{
					if ($ENDOSO/ns1:HORA_INICIO)
					then <BeginDateTime>{fn:data($ENDOSO/ns1:HORA_INICIO)}</BeginDateTime>
					else ()
				}
				{
					if ($ENDOSO/ns1:FECHA_FIN)
					then <EndDate>{fn:data($ENDOSO/ns1:FECHA_FIN)}</EndDate>
					else ()
				}
				{
					if ($ENDOSO/ns1:HORA_FIN)
					then <EndDateTime>{fn:data($ENDOSO/ns1:HORA_FIN)}</EndDateTime>
					else ()
				}															
			</Endorsement>
			}	
		</Endorsements>
		<Discounts>
		{
		for $DESCUENTO in $crearPoliza/ns1:CONDICIONES/ns1:DESCUENTOS
		return 
		<Discount>
			{
				if ($DESCUENTO/ns1:TIPO_DESCUENTO)
				then <DiscountType>{fn:data($DESCUENTO/ns1:TIPO_DESCUENTO)}</DiscountType>
				else ()
			}
			{
				if ($DESCUENTO/ns1:VALOR)
				then <DiscountValue>{fn:data($DESCUENTO/ns1:VALOR)}</DiscountValue>
				else ()
			}
			{
				if ($DESCUENTO/ns1:ES_ACUMULATIVO)
				then <AccumulativeFlag>{fn:data($DESCUENTO/ns1:ES_ACUMULATIVO)}</AccumulativeFlag>
				else ()
			}
			{
				if ($DESCUENTO/ns1:ES_APLICADO)
				then <Applied>{fn:data($DESCUENTO/ns1:ES_APLICADO)}</Applied>
				else ()
			}
			{
				if ($DESCUENTO/ns1:TARIFA)
				then <TariffDiscount>{fn:data($DESCUENTO/ns1:TARIFA)}</TariffDiscount>
				else ()
			}
			{
				if ($DESCUENTO/ns1:PORCENTAJE)
				then <DiscountPercent>{fn:data($DESCUENTO/ns1:PORCENTAJE)}</DiscountPercent>
				else ()
			}
			{
				if ($DESCUENTO/ns1:ORDEN)
				then <DiscountOrder>{fn:data($DESCUENTO/ns1:ORDEN)}</DiscountOrder>
				else ()
			}											
		</Discount>
		}
		</Discounts>
		<Questionary>
			{
			for $PREGUNTA in $crearPoliza/ns1:CONDICIONES/ns1:PREGUNTAS
			return 
			<Question>
				{
					if ($PREGUNTA/ns1:CODIGO)
					then <ID>{fn:data($PREGUNTA/ns1:CODIGO)}</ID>
					else ()
				}
				{
					if ($PREGUNTA/ns1:RESPUESTA)
					then <Answer>{fn:data($PREGUNTA/ns1:RESPUESTA)}</Answer>
					else ()
				}
				{
					if ($PREGUNTA/ns1:IDENTIFICADOR)
					then <AnnexID>{fn:data($PREGUNTA/ns1:IDENTIFICADOR)}</AnnexID>
					else ()
				}															
			</Question>
			}
		</Questionary>
		<Documents>
			{
			for $DOCUMENTO in $crearPoliza/ns1:CONDICIONES/ns1:DOCUMENTOS
			return 
			<Document>
				{
					if ($DOCUMENTO/ns1:CODIGO_DOCUMENTO)
					then <DocumentID>{fn:data($DOCUMENTO/ns1:CODIGO_DOCUMENTO)}</DocumentID>
					else ()
				}
				{
					if ($DOCUMENTO/ns1:NOMBRE_DOCUMENTO)
					then <DocumentName>{fn:data($DOCUMENTO/ns1:NOMBRE_DOCUMENTO)}</DocumentName>
					else ()
				}
				{
					if ($DOCUMENTO/ns1:FECHA)
					then <DocumentDate>{fn:data($DOCUMENTO/ns1:FECHA)}</DocumentDate>
					else ()
				}
				{
					if ($DOCUMENTO/ns1:DESCRIPCION)
					then <Description>{fn:data($DOCUMENTO/ns1:DESCRIPCION)}</Description>
					else ()
				}	
				{
					if ($DOCUMENTO/ns1:FECHA_RECEPCION)
					then <ReceiveDate>{fn:data($DOCUMENTO/ns1:FECHA_RECEPCION)}</ReceiveDate>
					else ()
				}
				{
					if ($DOCUMENTO/ns1:ESTATUS)
					then <DocState>{fn:data($DOCUMENTO/ns1:ESTATUS)}</DocState>
					else ()
				}
				{
					if ($DOCUMENTO/ns1:OBSERVACIONES)
					then <Notes>{fn:data($DOCUMENTO/ns1:OBSERVACIONES)}</Notes>
					else ()
				}
			</Document>
			}
		</Documents>
		<Taxes>
		{
		for $IMPUESTOS in $crearPoliza/ns1:CONDICIONES/ns1:IMPUESTOS
		return 
		<Tax>
			{
				if ($IMPUESTOS/ns1:TIPO_IMPUESTO)
				then <TaxType>{fn:data($IMPUESTOS/ns1:TIPO_IMPUESTO)}</TaxType>
				else ()
			}
			{
				if ($IMPUESTOS/ns1:REGLA_CALCULO)
				then <CalcRule>{fn:data($IMPUESTOS/ns1:REGLA_CALCULO)}</CalcRule>
				else ()
			}
			{
				if ($IMPUESTOS/ns1:TASA)
				then <TaxRate>{fn:data($IMPUESTOS/ns1:TASA)}</TaxRate>
				else ()
			}
			{
				if ($IMPUESTOS/ns1:MONTO)
				then <TaxAmount>{fn:data($IMPUESTOS/ns1:MONTO)}</TaxAmount>
				else ()
			}
			{
				if ($IMPUESTOS/ns1:ES_INCLUIDO)
				then <Included>{fn:data($IMPUESTOS/ns1:ES_INCLUIDO)}</Included>
				else ()
			}
			{
				if ($IMPUESTOS/ns1:ES_APLICADO)
				then <Applied>{fn:data($IMPUESTOS/ns1:ES_APLICADO)}</Applied>
				else ()
			}
			{
				if ($IMPUESTOS/ns1:ES_MANUAL)
				then <ManualTaxRate>{fn:data($IMPUESTOS/ns1:ES_MANUAL)}</ManualTaxRate>
				else ()
			}
		</Tax>
		}
		</Taxes>
		<Participants>
		{
		for $PARTICIPANTE in $crearPoliza/ns1:CONDICIONES/ns1:PARTICIPANTES
		return 
		<Participant>
			<Entity>
                {
                    if ($PARTICIPANTE/ns1:PERSONA/ns1:TIPO_PERSONA='N') then
                        <PersonalData>
                            <Name>
                                {
                                    if ($PARTICIPANTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:NOMBRE)
                                    then <Given>{fn:data($PARTICIPANTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:NOMBRE)}</Given>
                                    else ()
                                }
                                {
                                    if ($PARTICIPANTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:PRIMER_APELLIDO)
                                    then <Surname>{fn:data($PARTICIPANTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:PRIMER_APELLIDO)}</Surname>
                                    else ()
                                }
                                {
                                    if ($PARTICIPANTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:SEGUNDO_APELLIDO)
                                    then <Family>{fn:data($PARTICIPANTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:SEGUNDO_APELLIDO)}</Family>
                                    else ()
                                }
                            </Name>
                            <PID>{fn:data($PARTICIPANTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:IDENTIFICACION)}</PID>
                            {
                                if ($PARTICIPANTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:SEXO)
                                then <Gender>{fn:data($PARTICIPANTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:SEXO)}</Gender>
                                else ()
                            }
                            {
                                if ($PARTICIPANTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:FECHA_DE_NACIMIENTO)
                                then <BirthDate>{fn:data($PARTICIPANTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:FECHA_DE_NACIMIENTO)}</BirthDate>
                                else ()
                            }
							{
                                if ($PARTICIPANTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:IDIOMA)
                                then <Language>{fn:data($PARTICIPANTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:IDIOMA)}</Language>
                                else ()
                            }
							{
                                if ($PARTICIPANTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:PAIS_RESIDENCIA)
                                then <HomeCountry>{fn:data($PARTICIPANTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:PAIS_RESIDENCIA)}</HomeCountry>
                                else ()
                            }
                        </PersonalData>
                    else
                        <CompanyData>
                            <Name>{fn:data($PARTICIPANTE/ns1:PERSONA/ns1:PERSONA_JURIDICA/ns1:RAZONSOCIAL)}</Name>
                            <CustomerID>{fn:data($PARTICIPANTE/ns1:PERSONA/ns1:PERSONA_JURIDICA/ns1:ID_CLIENTE)}</CustomerID>
                            {
                                if ($PARTICIPANTE/ns1:PERSONA/ns1:PERSONA_JURIDICA/ns1:PERIODO_FISCAL)
                                then <FiscalPeriod>{fn:data($PARTICIPANTE/ns1:PERSONA/ns1:PERSONA_JURIDICA/ns1:PERIODO_FISCAL)}</FiscalPeriod>
                                else ()
                            }
                            {
                                if ($PARTICIPANTE/ns1:PERSONA/ns1:PERSONA_JURIDICA/ns1:TIPO_PERSONA_JURIDICA)
                                then <CompType>{fn:data($PARTICIPANTE/ns1:PERSONA/ns1:PERSONA_JURIDICA/ns1:TIPO_PERSONA_JURIDICA)}</CompType>
                                else ()
                            }
                        </CompanyData>
                }
                {
                    if ($PARTICIPANTE/ns1:PERSONA/ns1:NACIONALIDAD)
                    then <Nationality>{fn:data($PARTICIPANTE/ns1:PERSONA/ns1:NACIONALIDAD)}</Nationality>
                    else ()
                }
                {
                    if ($PARTICIPANTE/ns1:PERSONA/ns1:INDUSTRIA)
                    then <IndustryCode>{fn:data($crearPoliza/ns1:CLIENTE/ns1:PERSONA/ns1:INDUSTRIA)}</IndustryCode>
                    else ()
                }
                {
                    if ($PARTICIPANTE/ns1:PERSONA/ns1:SUBINDUSTRIA)
                    then <SubIndustryCode>{fn:data($PARTICIPANTE/ns1:PERSONA/ns1:SUBINDUSTRIA)}</SubIndustryCode>
                    else ()
                }
                {
                    if ($PARTICIPANTE/ns1:PERSONA/ns1:FECHA_REGISTRO)
                    then <RegistrationDate>{fn:data($PARTICIPANTE/ns1:PERSONA/ns1:FECHA_REGISTRO)}</RegistrationDate>
                    else ()
                }
                {
                    if ($PARTICIPANTE/ns1:PERSONA/ns1:OBSERVACION)
                    then <Notes>{fn:data($PARTICIPANTE/ns1:PERSONA/ns1:OBSERVACION)}</Notes>
                    else ()
                }
                <Questionary>
                    {
                        for $PREGUNTAS in $PARTICIPANTE/ns1:PERSONA/ns1:PREGUNTAS
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
				{
                if ($PARTICIPANTE/ns1:PERSONA/ns1:DOCUMENTOS) then
				<Documents>
                    {
                        for $DOCUMENTOS in $PARTICIPANTE/ns1:PERSONA/ns1:DOCUMENTOS
                        return 
                        <Document>
                            <DocumentID>{fn:data($DOCUMENTOS/ns1:CODIGO_DOCUMENTO)}</DocumentID>
                            {
                                if ($DOCUMENTOS/ns1:NOMBRE_DOCUMENTO)
                                then <DocumentName>{fn:data($DOCUMENTOS/ns1:NOMBRE_DOCUMENTO)}</DocumentName>
                                else ()
                            }
                            {
                                if ($DOCUMENTOS/ns1:FECHA)
                                then <DocumentDate>{fn:data($DOCUMENTOS/ns1:FECHA)}</DocumentDate>
                                else ()
                            }
							 {
                                if ($DOCUMENTOS/ns1:DESCRIPCION)
                                then <Description>{fn:data($DOCUMENTOS/ns1:DESCRIPCION)}</Description>
                                else ()
                            }
							 {
                                if ($DOCUMENTOS/ns1:FECHA_RECEPCION)
                                then <ReceiveDate>{fn:data($DOCUMENTOS/ns1:FECHA_RECEPCION)}</ReceiveDate>
                                else ()
                            }
							 {
                                if ($DOCUMENTOS/ns1:ESTATUS)
                                then <DocState>{fn:data($DOCUMENTOS/ns1:ESTATUS)}</DocState>
                                else ()
                            }
							 {
                                if ($DOCUMENTOS/ns1:OBSERVACIONES)
                                then <Notes>{fn:data($DOCUMENTOS/ns1:OBSERVACIONES)}</Notes>
                                else ()
                            }
						</Document>
                    }
                </Documents>   
				else ()
                }
			</Entity>
			{
            if ($PARTICIPANTE/ns1:PERSONA/ns1:DIRECCIONES) then
            <Addresses>
                {
                    for $DIRECCIONES in $PARTICIPANTE/ns1:PERSONA/ns1:DIRECCIONES
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
                            {
                                if ($DIRECCIONES/ns1:CALLE_AVENIDA)
                                then <StreetName>{fn:data($DIRECCIONES/ns1:CALLE_AVENIDA)}</StreetName>
                                else ()
                            }
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
			else ()
            }
			{
            if ($PARTICIPANTE/ns1:PERSONA/ns1:CONTACTOS) then
            <Contacts>
                {
                    for $CONTACTO in $PARTICIPANTE/ns1:PERSONA/ns1:CONTACTOS
                    return 
                    <Contact>
                        {
                            if ($CONTACTO/ns1:TIPO)
                            then <Type>{fn:data($CONTACTO/ns1:TIPO)}</Type>
                            else ()
                        }
                        {
                            if ($CONTACTO/ns1:VALOR)
                            then <Details>{fn:data($CONTACTO/ns1:VALOR)}</Details>
                            else ()
                        }
                        {
                            if ($CONTACTO/ns1:OBSERVACION)
                            then <ContactNote>{fn:data($CONTACTO/ns1:OBSERVACION)}</ContactNote>
                            else ()
                        }
						{
                            if ($CONTACTO/ns1:ES_PRINCIPAL)
                            then <PrimaryFlag>{fn:data($CONTACTO/ns1:ES_PRINCIPAL)}</PrimaryFlag>
                            else ()
                        }
						{
                            if ($CONTACTO/ns1:IDIOMA)
                            then <Language>{fn:data($CONTACTO/ns1:IDIOMA)}</Language>
                            else ()
                        }
						</Contact>
                }
            </Contacts>  
			else ()
            }			
			{
				if ($PARTICIPANTE/ns1:RELACION)
				then <ParticipantRole>{fn:data($PARTICIPANTE/ns1:RELACION)}</ParticipantRole>
				else ()
			}
			{
				if ($PARTICIPANTE/ns1:ESTATUS)
				then <Status>{fn:data($PARTICIPANTE/ns1:ESTATUS)}</Status>
				else ()
			}
			{
				if ($PARTICIPANTE/ns1:IDIOMA)
				then <Language>{fn:data($PARTICIPANTE/ns1:IDIOMA)}</Language>
				else ()
			}
			{
            if ($PARTICIPANTE/ns1:DIRECCIONES_POLIZA) then
			<PolicyAddresses>
                {
                    for $DIRECCION in $PARTICIPANTE/ns1:DIRECCIONES_POLIZA
                    return 
                    <PolicyAddress>
						<Address>
                        {
                            if ($DIRECCION/ns1:NOMBRE_PAIS)
                            then <Country>{fn:data($DIRECCION/ns1:NOMBRE_PAIS)}</Country>
                            else ()
                        }
                        {
                            if ($DIRECCION/ns1:CODIGO_PAIS)
                            then <CountryCode>{fn:data($DIRECCION/ns1:CODIGO_PAIS)}</CountryCode>
                            else ()
                        }
                        {
                            if ($DIRECCION/ns1:NOMBRE_ESTADO)
                            then <State>{fn:data($DIRECCION/ns1:NOMBRE_ESTADO)}</State>
                            else ()
                        }
                        {
                            if ($DIRECCION/ns1:CODIGO_ESTADO)
                            then <CountryState>{fn:data($DIRECCION/ns1:CODIGO_ESTADO)}</CountryState>
                            else ()
                        }
                        {
                            if ($DIRECCION/ns1:NOMBRE_REGION)
                            then <Region>{fn:data($DIRECCION/ns1:NOMBRE_REGION)}</Region>
                            else ()
                        }
                        {
                            if ($DIRECCION/ns1:CODIGO_REGION)
                            then <StateRegion>{fn:data($DIRECCION/ns1:CODIGO_REGION)}</StateRegion>
                            else ()
                        }
                        {
                            if ($DIRECCION/ns1:NOMBRE_CIUDAD)
                            then <City>{fn:data($DIRECCION/ns1:NOMBRE_CIUDAD)}</City>
                            else ()
                        }
                        {
                            if ($DIRECCION/ns1:CODIGO_CIUDAD)
                            then <CityCode>{fn:data($DIRECCION/ns1:CODIGO_CIUDAD)}</CityCode>
                            else ()
                        }
                        <ResidentialAddress>
                            {
                                if ($DIRECCION/ns1:BARRIO)
                                then <QuarterName>{fn:data($DIRECCION/ns1:BARRIO)}</QuarterName>
                                else ()
                            }
                            {
                                if ($DIRECCION/ns1:CALLE_AVENIDA)
                                then <StreetName>{fn:data($DIRECCION/ns1:CALLE_AVENIDA)}</StreetName>
                                else ()
                            }
                            {
                                if ($DIRECCION/ns1:CALLE_AVENIDA_NRO)
                                then <StreetNo>{fn:data($DIRECCION/ns1:CALLE_AVENIDA_NRO)}</StreetNo>
                                else ()
                            }
                            {
                                if ($DIRECCION/ns1:EDIFICIO)
                                then <BlockNo>{fn:data($DIRECCION/ns1:EDIFICIO)}</BlockNo>
                                else ()
                            }
                            {
                                if ($DIRECCION/ns1:ENTRADA)
                                then <Entrance>{fn:data($DIRECCION/ns1:ENTRADA)}</Entrance>
                                else ()
                            }
                            {
                                if ($DIRECCION/ns1:PISO)
                                then <Floor>{fn:data($DIRECCION/ns1:PISO)}</Floor>
                                else ()
                            }
                            {
                                if ($DIRECCION/ns1:APTO_CASA)
                                then <Apartment>{fn:data($DIRECCION/ns1:APTO_CASA)}</Apartment>
                                else ()
                            }
                        </ResidentialAddress>
                        <AddressType>{fn:data($DIRECCION/ns1:TIPO_DIRECCION)}</AddressType>
                        {
                            if ($DIRECCION/ns1:DIRECCION)
                            then <Address>{fn:data($DIRECCION/ns1:DIRECCION)}</Address>
                            else ()
                        }
                        {
                            if ($DIRECCION/ns1:ES_CORRESPONDENCIA)
                            then <MailYN>{fn:data($DIRECCION/ns1:ES_CORRESPONDENCIA)}</MailYN>
                            else ()
                        }
                        {
                            if ($DIRECCION/ns1:ES_FACTURACION)
                            then <InvoiceYN>{fn:data($DIRECCION/ns1:ES_FACTURACION)}</InvoiceYN>
                            else ()
                        }
                        {
                            if ($DIRECCION/ns1:OBSERVACION)
                            then <Notes>{fn:data($DIRECCION/ns1:OBSERVACION)}</Notes>
                            else ()
                        }
                        {
                            if ($DIRECCION/ns1:ES_PRINCIPAL)
                            then <PrimaryFlag>{fn:data($DIRECCION/ns1:ES_PRINCIPAL)}</PrimaryFlag>
                            else ()
                        }
                        {
                            if ($DIRECCION/ns1:TELEFONO)
                            then <Phone>{fn:data($DIRECCION/ns1:TELEFONO)}</Phone>
                            else ()
                        }
                        {
                            if ($DIRECCION/ns1:FAX)
                            then <Fax>{fn:data($DIRECCION/ns1:FAX)}</Fax>
                            else ()
                        }
                        {
                            if ($DIRECCION/ns1:EMAIL)
                            then <Email>{fn:data($DIRECCION/ns1:EMAIL)}</Email>
                            else ()
                        }
						</Address>
						{
                            if ($DIRECCION/ns1:USO)
                            then <AddressPurpose>{fn:data($DIRECCION/ns1:USO)}</AddressPurpose>
                            else ()
                        }
					</PolicyAddress>
                }
            </PolicyAddresses>
			else ()
			}
			{
            if ($PARTICIPANTE/ns1:CONTACTOS_POLIZA) then
			<PolicyContacts>
                {
				for $CONTACTO in $PARTICIPANTE/ns1:CONTACTOS_POLIZA
				return 
				<PolicyContact>
				<Contact>
					{
						if ($CONTACTO/ns1:TIPO)
						then <Type>{fn:data($CONTACTO/ns1:TIPO)}</Type>
						else ()
					}
					{
						if ($CONTACTO/ns1:VALOR)
						then <Details>{fn:data($CONTACTO/ns1:VALOR)}</Details>
						else ()
					}
					{
						if ($CONTACTO/ns1:OBSERVACION)
						then <ContactNote>{fn:data($CONTACTO/ns1:OBSERVACION)}</ContactNote>
						else ()
					}
					{
						if ($CONTACTO/ns1:ES_PRINCIPAL)
						then <PrimaryFlag>{fn:data($CONTACTO/ns1:ES_PRINCIPAL)}</PrimaryFlag>
						else ()
					}
					{
						if ($CONTACTO/ns1:IDIOMA)
						then <Language>{fn:data($CONTACTO/ns1:IDIOMA)}</Language>
						else ()
					}
				</Contact>	
				{
					if ($CONTACTO/ns1:USO)
					then <ContactPurpose>{fn:data($CONTACTO/ns1:USO)}</ContactPurpose>
					else ()
				}
				</PolicyContact>
                }
            </PolicyContacts> 		
			else ()
			}
		</Participant>
		}
		</Participants>
		<Agents>
		{
		for $AGENTE in $crearPoliza/ns1:CONDICIONES/ns1:AGENTES
		return 
		<Agent>
			{
				if ($AGENTE/ns1:CODIGO_AGENTE)
				then <AgentNo>{fn:data($AGENTE/ns1:CODIGO_AGENTE)}</AgentNo>
				else ()
			}
			{
				if ($AGENTE/ns1:ROL_AGENTE)
				then <AgentRole>{fn:data($AGENTE/ns1:ROL_AGENTE)}</AgentRole>
				else ()
			}
			<PolicyAddresses>
                {
                    for $DIRECCION in $AGENTE/ns1:DIRECCIONES_POLIZA
                    return 
                    <PolicyAddress>
						<Address>
                        {
                            if ($DIRECCION/ns1:NOMBRE_PAIS)
                            then <Country>{fn:data($DIRECCION/ns1:NOMBRE_PAIS)}</Country>
                            else ()
                        }
                        {
                            if ($DIRECCION/ns1:CODIGO_PAIS)
                            then <CountryCode>{fn:data($DIRECCION/ns1:CODIGO_PAIS)}</CountryCode>
                            else ()
                        }
                        {
                            if ($DIRECCION/ns1:NOMBRE_ESTADO)
                            then <State>{fn:data($DIRECCION/ns1:NOMBRE_ESTADO)}</State>
                            else ()
                        }
                        {
                            if ($DIRECCION/ns1:CODIGO_ESTADO)
                            then <CountryState>{fn:data($DIRECCION/ns1:CODIGO_ESTADO)}</CountryState>
                            else ()
                        }
                        {
                            if ($DIRECCION/ns1:NOMBRE_REGION)
                            then <Region>{fn:data($DIRECCION/ns1:NOMBRE_REGION)}</Region>
                            else ()
                        }
                        {
                            if ($DIRECCION/ns1:CODIGO_REGION)
                            then <StateRegion>{fn:data($DIRECCION/ns1:CODIGO_REGION)}</StateRegion>
                            else ()
                        }
                        {
                            if ($DIRECCION/ns1:NOMBRE_CIUDAD)
                            then <City>{fn:data($DIRECCION/ns1:NOMBRE_CIUDAD)}</City>
                            else ()
                        }
                        {
                            if ($DIRECCION/ns1:CODIGO_CIUDAD)
                            then <CityCode>{fn:data($DIRECCION/ns1:CODIGO_CIUDAD)}</CityCode>
                            else ()
                        }
                        <ResidentialAddress>
                            {
                                if ($DIRECCION/ns1:BARRIO)
                                then <QuarterName>{fn:data($DIRECCION/ns1:BARRIO)}</QuarterName>
                                else ()
                            }
                            {
                                if ($DIRECCION/ns1:CALLE_AVENIDA)
                                then <StreetName>{fn:data($DIRECCION/ns1:CALLE_AVENIDA)}</StreetName>
                                else ()
                            }
                            {
                                if ($DIRECCION/ns1:CALLE_AVENIDA_NRO)
                                then <StreetNo>{fn:data($DIRECCION/ns1:CALLE_AVENIDA_NRO)}</StreetNo>
                                else ()
                            }
                            {
                                if ($DIRECCION/ns1:EDIFICIO)
                                then <BlockNo>{fn:data($DIRECCION/ns1:EDIFICIO)}</BlockNo>
                                else ()
                            }
                            {
                                if ($DIRECCION/ns1:ENTRADA)
                                then <Entrance>{fn:data($DIRECCION/ns1:ENTRADA)}</Entrance>
                                else ()
                            }
                            {
                                if ($DIRECCION/ns1:PISO)
                                then <Floor>{fn:data($DIRECCION/ns1:PISO)}</Floor>
                                else ()
                            }
                            {
                                if ($DIRECCION/ns1:APTO_CASA)
                                then <Apartment>{fn:data($DIRECCION/ns1:APTO_CASA)}</Apartment>
                                else ()
                            }
                        </ResidentialAddress>
                        <AddressType>{fn:data($DIRECCION/ns1:TIPO_DIRECCION)}</AddressType>
                        {
                            if ($DIRECCION/ns1:DIRECCION)
                            then <Address>{fn:data($DIRECCION/ns1:DIRECCION)}</Address>
                            else ()
                        }
                        {
                            if ($DIRECCION/ns1:ES_CORRESPONDENCIA)
                            then <MailYN>{fn:data($DIRECCION/ns1:ES_CORRESPONDENCIA)}</MailYN>
                            else ()
                        }
                        {
                            if ($DIRECCION/ns1:ES_FACTURACION)
                            then <InvoiceYN>{fn:data($DIRECCION/ns1:ES_FACTURACION)}</InvoiceYN>
                            else ()
                        }
                        {
                            if ($DIRECCION/ns1:OBSERVACION)
                            then <Notes>{fn:data($DIRECCION/ns1:OBSERVACION)}</Notes>
                            else ()
                        }
                        {
                            if ($DIRECCION/ns1:ES_PRINCIPAL)
                            then <PrimaryFlag>{fn:data($DIRECCION/ns1:ES_PRINCIPAL)}</PrimaryFlag>
                            else ()
                        }
                        {
                            if ($DIRECCION/ns1:TELEFONO)
                            then <Phone>{fn:data($DIRECCION/ns1:TELEFONO)}</Phone>
                            else ()
                        }
                        {
                            if ($DIRECCION/ns1:FAX)
                            then <Fax>{fn:data($DIRECCION/ns1:FAX)}</Fax>
                            else ()
                        }
                        {
                            if ($DIRECCION/ns1:EMAIL)
                            then <Email>{fn:data($DIRECCION/ns1:EMAIL)}</Email>
                            else ()
                        }
						</Address>
						{
                            if ($DIRECCION/ns1:USO)
                            then <AddressPurpose>{fn:data($DIRECCION/ns1:USO)}</AddressPurpose>
                            else ()
                        }
					</PolicyAddress>
                }
            </PolicyAddresses>
			<PolicyContacts>
                {
				for $CONTACTO in $AGENTE/ns1:CONTACTOS_POLIZA
				return 
				<PolicyContact>
				<Contact>
					{
						if ($CONTACTO/ns1:TIPO)
						then <Type>{fn:data($CONTACTO/ns1:TIPO)}</Type>
						else ()
					}
					{
						if ($CONTACTO/ns1:VALOR)
						then <Details>{fn:data($CONTACTO/ns1:VALOR)}</Details>
						else ()
					}
					{
						if ($CONTACTO/ns1:OBSERVACION)
						then <ContactNote>{fn:data($CONTACTO/ns1:OBSERVACION)}</ContactNote>
						else ()
					}
					{
						if ($CONTACTO/ns1:ES_PRINCIPAL)
						then <PrimaryFlag>{fn:data($CONTACTO/ns1:ES_PRINCIPAL)}</PrimaryFlag>
						else ()
					}
					{
						if ($CONTACTO/ns1:IDIOMA)
						then <Language>{fn:data($CONTACTO/ns1:IDIOMA)}</Language>
						else ()
					}
				</Contact>	
				{
					if ($CONTACTO/ns1:USO)
					then <ContactPurpose>{fn:data($CONTACTO/ns1:USO)}</ContactPurpose>
					else ()
				}
				</PolicyContact>
                }
            </PolicyContacts> 			
		</Agent>
		}
		</Agents>
		<Billings>
			{
			for $FACTURA in $crearPoliza/ns1:CONDICIONES/ns1:FACTURACION
			return 
			<Billing>
				{
					if ($FACTURA/ns1:MODO_PAGO)
					then <PaymentMode>{fn:data($FACTURA/ns1:MODO_PAGO)}</PaymentMode>
					else ()
				}
				{
					if ($FACTURA/ns1:DIA_PAGO)
					then <PayDueDate>{fn:data($FACTURA/ns1:DIA_PAGO)}</PayDueDate>
					else ()
				}
				{
					if ($FACTURA/ns1:FORMA_PAGO)
					then <PaymentWay>{fn:data($FACTURA/ns1:FORMA_PAGO)}</PaymentWay>
					else ()
				}
				{
					if ($FACTURA/ns1:PLAZO_PAGO)
					then <InstallmentsPeriod>{fn:data($FACTURA/ns1:PLAZO_PAGO)}</InstallmentsPeriod>
					else ()
				}
				{
					if ($FACTURA/ns1:FECHA_INICIO)
					then <ValidFrom>{fn:data($FACTURA/ns1:FECHA_INICIO)}</ValidFrom>
					else ()
				}
				{
					if ($FACTURA/ns1:HORA_INICIO)
					then <ValidFromTime>{fn:data($FACTURA/ns1:HORA_INICIO)}</ValidFromTime>
					else ()
				}
				{
					if ($FACTURA/ns1:FECHA_FIN)
					then <ValidTo>{fn:data($FACTURA/ns1:FECHA_FIN)}</ValidTo>
					else ()
				}
				{
					if ($FACTURA/ns1:HORA_FIN)
					then <ValidToTime>{fn:data($FACTURA/ns1:HORA_FIN)}</ValidToTime>
					else ()
				}																		
			</Billing>
			}
		</Billings>
		<RenewalCondition>
			{
				if ($crearPoliza/ns1:CONDICIONES/ns1:CONDICION_RENOVACION/ns1:MODO_RENOVACION)
				then <RenewalMethod>{fn:data($crearPoliza/ns1:CONDICIONES/ns1:CONDICION_RENOVACION/ns1:MODO_RENOVACION)}</RenewalMethod>
				else ()
			}
			{
				if ($crearPoliza/ns1:CONDICIONES/ns1:CONDICION_RENOVACION/ns1:FECHA_RENOVACION)
				then <RenewalDate>{fn:data($crearPoliza/ns1:CONDICIONES/ns1:CONDICION_RENOVACION/ns1:FECHA_RENOVACION)}</RenewalDate>
				else ()
			}																					
		</RenewalCondition>
		<GeographicalAreas>
			{
			for $AREA in $crearPoliza/ns1:CONDICIONES/ns1:AREA_GEOGRAFICAS
			return 
			<GeographicalArea>
				{
					if ($AREA/ns1:CODIGO_AREA_POLIZA)
					then <PolicyAreaID>{fn:data($AREA/ns1:CODIGO_AREA_POLIZA)}</PolicyAreaID>
					else ()
				}
				{
					if ($AREA/ns1:CODIGO_PRODUCTO)
					then <ProductCode>{fn:data($AREA/ns1:CODIGO_PRODUCTO)}</ProductCode>
					else ()
				}
				{
					if ($AREA/ns1:CODIGO_AREA_GEOGRAFICA)
					then <GeogAreaID>{fn:data($AREA/ns1:CODIGO_AREA_GEOGRAFICA)}</GeogAreaID>
					else ()
				}
				{
					if ($AREA/ns1:CODIGO_OBJETO_ASEGURADO)
					then <InsuredObjectID>{fn:data($AREA/ns1:CODIGO_OBJETO_ASEGURADO)}</InsuredObjectID>
					else ()
				}
				{
					if ($AREA/ns1:CODIGO_COBERTURA)
					then <CoverCode>{fn:data($AREA/ns1:CODIGO_COBERTURA)}</CoverCode>
					else ()
				}
				{
					if ($AREA/ns1:CODIGO_PAQUETE)
					then <PackageID>{fn:data($AREA/ns1:CODIGO_PAQUETE)}</PackageID>
					else ()
				}
				{
					if ($AREA/ns1:TIPO_COBERTURA)
					then <CoverageType>{fn:data($AREA/ns1:TIPO_COBERTURA)}</CoverageType>
					else ()
				}
				{
					if ($AREA/ns1:TIPO_RECLAMO)
					then <ClaimType>{fn:data($AREA/ns1:TIPO_RECLAMO)}</ClaimType>
					else ()
				}
				{
					if ($AREA/ns1:FECHA_INICIO)
					then <InsrBegin>{fn:data($AREA/ns1:FECHA_INICIO)}</InsrBegin>
					else ()
				}
				{
					if ($AREA/ns1:FECHA_FIN)
					then <InsrEnd>{fn:data($AREA/ns1:FECHA_FIN)}</InsrEnd>
					else ()
				}																		
			</GeographicalArea>
			}
		</GeographicalAreas>
		<PolicyDiagnoses>
			{
			for $DIAG in $crearPoliza/ns1:CONDICIONES/ns1:DIAGNOSTICOS
			return 
			<PolicyDiagnosis>
				{
					if ($DIAG/ns1:CODIGO_POLIZA)
					then <PolicyID>{fn:data($DIAG/ns1:CODIGO_POLIZA)}</PolicyID>
					else ()
				}
				{
					if ($DIAG/ns1:CODIGO_PRODUCTO)
					then <ProductCode>{fn:data($DIAG/ns1:CODIGO_PRODUCTO)}</ProductCode>
					else ()
				}
				{
					if ($DIAG/ns1:ID_DIAGNOSTICO)
					then <DiagnosisID>{fn:data($DIAG/ns1:ID_DIAGNOSTICO)}</DiagnosisID>
					else ()
				}
				{
					if ($DIAG/ns1:CODIGO_DIAGNOSTICO)
					then <DiagnosisCode>{fn:data($DIAG/ns1:CODIGO_DIAGNOSTICO)}</DiagnosisCode>
					else ()
				}
				{
					if ($DIAG/ns1:ID_GRUPO)
					then <GroupID>{fn:data($DIAG/ns1:ID_GRUPO)}</GroupID>
					else ()
				}
				{
					if ($DIAG/ns1:CODIGO_AREA_GEOGRAFICA)
					then <GeogAreaID>{fn:data($DIAG/ns1:CODIGO_AREA_GEOGRAFICA)}</GeogAreaID>
					else ()
				}
				{
					if ($DIAG/ns1:ID_PROVEEDOR)
					then <ProviderID>{fn:data($DIAG/ns1:ID_PROVEEDOR)}</ProviderID>
					else ()
				}
				{
					if ($DIAG/ns1:CODIGO_PROVEEDOR)
					then <ProviderCode>{fn:data($DIAG/ns1:CODIGO_PROVEEDOR)}</ProviderCode>
					else ()
				}				
				{
					if ($DIAG/ns1:TIPO_COBERTURA)
					then <CoverageType>{fn:data($DIAG/ns1:TIPO_COBERTURA)}</CoverageType>
					else ()
				}
				{
					if ($DIAG/ns1:TIPO_RECLAMO)
					then <ClaimType>{fn:data($DIAG/ns1:TIPO_RECLAMO)}</ClaimType>
					else ()
				}
				{
					if ($DIAG/ns1:TIPO_ASIENTO)
					then <SettlementType>{fn:data($DIAG/ns1:TIPO_ASIENTO)}</SettlementType>
					else ()
				}
				{
					if ($DIAG/ns1:COBERTURA_RED)
					then <NetworkCoverage>{fn:data($DIAG/ns1:COBERTURA_RED)}</NetworkCoverage>
					else ()
				}
				{
					if ($DIAG/ns1:LIMITE)
					then <DiagLimit>{fn:data($DIAG/ns1:LIMITE)}</DiagLimit>
					else ()
				}
				{
					if ($DIAG/ns1:MONEDA)
					then <Currency>{fn:data($DIAG/ns1:MONEDA)}</Currency>
					else ()
				}
				{
					if ($DIAG/ns1:FECHA_INICIO)
					then <InsrBegin>{fn:data($DIAG/ns1:FECHA_INICIO)}</InsrBegin>
					else ()
				}
				{
					if ($DIAG/ns1:FECHA_FIN)
					then <InsrEnd>{fn:data($DIAG/ns1:FECHA_FIN)}</InsrEnd>
					else ()
				}																		
			</PolicyDiagnosis>
			}
		</PolicyDiagnoses>
		<PolicyServices>
			{
			for $SERV in $crearPoliza/ns1:CONDICIONES/ns1:SERVICIOS
			return 
			<PolicyService>
				{
					if ($SERV/ns1:CODIGO_POLIZA)
					then <PolicyID>{fn:data($SERV/ns1:CODIGO_POLIZA)}</PolicyID>
					else ()
				}
				{
					if ($SERV/ns1:CODIGO_PRODUCTO)
					then <ProductCode>{fn:data($SERV/ns1:CODIGO_PRODUCTO)}</ProductCode>
					else ()
				}
				{
					if ($SERV/ns1:ID_SERVICIO)
					then <ServiceID>{fn:data($SERV/ns1:ID_SERVICIO)}</ServiceID>
					else ()
				}
				{
					if ($SERV/ns1:CODIGO_SERVICIO)
					then <ServiceCode>{fn:data($SERV/ns1:CODIGO_SERVICIO)}</ServiceCode>
					else ()
				}
				{
					if ($SERV/ns1:ID_GRUPO)
					then <GroupID>{fn:data($SERV/ns1:ID_GRUPO)}</GroupID>
					else ()
				}
				{
					if ($SERV/ns1:CODIGO_AREA_GEOGRAFICA)
					then <GeogAreaID>{fn:data($SERV/ns1:CODIGO_AREA_GEOGRAFICA)}</GeogAreaID>
					else ()
				}
				{
					if ($SERV/ns1:ID_PROVEEDOR)
					then <ProviderID>{fn:data($SERV/ns1:ID_PROVEEDOR)}</ProviderID>
					else ()
				}
				{
					if ($SERV/ns1:CODIGO_PROVEEDOR)
					then <ProviderCode>{fn:data($SERV/ns1:CODIGO_PROVEEDOR)}</ProviderCode>
					else ()
				}				
				{
					if ($SERV/ns1:TIPO_COBERTURA)
					then <CoverageType>{fn:data($SERV/ns1:TIPO_COBERTURA)}</CoverageType>
					else ()
				}
				{
					if ($SERV/ns1:TIPO_RECLAMO)
					then <ClaimType>{fn:data($SERV/ns1:TIPO_RECLAMO)}</ClaimType>
					else ()
				}
				{
					if ($SERV/ns1:TIPO_ASIENTO)
					then <SettlementType>{fn:data($SERV/ns1:TIPO_ASIENTO)}</SettlementType>
					else ()
				}
				{
					if ($SERV/ns1:COBERTURA_RED)
					then <NetworkCoverage>{fn:data($SERV/ns1:COBERTURA_RED)}</NetworkCoverage>
					else ()
				}
				{
					if ($SERV/ns1:MONTO_SERVICIO)
					then <SrvLimit>{fn:data($SERV/ns1:MONTO_SERVICIO)}</SrvLimit>
					else ()
				}
				{
					if ($SERV/ns1:MONEDA)
					then <Currency>{fn:data($SERV/ns1:MONEDA)}</Currency>
					else ()
				}
				{
					if ($SERV/ns1:FECHA_INICIO)
					then <InsrBegin>{fn:data($SERV/ns1:FECHA_INICIO)}</InsrBegin>
					else ()
				}
				{
					if ($SERV/ns1:FECHA_FIN)
					then <InsrEnd>{fn:data($SERV/ns1:FECHA_FIN)}</InsrEnd>
					else ()
				}																		
			</PolicyService>
			}
		</PolicyServices>
		<Drugs>
			{
			for $DRUGS in $crearPoliza/ns1:CONDICIONES/ns1:TRATAMIENTOS_MEDICOS
			return 
			<PolicyDrug>
				{
					if ($DRUGS/ns1:CODIGO_POLIZA)
					then <PolicyID>{fn:data($DRUGS/ns1:CODIGO_POLIZA)}</PolicyID>
					else ()
				}
				{
					if ($DRUGS/ns1:CODIGO_PRODUCTO)
					then <ProductCode>{fn:data($DRUGS/ns1:CODIGO_PRODUCTO)}</ProductCode>
					else ()
				}
				{
					if ($DRUGS/ns1:ID_TRATAMIENTO)
					then <DrugID>{fn:data($DRUGS/ns1:ID_TRATAMIENTO)}</DrugID>
					else ()
				}
				{
					if ($DRUGS/ns1:CODIGO_TRATAMIENTO)
					then <DrugCode>{fn:data($DRUGS/ns1:CODIGO_TRATAMIENTO)}</DrugCode>
					else ()
				}
				{
					if ($DRUGS/ns1:CODIGO_AREA_GEOGRAFICA)
					then <GeogAreaID>{fn:data($DRUGS/ns1:CODIGO_AREA_GEOGRAFICA)}</GeogAreaID>
					else ()
				}
				{
					if ($DRUGS/ns1:ID_GRUPO)
					then <GroupID>{fn:data($DRUGS/ns1:ID_GRUPO)}</GroupID>
					else ()
				}				
				{
					if ($DRUGS/ns1:ID_PROVEEDOR)
					then <ProviderID>{fn:data($DRUGS/ns1:ID_PROVEEDOR)}</ProviderID>
					else ()
				}
				{
					if ($DRUGS/ns1:CODIGO_PROVEEDOR)
					then <ProviderCode>{fn:data($DRUGS/ns1:CODIGO_PROVEEDOR)}</ProviderCode>
					else ()
				}				
				{
					if ($DRUGS/ns1:TIPO_COBERTURA)
					then <CoverageType>{fn:data($DRUGS/ns1:TIPO_COBERTURA)}</CoverageType>
					else ()
				}
				{
					if ($DRUGS/ns1:TIPO_RECLAMO)
					then <ClaimType>{fn:data($DRUGS/ns1:TIPO_RECLAMO)}</ClaimType>
					else ()
				}
				{
					if ($DRUGS/ns1:TIPO_ASIENTO)
					then <SettlementType>{fn:data($DRUGS/ns1:TIPO_ASIENTO)}</SettlementType>
					else ()
				}
				{
					if ($DRUGS/ns1:COBERTURA_RED)
					then <NetworkCoverage>{fn:data($DRUGS/ns1:COBERTURA_RED)}</NetworkCoverage>
					else ()
				}
				{
					if ($DRUGS/ns1:LIMITE_TRATAMIENTO)
					then <DrugLimit>{fn:data($DRUGS/ns1:LIMITE_TRATAMIENTO)}</DrugLimit>
					else ()
				}
				{
					if ($DRUGS/ns1:MONEDA)
					then <Currency>{fn:data($DRUGS/ns1:MONEDA)}</Currency>
					else ()
				}
				{
					if ($DRUGS/ns1:FECHA_INICIO)
					then <InsrBegin>{fn:data($DRUGS/ns1:FECHA_INICIO)}</InsrBegin>
					else ()
				}
				{
					if ($DRUGS/ns1:FECHA_FIN)
					then <InsrEnd>{fn:data($DRUGS/ns1:FECHA_FIN)}</InsrEnd>
					else ()
				}																		
			</PolicyDrug>
			}
		</Drugs>
		<Networks>
			{
			for $RED in $crearPoliza/ns1:CONDICIONES/ns1:REDES
			return 
			<Network>
				{
					if ($RED/ns1:CODIGO_POLIZA)
					then <PolicyID>{fn:data($RED/ns1:CODIGO_POLIZA)}</PolicyID>
					else ()
				}
				{
					if ($RED/ns1:CODIGO_PRODUCTO)
					then <ProductCode>{fn:data($RED/ns1:CODIGO_PRODUCTO)}</ProductCode>
					else ()
				}
				{
					if ($RED/ns1:ID_RED)
					then <NetworkID>{fn:data($RED/ns1:ID_RED)}</NetworkID>
					else ()
				}
				{
					if ($RED/ns1:CODIGO_RED)
					then <NetworkCode>{fn:data($RED/ns1:CODIGO_RED)}</NetworkCode>
					else ()
				}
				{
					if ($RED/ns1:ID_GRUPO)
					then <GroupID>{fn:data($RED/ns1:ID_GRUPO)}</GroupID>
					else ()
				}				
				{
					if ($RED/ns1:TIPO_PAQUETE)
					then <PackageType>{fn:data($RED/ns1:TIPO_PAQUETE)}</PackageType>
					else ()
				}
				{
					if ($RED/ns1:FECHA_INICIO)
					then <InsrBegin>{fn:data($RED/ns1:FECHA_INICIO)}</InsrBegin>
					else ()
				}
				{
					if ($RED/ns1:FECHA_FIN)
					then <InsrEnd>{fn:data($RED/ns1:FECHA_FIN)}</InsrEnd>
					else ()
				}																		
			</Network>
			}
		</Networks>
		<Providers>
		{
		for $PROVEEDOR in $crearPoliza/ns1:CONDICIONES/ns1:PROVEEDORES
		return 
		<Provider>
			{
				if ($PROVEEDOR/ns1:CODIGO_POLIZA)
				then <PolicyID>{fn:data($PROVEEDOR/ns1:CODIGO_POLIZA)}</PolicyID>
				else ()
			}
			{
				if ($PROVEEDOR/ns1:CODIGO_PRODUCTO)
				then <ProductCode>{fn:data($PROVEEDOR/ns1:CODIGO_PRODUCTO)}</ProductCode>
				else ()
			}
			{
				if ($PROVEEDOR/ns1:ID_PROVEEDOR)
				then <ProviderID>{fn:data($PROVEEDOR/ns1:ID_PROVEEDOR)}</ProviderID>
				else ()
			}
			{
				if ($PROVEEDOR/ns1:CODIGO_PROVEEDOR)
				then <ProviderCode>{fn:data($PROVEEDOR/ns1:CODIGO_PROVEEDOR)}</ProviderCode>
				else ()
			}
			{
				if ($PROVEEDOR/ns1:CONTRATO_ID)
				then <ContractID>{fn:data($PROVEEDOR/ns1:CONTRATO_ID)}</ContractID>
				else ()
			}
			{
				if ($PROVEEDOR/ns1:CONTRATO_NUMERO)
				then <ContractNo>{fn:data($PROVEEDOR/ns1:CONTRATO_NUMERO)}</ContractNo>
				else ()
			}
			{
				if ($PROVEEDOR/ns1:ID_GRUPO)
				then <GroupID>{fn:data($PROVEEDOR/ns1:ID_GRUPO)}</GroupID>
				else ()
			}
			{
				if ($PROVEEDOR/ns1:CODIGO_COBERTURA)
				then <CoverCode>{fn:data($PROVEEDOR/ns1:CODIGO_COBERTURA)}</CoverCode>
				else ()
			}
			{
				if ($PROVEEDOR/ns1:TIPO_PAQUETE)
				then <PackageType>{fn:data($PROVEEDOR/ns1:TIPO_PAQUETE)}</PackageType>
				else ()
			}
			{
				if ($PROVEEDOR/ns1:TIPO_ASIENTO)
				then <SettlementType>{fn:data($PROVEEDOR/ns1:TIPO_ASIENTO)}</SettlementType>
				else ()
			}
			{
				if ($PROVEEDOR/ns1:FECHA_INICIO)
				then <InsrBegin>{fn:data($PROVEEDOR/ns1:FECHA_INICIO)}</InsrBegin>
				else ()
			}
			{
				if ($PROVEEDOR/ns1:FECHA_FIN)
				then <InsrEnd>{fn:data($PROVEEDOR/ns1:FECHA_FIN)}</InsrEnd>
				else ()
			}
		</Provider>
		}
		</Providers>		
     </InsuranceConditions>
    </RegisterApplicationRq>
};

local:func($crearPoliza)
