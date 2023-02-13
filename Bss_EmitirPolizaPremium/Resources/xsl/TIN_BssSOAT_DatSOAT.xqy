xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://pa.sura.insis.com/crearpoliza";
(:: import schema at "../../../Dat_EmitirPolizaSOAT/Resources/NXSD/Emitir_SOAT_RQ.xsd" ::)
declare namespace ns1="http://www.sura.com/BssEmisionMC";
(:: import schema at "../../../ComponentesComunes/XSD_Externos/BssEmisionSOAT.xsd" ::)

declare variable $rqPolizaSOAT as element() (:: schema-element(ns1:EmisionSOAT) ::) external;

declare function local:func($rqPolizaSOAT as element() (:: schema-element(ns1:EmisionSOAT) ::)) as element() (:: schema-element(ns2:RegistrarPolizaMC) ::) {
    <ns2:RegistrarPolizaMC>
        <ns2:CABECERA>
            <ns2:CODIGO_OPERACION>{fn:data($rqPolizaSOAT/ns1:CABECERA/ns1:CODIGO_OPERACION)}</ns2:CODIGO_OPERACION>
            <ns2:FECHA_PROCESAMIENTO>{fn:data($rqPolizaSOAT/ns1:CABECERA/ns1:FECHA_PROCESAMIENTO)}</ns2:FECHA_PROCESAMIENTO>
            <ns2:FECHA_TRANSACCION>{fn:data($rqPolizaSOAT/ns1:CABECERA/ns1:FECHA_TRANSACCION)}</ns2:FECHA_TRANSACCION>
            <ns2:ID_TRANSACCION_OSB>{fn:data($rqPolizaSOAT/ns1:CABECERA/ns1:ID_TRANSACCION_OSB)}</ns2:ID_TRANSACCION_OSB>
            <ns2:SISTEMA_DESTINO>{fn:data($rqPolizaSOAT/ns1:CABECERA/ns1:SISTEMA_DESTINO)}</ns2:SISTEMA_DESTINO>
            <ns2:SISTEMA_ORIGEN>{fn:data($rqPolizaSOAT/ns1:CABECERA/ns1:SISTEMA_ORIGEN)}</ns2:SISTEMA_ORIGEN></ns2:CABECERA>
        <ns2:CLIENTE>
            <ns2:PERSONA>
                <ns2:PERSONA_NATURAL>
                    <ns2:NOMBRE>{fn:concat($rqPolizaSOAT/ns1:CONTRATANTE/ns1:NOMBRE, " ", $rqPolizaSOAT/ns1:CONTRATANTE/ns1:SEGUNDO_NOMBRE)}</ns2:NOMBRE>
                    <ns2:PRIMER_APELLIDO>{fn:data($rqPolizaSOAT/ns1:CONTRATANTE/ns1:APELLIDO)}</ns2:PRIMER_APELLIDO>
                    <ns2:SEGUNDO_APELLIDO>{fn:data($rqPolizaSOAT/ns1:CONTRATANTE/ns1:SEGUNDO_APELLIDO)}</ns2:SEGUNDO_APELLIDO>
                    <ns2:IDENTIFICACION>{fn:data($rqPolizaSOAT/ns1:CONTRATANTE/ns1:NUMERO_IDENTIFICACION)}</ns2:IDENTIFICACION>
                    <ns2:SEXO>{fn:data($rqPolizaSOAT/ns1:CONTRATANTE/ns1:SEXO)}</ns2:SEXO>
                    <ns2:FECHA_DE_NACIMIENTO>{fn:data($rqPolizaSOAT/ns1:CONTRATANTE/ns1:FECHA_NACIMIENTO)}</ns2:FECHA_DE_NACIMIENTO>
                    <ns2:ESTADO_CIVIL>{fn:data($rqPolizaSOAT/ns1:CONTRATANTE/ns1:ESTADO_CIVIL)}</ns2:ESTADO_CIVIL>
                </ns2:PERSONA_NATURAL>
                <ns2:NACIONALIDAD>{fn:data($rqPolizaSOAT/ns1:CONTRATANTE/ns1:NACIONALIDAD)}</ns2:NACIONALIDAD>
                <ns2:DIRECCIONES>
                    <ns2:CODIGO_PAIS>{fn:data($rqPolizaSOAT/ns1:CONTRATANTE/ns1:DIRECCIONES/ns1:COD_PAIS)}</ns2:CODIGO_PAIS>
                    <ns2:CODIGO_ESTADO>{fn:data($rqPolizaSOAT/ns1:CONTRATANTE/ns1:DIRECCIONES/ns1:COD_PROVINCIA)}</ns2:CODIGO_ESTADO>
                    <ns2:BARRIO>{fn:data($rqPolizaSOAT/ns1:CONTRATANTE/ns1:DIRECCIONES/ns1:URBANIZACION)}</ns2:BARRIO>
                    <ns2:CALLE_AVENIDA>{fn:data($rqPolizaSOAT/ns1:CONTRATANTE/ns1:DIRECCIONES/ns1:CALLE)}</ns2:CALLE_AVENIDA>
                    <ns2:APTO_CASA>{fn:data($rqPolizaSOAT/ns1:CONTRATANTE/ns1:DIRECCIONES/ns1:CASA)}</ns2:APTO_CASA>
                    <ns2:DIRECCION>{fn:data($rqPolizaSOAT/ns1:CONTRATANTE/ns1:DIRECCIONES/ns1:DIRECCION)}</ns2:DIRECCION>
                    <ns2:TIPO_DIRECCION>{fn:data($rqPolizaSOAT/ns1:CONTRATANTE/ns1:DIRECCIONES/ns1:TIPO)}</ns2:TIPO_DIRECCION>
                    <ns2:TELEFONO>{fn:data($rqPolizaSOAT/ns1:CONTRATANTE/ns1:DIRECCIONES/ns1:TELEFONO)}</ns2:TELEFONO>
                    <ns2:EMAIL>{fn:data($rqPolizaSOAT/ns1:CONTRATANTE/ns1:DIRECCIONES/ns1:EMAIL)}</ns2:EMAIL>
                </ns2:DIRECCIONES>
            </ns2:PERSONA>
        </ns2:CLIENTE>
        <ns2:POLIZAS>
            <ns2:OBJETO_ASEGURADO>
                <ns2:AUTO>
                    {
                        if ($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:TIPO_AUTO)
                        then <ns2:TIPO_AUTO>{fn:data($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:TIPO_AUTO)}</ns2:TIPO_AUTO>
                        else ()
                    }
                    {
                        if ($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:SUBTIPO_AUTO)
                        then <ns2:SUBTIPO_AUTO>{fn:data($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:SUBTIPO_AUTO)}</ns2:SUBTIPO_AUTO>
                        else ()
                    }
                    {
                        if ($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:NUMERO_PLACA)
                        then <ns2:NUMERO_PLACA>{fn:data($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:NUMERO_PLACA)}</ns2:NUMERO_PLACA>
                        else ()
                    }
                    {
                        if ($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:MARCA)
                        then <ns2:MARCA>{fn:data($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:MARCA)}</ns2:MARCA>
                        else ()
                    }
                    {
                        if ($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:MODELO)
                        then <ns2:MODELO>{fn:data($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:MODELO)}</ns2:MODELO>
                        else ()
                    }
                    {
                        if ($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:NO_MOTOR)
                        then <ns2:NO_MOTOR>{fn:data($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:NO_MOTOR)}</ns2:NO_MOTOR>
                        else ()
                    }
                    {
                        if ($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:CHASIS)
                        then <ns2:CHASIS>{fn:data($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:CHASIS)}</ns2:CHASIS>
                        else ()
                    }
                    {
                        if ($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:ACTIVIDAD)
                        then <ns2:ACTIVIDAD>{fn:data($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:ACTIVIDAD)}</ns2:ACTIVIDAD>
                        else ()
                    }
                    {
                        if ($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:TONELAJE)
                        then <ns2:TONELAJE>{fn:data($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:TONELAJE)}</ns2:TONELAJE>
                        else ()
                    }
                    {
                        if ($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:NUMERO_ASIENTOS)
                        then <ns2:NUMERO_ASIENTOS>{fn:data($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:NUMERO_ASIENTOS)}</ns2:NUMERO_ASIENTOS>
                        else ()
                    }
                    {
                        if ($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:NUMERO_PUERTAS)
                        then <ns2:NUMERO_PUERTAS>{fn:data($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:NUMERO_PUERTAS)}</ns2:NUMERO_PUERTAS>
                        else ()
                    }
                    {
                        if ($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:TIPO_PINTURA)
                        then <ns2:TIPO_PINTURA>{fn:data($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:TIPO_PINTURA)}</ns2:TIPO_PINTURA>
                        else ()
                    }
                    {
                        if ($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:ANNIO)
                        then <ns2:ANNIO>{fn:data($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:ANNIO)}</ns2:ANNIO>
                        else ()
                    }
                    {
                        if ($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:CANTIDAD_ANNIO)
                        then <ns2:CANTIDAD_ANNIO>{fn:data($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:CANTIDAD_ANNIO)}</ns2:CANTIDAD_ANNIO>
                        else ()
                    }
                    {
                        if ($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:COLOR)
                        then <ns2:COLOR>{fn:data($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:COLOR)}</ns2:COLOR>
                        else ()
                    }
                    {
                        if ($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:REGISTRO)
                        then <ns2:REGISTRO>{fn:data($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:REGISTRO)}</ns2:REGISTRO>
                        else ()
                    }
                    {
                        if ($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:CABALLOS_FUERZA)
                        then <ns2:CABALLOS_FUERZA>{fn:data($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:CABALLOS_FUERZA)}</ns2:CABALLOS_FUERZA>
                        else ()
                    }
                    {
                        if ($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:TONELAJE_CARGA)
                        then <ns2:TONELAJE_CARGA>{fn:data($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:TONELAJE_CARGA)}</ns2:TONELAJE_CARGA>
                        else ()
                    }
                    {
                        if ($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:TIPO_MOTOR)
                        then <ns2:TIPO_MOTOR>{fn:data($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:TIPO_MOTOR)}</ns2:TIPO_MOTOR>
                        else ()
                    }
                    {
                        if ($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:TIPO_COMBUSTIBLE)
                        then <ns2:TIPO_COMBUSTIBLE>{fn:data($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:TIPO_COMBUSTIBLE)}</ns2:TIPO_COMBUSTIBLE>
                        else ()
                    }
                    {
                        if ($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:TIPO_CONDUCTOR)
                        then <ns2:TIPO_CONDUCTOR>{fn:data($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:TIPO_CONDUCTOR)}</ns2:TIPO_CONDUCTOR>
                        else ()
                    }
                    {
                        if ($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:TIPO_CARROCERIA)
                        then <ns2:TIPO_CARROCERIA>{fn:data($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:TIPO_CARROCERIA)}</ns2:TIPO_CARROCERIA>
                        else ()
                    }
                    {
                        if ($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:COLOR_VENTANAS)
                        then <ns2:COLOR_VENTANAS>{fn:data($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:COLOR_VENTANAS)}</ns2:COLOR_VENTANAS>
                        else ()
                    }
                    {
                        if ($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:DESCRIPCION)
                        then <ns2:DESCRIPCION>{fn:data($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:DESCRIPCION)}</ns2:DESCRIPCION>
                        else ()
                    }
                    {
                        if ($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:ACREEDOR)
                        then <ns2:ACREEDOR>{fn:data($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:ACREEDOR)}</ns2:ACREEDOR>
                        else ()
                    }
                    {
                        if ($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:ZONA_CIRCULACION)
                        then <ns2:ZONA_CIRCULACION>{fn:data($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:ZONA_CIRCULACION)}</ns2:ZONA_CIRCULACION>
                        else ()
                    }
                    {
                        if ($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:ACCESORIOS)
                        then <ns2:ACCESORIOS>{fn:data($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:ACCESORIOS)}</ns2:ACCESORIOS>
                        else ()
                    }
                    {
                        if ($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:MONTO_ASEGURADO)
                        then <ns2:MONTO_ASEGURADO>{fn:data($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:MONTO_ASEGURADO)}</ns2:MONTO_ASEGURADO>
                        else ()
                    }
                    {
                        if ($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:FORMA_PAGO)
                        then <ns2:FORMA_PAGO>{fn:data($rqPolizaSOAT/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:FORMA_PAGO)}</ns2:FORMA_PAGO>
                        else ()
                    }</ns2:AUTO>
            </ns2:OBJETO_ASEGURADO>
            <ns2:MONTO_ASEGURADO>{fn:data($rqPolizaSOAT/ns1:POLIZA/ns1:SUMA_ASEGURADA)}</ns2:MONTO_ASEGURADO>
            <ns2:FECHA_INICIO>{fn:data($rqPolizaSOAT/ns1:POLIZA/ns1:VIGENCIA_DESDE)}</ns2:FECHA_INICIO>
            <ns2:FECHA_FIN>{fn:data($rqPolizaSOAT/ns1:POLIZA/ns1:VIGENCIA_HASTA)}</ns2:FECHA_FIN>
            <ns2:DURACION_PAGOS>{fn:data($rqPolizaSOAT/ns1:POLIZA/ns1:DURACION)}</ns2:DURACION_PAGOS>
            <ns2:OBSERVACION>{fn:data($rqPolizaSOAT/ns1:POLIZA/ns1:OBSERVACION)}</ns2:OBSERVACION>
            <ns2:CLASE>{fn:data($rqPolizaSOAT/ns1:POLIZA/ns1:CLASE)}</ns2:CLASE>
            <ns2:CONDUCTO>{fn:data($rqPolizaSOAT/ns1:POLIZA/ns1:CONDUCTO)}</ns2:CONDUCTO>
            <ns2:USUARIO>{fn:data($rqPolizaSOAT/ns1:POLIZA/ns1:USUARIO)}</ns2:USUARIO>
            <ns2:PLAN>{fn:data($rqPolizaSOAT/ns1:POLIZA/ns1:PLAN)}</ns2:PLAN>
        </ns2:POLIZAS>
    </ns2:RegistrarPolizaMC>
};

local:func($rqPolizaSOAT)
