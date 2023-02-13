xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://pa.sura.insis.com/crearpoliza";
(:: import schema at "../NXSD/Emitir_SOAT_RQ.xsd" ::)
declare namespace ns2="http://xmlns.oracle.com/pcbpel/adapter/db/sp/EmitirPolizaSOAT";
(:: import schema at "../DBAdapter/EmitirPolizaSOAT_sp.xsd" ::)

declare variable $PolizaSOAT as element() (:: schema-element(ns1:RegistrarPolizaMC) ::) external;

declare function local:func($PolizaSOAT as element() (:: schema-element(ns1:RegistrarPolizaMC) ::)) as element() (:: schema-element(ns2:InputParameters) ::) {
    <ns2:InputParameters>
        {
            if ($PolizaSOAT/ns1:POLIZAS/ns1:PLAN)
            then <ns2:P_PLAN>{fn:data($PolizaSOAT/ns1:POLIZAS/ns1:PLAN)}</ns2:P_PLAN>
            else ()
        }
        {
            if ($PolizaSOAT/ns1:CLIENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:IDENTIFICACION)
            then <ns2:P_ASEGURADO>{fn:data($PolizaSOAT/ns1:CLIENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:IDENTIFICACION)}</ns2:P_ASEGURADO>
            else ()
        }
        {
            if ($PolizaSOAT/ns1:POLIZAS/ns1:FECHA_INICIO)
            then <ns2:P_DESDE>{fn:data($PolizaSOAT/ns1:POLIZAS/ns1:FECHA_INICIO)}</ns2:P_DESDE>
            else ()
        }
        {
            if ($PolizaSOAT/ns1:POLIZAS/ns1:FECHA_FIN)
            then <ns2:P_HASTA>{fn:data($PolizaSOAT/ns1:POLIZAS/ns1:FECHA_FIN)}</ns2:P_HASTA>
            else ()
        }
        {
            if ($PolizaSOAT/ns1:POLIZAS/ns1:OBSERVACION)
            then <ns2:P_OBSERVACION>{fn:data($PolizaSOAT/ns1:POLIZAS/ns1:OBSERVACION)}</ns2:P_OBSERVACION>
            else ()
        }
        {
            if ($PolizaSOAT/ns1:POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:MONTO_ASEGURADO)
            then <ns2:P_VALOR>{fn:data($PolizaSOAT/ns1:POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:MONTO_ASEGURADO)}</ns2:P_VALOR>
            else ()
        }
        {
            if ($PolizaSOAT/ns1:POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:ANNIO)
            then <ns2:P_ANO>{fn:data($PolizaSOAT/ns1:POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:ANNIO)}</ns2:P_ANO>
            else ()
        }
        {
            if ($PolizaSOAT/ns1:POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:ACTIVIDAD)
            then <ns2:P_USO>{fn:data($PolizaSOAT/ns1:POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:ACTIVIDAD)}</ns2:P_USO>
            else ()
        }
        {
            if ($PolizaSOAT/ns1:POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:NUMERO_ASIENTOS)
            then <ns2:P_CAPACIDAD>{fn:data($PolizaSOAT/ns1:POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:NUMERO_ASIENTOS)}</ns2:P_CAPACIDAD>
            else ()
        }
        {
            if ($PolizaSOAT/ns1:POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:TONELAJE)
            then <ns2:P_PESO>{fn:data($PolizaSOAT/ns1:POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:TONELAJE)}</ns2:P_PESO>
            else ()
        }
        {
            if ($PolizaSOAT/ns1:POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:MARCA)
            then <ns2:P_MARCA>{fn:data($PolizaSOAT/ns1:POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:MARCA)}</ns2:P_MARCA>
            else ()
        }
        {
            if ($PolizaSOAT/ns1:POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:MODELO)
            then <ns2:P_MODELO>{fn:data($PolizaSOAT/ns1:POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:MODELO)}</ns2:P_MODELO>
            else ()
        }
        {
            if ($PolizaSOAT/ns1:POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:COLOR)
            then <ns2:P_COLOR>{fn:data($PolizaSOAT/ns1:POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:COLOR)}</ns2:P_COLOR>
            else ()
        }
        {
            if ($PolizaSOAT/ns1:POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:NUMERO_PLACA)
            then <ns2:P_PLACA>{fn:data($PolizaSOAT/ns1:POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:NUMERO_PLACA)}</ns2:P_PLACA>
            else ()
        }
        {
            if ($PolizaSOAT/ns1:POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:NO_MOTOR)
            then <ns2:P_MOTOR>{fn:data($PolizaSOAT/ns1:POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:NO_MOTOR)}</ns2:P_MOTOR>
            else ()
        }
        {
            if ($PolizaSOAT/ns1:POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:CHASIS)
            then <ns2:P_CHASIS>{fn:data($PolizaSOAT/ns1:POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:CHASIS)}</ns2:P_CHASIS>
            else ()
        }
        {
            if ($PolizaSOAT/ns1:POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:ACCESORIOS)
            then <ns2:P_ACCESORIOS>{fn:data($PolizaSOAT/ns1:POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:ACCESORIOS)}</ns2:P_ACCESORIOS>
            else ()
        }
        {
            if ($PolizaSOAT/ns1:POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:ACREEDOR)
            then <ns2:P_ACREEDOR>{fn:data($PolizaSOAT/ns1:POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:ACREEDOR)}</ns2:P_ACREEDOR>
            else ()
        }
        {
            if ($PolizaSOAT/ns1:POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:TIPO_AUTO)
            then <ns2:P_TIPO>{fn:data($PolizaSOAT/ns1:POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:TIPO_AUTO)}</ns2:P_TIPO>
            else ()
        }
        {
            if ($PolizaSOAT/ns1:POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:ZONA_CIRCULACION)
            then <ns2:P_ZONA_DE_CIRCULACION>{fn:data($PolizaSOAT/ns1:POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:ZONA_CIRCULACION)}</ns2:P_ZONA_DE_CIRCULACION>
            else ()
        }
        {
            if ($PolizaSOAT/ns1:POLIZAS/ns1:CONDUCTO)
            then <ns2:P_CONDUCTO>{fn:data($PolizaSOAT/ns1:POLIZAS/ns1:CONDUCTO)}</ns2:P_CONDUCTO>
            else ()
        }
        {
            if ($PolizaSOAT/ns1:POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:FORMA_PAGO)
            then <ns2:P_FORMA_DE_PAGO>{fn:data($PolizaSOAT/ns1:POLIZAS/ns1:OBJETO_ASEGURADO/ns1:AUTO/ns1:FORMA_PAGO)}</ns2:P_FORMA_DE_PAGO>
            else ()
        }
        {
            if ($PolizaSOAT/ns1:CLIENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:IDENTIFICACION)
            then <ns2:P_CONTRATANTE>{fn:data($PolizaSOAT/ns1:CLIENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:IDENTIFICACION)}</ns2:P_CONTRATANTE>
            else ()
        }
        {
            if ($PolizaSOAT/ns1:CLIENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:NOMBRE)
            then <ns2:P_NOMBRE_CONTRATANTE>{fn:concat($PolizaSOAT/ns1:CLIENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:NOMBRE,' ', $PolizaSOAT/ns1:CLIENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:PRIMER_APELLIDO, ' ',  fn:data($PolizaSOAT/ns1:CLIENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:SEGUNDO_APELLIDO))}</ns2:P_NOMBRE_CONTRATANTE>
            else ()
        }
        {
            if ($PolizaSOAT/ns1:CLIENTE/ns1:PERSONA/ns1:DIRECCIONES/ns1:DIRECCION)
            then <ns2:P_DIRECCION_CONTRATANTE>{fn:data($PolizaSOAT/ns1:CLIENTE/ns1:PERSONA/ns1:DIRECCIONES/ns1:DIRECCION)}</ns2:P_DIRECCION_CONTRATANTE>
            else ()
        }
        {
            if ($PolizaSOAT/ns1:CLIENTE/ns1:PERSONA/ns1:DIRECCIONES/ns1:TELEFONO)
            then <ns2:P_TELEFONO_CONTRATANTE>{fn:data($PolizaSOAT/ns1:CLIENTE/ns1:PERSONA/ns1:DIRECCIONES/ns1:TELEFONO)}</ns2:P_TELEFONO_CONTRATANTE>
            else ()
        }
        {
            if ($PolizaSOAT/ns1:CLIENTE/ns1:PERSONA/ns1:DIRECCIONES/ns1:EMAIL)
            then <ns2:P_EMAIL_CONTRATANTE>{fn:data($PolizaSOAT/ns1:CLIENTE/ns1:PERSONA/ns1:DIRECCIONES/ns1:EMAIL)}</ns2:P_EMAIL_CONTRATANTE>
            else ()
        }
        {
            if ($PolizaSOAT/ns1:POLIZAS/ns1:USUARIO)
            then <ns2:P_USUARIO>{fn:data($PolizaSOAT/ns1:POLIZAS/ns1:USUARIO)}</ns2:P_USUARIO>
            else ()
        }        
    </ns2:InputParameters>
};

local:func($PolizaSOAT)
