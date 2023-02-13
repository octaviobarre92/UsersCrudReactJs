xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://pa.sura.insis.com/crearpolizamc";
(:: import schema at "../NXSD/PolizaMC_RQ.xsd" ::)
declare namespace ns2="http://xmlns.oracle.com/pcbpel/adapter/db/sp/CrearPolizaColectivo";
(:: import schema at "../DBadapter/CrearPolizaColectivo_sp.xsd" ::)

declare variable $PolizaMC as element() (:: schema-element(ns1:RegistrarPolizaMC) ::) external;

declare function local:func($PolizaMC as element() (:: schema-element(ns1:RegistrarPolizaMC) ::)) as element() (:: schema-element(ns2:InputParameters) ::) {
    <ns2:InputParameters>
        {
            if ($PolizaMC/ns1:POLIZAS/ns1:PLAN)
            then <ns2:P_PLAN>{fn:data($PolizaMC/ns1:POLIZAS/ns1:PLAN)}</ns2:P_PLAN>
            else ()
        }
        {
            if ($PolizaMC/ns1:CLIENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:IDENTIFICACION)
            then <ns2:P_ASEGURADO>{fn:data($PolizaMC/ns1:CLIENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:IDENTIFICACION)}</ns2:P_ASEGURADO>
            else ()
        }
        {
            if ($PolizaMC/ns1:POLIZAS/ns1:FECHA_INICIO)
            then <ns2:P_DESDE>{fn:data($PolizaMC/ns1:POLIZAS/ns1:FECHA_INICIO)}</ns2:P_DESDE>
            else ()
        }
        {
            if ($PolizaMC/ns1:POLIZAS/ns1:FECHA_FIN)
            then <ns2:P_HASTA>{fn:data($PolizaMC/ns1:POLIZAS/ns1:FECHA_FIN)}</ns2:P_HASTA>
            else ()
        }
        {
            if ($PolizaMC/ns1:POLIZAS/ns1:OBSERVACION)
            then <ns2:P_OBSERVACION>{fn:data($PolizaMC/ns1:POLIZAS/ns1:OBSERVACION)}</ns2:P_OBSERVACION>
            else ()
        }
        {
            if ($PolizaMC/ns1:POLIZAS/ns1:DESCRIPCION_UNIDAD)
            then <ns2:P_DESCRIPCION_UNIDAD>{fn:data($PolizaMC/ns1:POLIZAS/ns1:DESCRIPCION_UNIDAD)}</ns2:P_DESCRIPCION_UNIDAD>
            else ()
        }
        {
            if ($PolizaMC/ns1:POLIZAS/ns1:OBSERVACION_UNIDAD)
            then <ns2:P_OBSERVACION_UNIDAD>{fn:data($PolizaMC/ns1:POLIZAS/ns1:OBSERVACION_UNIDAD)}</ns2:P_OBSERVACION_UNIDAD>
            else ()
        }
         <ns2:P_ASEGURADOS>
            {
                for $OBJETO_ASEGURADO in $PolizaMC/ns1:POLIZAS/ns1:OBJETO_ASEGURADO
                return 
                <ns2:P_ASEGURADOS_ITEM>
                    {
                        if ($OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:NOMBRE)
                        then <ns2:P_NOMBRE_ASEGURADO>{fn:data($OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:NOMBRE)}</ns2:P_NOMBRE_ASEGURADO>
                        else ()
                    }
                    {
                        if ($OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:PRIMER_APELLIDO)
                        then <ns2:P_APELLIDO_ASEGURADO>{fn:data($OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:PRIMER_APELLIDO)}</ns2:P_APELLIDO_ASEGURADO>
                        else ()
                    }
                    {
                        if ($OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:IDENTIFICACION)
                        then <ns2:P_IDENTIFICACION_ASEGURADO>{fn:data($OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:IDENTIFICACION)}</ns2:P_IDENTIFICACION_ASEGURADO>
                        else ()
                    }
                    {
                        if ($OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:FECHA_DE_NACIMIENTO)
                        then <ns2:P_FECHA_NACIMIENTO_ASEGURADO>{fn:data($OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:FECHA_DE_NACIMIENTO)}</ns2:P_FECHA_NACIMIENTO_ASEGURADO>
                        else ()
                    }
                    {
                        if ($OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:SEXO)
                        then <ns2:P_SEXO_ASEGURADO>{fn:data($OBJETO_ASEGURADO/ns1:PERSONA_ASEGURADA/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:SEXO)}</ns2:P_SEXO_ASEGURADO>
                        else ()
                    }</ns2:P_ASEGURADOS_ITEM>
            }
        </ns2:P_ASEGURADOS>
        <ns2:P_BENEFICIARIOS>
            {
                for $PROPIETARIOS in $PolizaMC/ns1:POLIZAS/ns1:PROPIETARIOS
                return 
                <ns2:P_BENEFICIARIOS_ITEM>
                    {
                        if ($PROPIETARIOS/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:NOMBRE)
                        then <ns2:P_NOMBRE_BENE>{fn:data($PROPIETARIOS/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:NOMBRE)}</ns2:P_NOMBRE_BENE>
                        else ()
                    }
                    {
                        if ($PROPIETARIOS/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:PRIMER_APELLIDO)
                        then <ns2:P_APELLIDO_BENE>{fn:data($PROPIETARIOS/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:PRIMER_APELLIDO)}</ns2:P_APELLIDO_BENE>
                        else ()
                    }
                    {
                        if ($PROPIETARIOS/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:IDENTIFICACION)
                        then <ns2:P_IDENTIFICACION_BENE>{fn:data($PROPIETARIOS/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:IDENTIFICACION)}</ns2:P_IDENTIFICACION_BENE>
                        else ()
                    }
                    {
                        if ($PROPIETARIOS/ns1:RELACION)
                        then <ns2:P_PARENTESCO_BENE>{fn:data($PROPIETARIOS/ns1:RELACION)}</ns2:P_PARENTESCO_BENE>
                        else ()
                    }
                    {
                        if ($PROPIETARIOS/ns1:PERSONA/ns1:TIPO_PERSONA)
                        then <ns2:P_TIPO_DE_PERSONA_BENE>{fn:data($PROPIETARIOS/ns1:PERSONA/ns1:TIPO_PERSONA)}</ns2:P_TIPO_DE_PERSONA_BENE>
                        else ()
                    }
                    {
                        if ($PROPIETARIOS/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:FECHA_DE_NACIMIENTO)
                        then <ns2:P_FECHA_DE_NACIMIENTO_BENE>{fn:data($PROPIETARIOS/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:FECHA_DE_NACIMIENTO)}</ns2:P_FECHA_DE_NACIMIENTO_BENE>
                        else ()
                    }
                    {
                        if ($PROPIETARIOS/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:SEXO)
                        then <ns2:P_SEXO_BENE>{fn:data($PROPIETARIOS/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:SEXO)}</ns2:P_SEXO_BENE>
                        else ()
                    }
                    {
                        if ($PROPIETARIOS/ns1:ADMINISTRADOR_FIDUCIARIO)
                        then <ns2:P_ADMINISTRADOR_FIDUCIARIO>{fn:data($PROPIETARIOS/ns1:ADMINISTRADOR_FIDUCIARIO)}</ns2:P_ADMINISTRADOR_FIDUCIARIO>
                        else ()
                    }
                    {
                        if ($PROPIETARIOS/ns1:JERARQUIA)
                        then <ns2:P_JERARQUIA>{fn:data($PROPIETARIOS/ns1:JERARQUIA)}</ns2:P_JERARQUIA>
                        else ()
                    }
                    {
                        if ($PROPIETARIOS/ns1:PORCENTAJE)
                        then <ns2:P_PORCENTAJE_BENE>{fn:data($PROPIETARIOS/ns1:PORCENTAJE)}</ns2:P_PORCENTAJE_BENE>
                        else ()
                    }</ns2:P_BENEFICIARIOS_ITEM>
            }
        </ns2:P_BENEFICIARIOS>
        {
            if ($PolizaMC/ns1:POLIZAS/ns1:MONTO_ASEGURADO)
            then <ns2:P_SUMA_ASEGURADA>{fn:data($PolizaMC/ns1:POLIZAS/ns1:MONTO_ASEGURADO)}</ns2:P_SUMA_ASEGURADA>
            else ()
        }
        {
            if ($PolizaMC/ns1:POLIZAS/ns1:CLASE)
            then <ns2:P_CLASE>{fn:data($PolizaMC/ns1:POLIZAS/ns1:CLASE)}</ns2:P_CLASE>
            else ()
        }
        {
            if ($PolizaMC/ns1:POLIZAS/ns1:DURACION_PAGOS)
            then <ns2:P_DURACION>{fn:data($PolizaMC/ns1:POLIZAS/ns1:DURACION_PAGOS)}</ns2:P_DURACION>
            else ()
        }
        {
            if ($PolizaMC/ns1:POLIZAS/ns1:CONDUCTO)
            then <ns2:P_CONDUCTO>{fn:data($PolizaMC/ns1:POLIZAS/ns1:CONDUCTO)}</ns2:P_CONDUCTO>
            else ()
        }
        {
            if ($PolizaMC/ns1:POLIZAS/ns1:FORMA_PAGO)
            then <ns2:P_FORMA_DE_PAGO>{fn:data($PolizaMC/ns1:POLIZAS/ns1:FORMA_PAGO)}</ns2:P_FORMA_DE_PAGO>
            else ()
        }
        {
            if ($PolizaMC/ns1:CLIENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:IDENTIFICACION)
            then <ns2:P_CONTRATANTE>{fn:data($PolizaMC/ns1:CLIENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:IDENTIFICACION)}</ns2:P_CONTRATANTE>
            else ()
        }
        <ns2:P_NOMBRE_CONTRATANTE>{fn:concat($PolizaMC/ns1:CLIENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:NOMBRE,' ', $PolizaMC/ns1:CLIENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:PRIMER_APELLIDO, ' ',  fn:data($PolizaMC/ns1:CLIENTE/ns1:PERSONA/ns1:PERSONA_NATURAL/ns1:SEGUNDO_APELLIDO))}</ns2:P_NOMBRE_CONTRATANTE>
        {
            if ($PolizaMC/ns1:CLIENTE/ns1:PERSONA/ns1:DIRECCIONES/ns1:DIRECCION)
            then <ns2:P_DIRECCION_CONTRATANTE>{fn:data($PolizaMC/ns1:CLIENTE/ns1:PERSONA/ns1:DIRECCIONES/ns1:DIRECCION)}</ns2:P_DIRECCION_CONTRATANTE>
            else ()
        }
        {
            if ($PolizaMC/ns1:CLIENTE/ns1:PERSONA/ns1:DIRECCIONES/ns1:TELEFONO)
            then <ns2:P_TELEFONO_CONTRATANTE>{fn:data($PolizaMC/ns1:CLIENTE/ns1:PERSONA/ns1:DIRECCIONES/ns1:TELEFONO)}</ns2:P_TELEFONO_CONTRATANTE>
            else ()
        }
        {
            if ($PolizaMC/ns1:CLIENTE/ns1:PERSONA/ns1:DIRECCIONES/ns1:EMAIL)
            then <ns2:P_EMAIL_CONTRATANTE>{fn:data($PolizaMC/ns1:CLIENTE/ns1:PERSONA/ns1:DIRECCIONES/ns1:EMAIL)}</ns2:P_EMAIL_CONTRATANTE>
            else ()
        }
        {
            if ($PolizaMC/ns1:POLIZAS/ns1:USUARIO)
            then <ns2:P_USUARIO>{fn:data($PolizaMC/ns1:POLIZAS/ns1:USUARIO)}</ns2:P_USUARIO>
            else ()
        }
    </ns2:InputParameters>
};

local:func($PolizaMC)
