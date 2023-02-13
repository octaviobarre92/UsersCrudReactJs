xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://pa.sura.insis.com/crearpolizamc";
(:: import schema at "../../../Dat_EmitirPolizaMC/Resources/NXSD/PolizaMC_RQ.xsd" ::)
declare namespace ns1="http://www.sura.com/BssEmisionMC";
(:: import schema at "../../../ComponentesComunes/XSD_Externos/BssEmisionMC.xsd" ::)

declare variable $EmisionMC as element() (:: schema-element(ns1:EmisionMC) ::) external;

declare function local:func($EmisionMC as element() (:: schema-element(ns1:EmisionMC) ::)) as element() (:: schema-element(ns2:RegistrarPolizaMC) ::) {
    <ns2:RegistrarPolizaMC>
        <ns2:CABECERA>
            <ns2:CODIGO_OPERACION>{fn:data($EmisionMC/ns1:CABECERA/ns1:CODIGO_OPERACION)}</ns2:CODIGO_OPERACION>
            <ns2:FECHA_PROCESAMIENTO>{fn:data($EmisionMC/ns1:CABECERA/ns1:FECHA_PROCESAMIENTO)}</ns2:FECHA_PROCESAMIENTO>
            <ns2:FECHA_TRANSACCION>{fn:data($EmisionMC/ns1:CABECERA/ns1:FECHA_TRANSACCION)}</ns2:FECHA_TRANSACCION>
            <ns2:ID_TRANSACCION_OSB>{fn:data($EmisionMC/ns1:CABECERA/ns1:ID_TRANSACCION_OSB)}</ns2:ID_TRANSACCION_OSB>
            <ns2:SISTEMA_DESTINO>{fn:data($EmisionMC/ns1:CABECERA/ns1:SISTEMA_DESTINO)}</ns2:SISTEMA_DESTINO>
            <ns2:SISTEMA_ORIGEN>{fn:data($EmisionMC/ns1:CABECERA/ns1:SISTEMA_ORIGEN)}</ns2:SISTEMA_ORIGEN>
        </ns2:CABECERA>
        <ns2:CLIENTE>
            <ns2:PERSONA>
                <ns2:PERSONA_NATURAL>
                    <ns2:NOMBRE>{fn:concat($EmisionMC/ns1:CONTRATANTE/ns1:NOMBRE, " ", $EmisionMC/ns1:CONTRATANTE/ns1:SEGUNDO_NOMBRE)}</ns2:NOMBRE>
                    <ns2:PRIMER_APELLIDO>{fn:data($EmisionMC/ns1:CONTRATANTE/ns1:APELLIDO)}</ns2:PRIMER_APELLIDO>
                    <ns2:SEGUNDO_APELLIDO>{fn:data($EmisionMC/ns1:CONTRATANTE/ns1:SEGUNDO_APELLIDO)}</ns2:SEGUNDO_APELLIDO>
                    <ns2:IDENTIFICACION>{fn:data($EmisionMC/ns1:CONTRATANTE/ns1:NUMERO_IDENTIFICACION)}</ns2:IDENTIFICACION>
                    <ns2:SEXO>{fn:data($EmisionMC/ns1:CONTRATANTE/ns1:SEXO)}</ns2:SEXO>
                    <ns2:FECHA_DE_NACIMIENTO>{fn:data($EmisionMC/ns1:CONTRATANTE/ns1:FECHA_NACIMIENTO)}</ns2:FECHA_DE_NACIMIENTO>
                    <ns2:ESTADO_CIVIL>{fn:data($EmisionMC/ns1:CONTRATANTE/ns1:ESTADO_CIVIL)}</ns2:ESTADO_CIVIL>
                </ns2:PERSONA_NATURAL>
                <ns2:TIPO_PERSONA></ns2:TIPO_PERSONA>
                <ns2:NACIONALIDAD>{fn:data($EmisionMC/ns1:CONTRATANTE/ns1:NACIONALIDAD)}</ns2:NACIONALIDAD>
                <ns2:DIRECCIONES>
                    <ns2:CODIGO_PAIS>{fn:data($EmisionMC/ns1:CONTRATANTE/ns1:DIRECCIONES/ns1:COD_PAIS)}</ns2:CODIGO_PAIS>
                    <ns2:CODIGO_ESTADO>{fn:data($EmisionMC/ns1:CONTRATANTE/ns1:DIRECCIONES/ns1:COD_PROVINCIA)}</ns2:CODIGO_ESTADO>
                    <ns2:BARRIO>{fn:data($EmisionMC/ns1:CONTRATANTE/ns1:DIRECCIONES/ns1:URBANIZACION)}</ns2:BARRIO>
                    <ns2:CALLE_AVENIDA>{fn:data($EmisionMC/ns1:CONTRATANTE/ns1:DIRECCIONES/ns1:CALLE)}</ns2:CALLE_AVENIDA>
                    <ns2:APTO_CASA>{fn:data($EmisionMC/ns1:CONTRATANTE/ns1:DIRECCIONES/ns1:CASA)}</ns2:APTO_CASA>
                    <ns2:DIRECCION>{fn:data($EmisionMC/ns1:CONTRATANTE/ns1:DIRECCIONES/ns1:DIRECCION)}</ns2:DIRECCION>
                    <ns2:TIPO_DIRECCION>{fn:data($EmisionMC/ns1:CONTRATANTE/ns1:DIRECCIONES/ns1:TIPO)}</ns2:TIPO_DIRECCION>
                    <ns2:TELEFONO>{fn:data($EmisionMC/ns1:CONTRATANTE/ns1:DIRECCIONES/ns1:TELEFONO)}</ns2:TELEFONO>
                    <ns2:EMAIL>{fn:data($EmisionMC/ns1:CONTRATANTE/ns1:DIRECCIONES/ns1:EMAIL)}</ns2:EMAIL>
                </ns2:DIRECCIONES>
            </ns2:PERSONA>
        </ns2:CLIENTE>
        <ns2:POLIZAS>
            {
                for $BENEFICIARIO in $EmisionMC/ns1:CONTRATANTE/ns1:BENEFICIARIO
                return 
                <ns2:PROPIETARIOS>
                    <ns2:PERSONA>
                        <ns2:PERSONA_NATURAL>
                            <ns2:NOMBRE>{fn:data($BENEFICIARIO/ns1:NOMBRE)}</ns2:NOMBRE>
                            <ns2:PRIMER_APELLIDO>{fn:data($BENEFICIARIO/ns1:APELLIDO)}</ns2:PRIMER_APELLIDO>
                            <ns2:IDENTIFICACION>{fn:data($BENEFICIARIO/ns1:NUMERO_IDENTIFICACION)}</ns2:IDENTIFICACION>
                            <ns2:SEXO>{fn:data($BENEFICIARIO/ns1:SEXO)}</ns2:SEXO>
                            <ns2:FECHA_DE_NACIMIENTO>{fn:data($BENEFICIARIO/ns1:FECHA_NACIMIENTO)}</ns2:FECHA_DE_NACIMIENTO>
                            <ns2:ESTADO_CIVIL>{fn:data($BENEFICIARIO/ns1:ESTADO_CIVIL)}</ns2:ESTADO_CIVIL>
                        </ns2:PERSONA_NATURAL>
                        <ns2:TIPO_PERSONA>{fn:data($BENEFICIARIO/ns1:TIPO_PERSONA)}</ns2:TIPO_PERSONA>                        
                    </ns2:PERSONA>
                    <ns2:PORCENTAJE>{fn:data($BENEFICIARIO/ns1:PORCENTAJE_BENEFICIARIO)}</ns2:PORCENTAJE>
                    <ns2:ADMINISTRADOR_FIDUCIARIO>{fn:data($BENEFICIARIO/ns1:ADMINISTRADOR_FIDUCIARIO)}</ns2:ADMINISTRADOR_FIDUCIARIO>
                    <ns2:JERARQUIA>{fn:data($BENEFICIARIO/ns1:JERARQUIA)}</ns2:JERARQUIA>
                    <ns2:RELACION>{fn:data($BENEFICIARIO/ns1:PARENTESCO)}</ns2:RELACION>
                </ns2:PROPIETARIOS>
            }
            {
                for $OBJETO_ASEGURADO in $EmisionMC/ns1:OBJETO_ASEGURADO
                return 
                <ns2:OBJETO_ASEGURADO>
                    <ns2:PERSONA_ASEGURADA>
                        <ns2:PERSONA>
                            <ns2:PERSONA_NATURAL>
                                <ns2:NOMBRE>{fn:concat($OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:NOMBRE, $OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:SEGUNDO_NOMBRE)}</ns2:NOMBRE>
                                <ns2:PRIMER_APELLIDO>{fn:data($OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:APELLIDO)}</ns2:PRIMER_APELLIDO>
                                <ns2:SEGUNDO_APELLIDO>{fn:data($OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:SEGUNDO_APELLIDO)}</ns2:SEGUNDO_APELLIDO>
                                <ns2:IDENTIFICACION>{fn:data($OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:NUMERO_IDENTIFICACION)}</ns2:IDENTIFICACION>
                                <ns2:SEXO>{fn:data($OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:SEXO)}</ns2:SEXO>
                                <ns2:FECHA_DE_NACIMIENTO>{fn:data($OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:FECHA_NACIMIENTO)}</ns2:FECHA_DE_NACIMIENTO>                                
                            </ns2:PERSONA_NATURAL>
                            <ns2:TIPO_PERSONA></ns2:TIPO_PERSONA>
                            {
                                for $DIRECCIONES in $OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:DIRECCIONES
                                return 
                                <ns2:DIRECCIONES>
                                    <ns2:NOMBRE_PAIS></ns2:NOMBRE_PAIS>
                                    <ns2:CODIGO_PAIS>{fn:data($DIRECCIONES/ns1:COD_PAIS)}</ns2:CODIGO_PAIS>
                                    <ns2:CODIGO_ESTADO>{fn:data($DIRECCIONES/ns1:COD_PROVINCIA)}</ns2:CODIGO_ESTADO>
                                    <ns2:CODIGO_REGION>{fn:data($DIRECCIONES/ns1:COD_DISTRITO)}</ns2:CODIGO_REGION>
                                    <ns2:CODIGO_CIUDAD>{fn:data($DIRECCIONES/ns1:COD_CORREGIMIENTO)}</ns2:CODIGO_CIUDAD>
                                    <ns2:BARRIO>{fn:data($DIRECCIONES/ns1:URBANIZACION)}</ns2:BARRIO>
                                    <ns2:CALLE_AVENIDA>{fn:data($DIRECCIONES/ns1:CALLE)}</ns2:CALLE_AVENIDA>
                                    <ns2:APTO_CASA>{fn:data($DIRECCIONES/ns1:CASA)}</ns2:APTO_CASA>
                                    <ns2:DIRECCION>{fn:data($DIRECCIONES/ns1:DIRECCION)}</ns2:DIRECCION>
                                    <ns2:TELEFONO>{fn:data($DIRECCIONES/ns1:TELEFONO)}</ns2:TELEFONO>
                                    <ns2:EMAIL>{fn:data($DIRECCIONES/ns1:EMAIL)}</ns2:EMAIL>
                                </ns2:DIRECCIONES>
                            }
                        </ns2:PERSONA>
                    </ns2:PERSONA_ASEGURADA>
                </ns2:OBJETO_ASEGURADO>
            }
            <ns2:MONTO_ASEGURADO>{fn:data($EmisionMC/ns1:POLIZA/ns1:SUMA_ASEGURADA)}</ns2:MONTO_ASEGURADO>
            <ns2:FECHA_INICIO>{fn:data($EmisionMC/ns1:POLIZA/ns1:VIGENCIA_DESDE)}</ns2:FECHA_INICIO>
            <ns2:FECHA_FIN>{fn:data($EmisionMC/ns1:POLIZA/ns1:VIGENCIA_HASTA)}</ns2:FECHA_FIN>
            <ns2:DURACION_PAGOS>{fn:data($EmisionMC/ns1:POLIZA/ns1:DURACION)}</ns2:DURACION_PAGOS>
            <ns2:OBSERVACION>{fn:data($EmisionMC/ns1:POLIZA/ns1:OBSERVACION)}</ns2:OBSERVACION>
            <ns2:CLASE>{fn:data($EmisionMC/ns1:POLIZA/ns1:CLASE)}</ns2:CLASE>
            <ns2:CONDUCTO>{fn:data($EmisionMC/ns1:POLIZA/ns1:CONDUCTO)}</ns2:CONDUCTO>
            <ns2:USUARIO>{fn:data($EmisionMC/ns1:POLIZA/ns1:USUARIO)}</ns2:USUARIO>
            <ns2:PLAN>{fn:data($EmisionMC/ns1:POLIZA/ns1:PLAN)}</ns2:PLAN>
            <ns2:FORMA_PAGO>{fn:data($EmisionMC/ns1:POLIZA/ns1:FORMA_PAGO)}</ns2:FORMA_PAGO>
            <ns2:OBSERVACION_UNIDAD>{fn:data($EmisionMC/ns1:POLIZA/ns1:OBSERVACION_UNIDAD)}</ns2:OBSERVACION_UNIDAD>
        </ns2:POLIZAS>
    </ns2:RegistrarPolizaMC>
};

local:func($EmisionMC)
