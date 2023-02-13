xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://www.sura.com/ConsultarClienteInsis";
(:: import schema at "../xsd/Clientes_Premium.xsd" ::)
declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/ConsultarClientePremium";
(:: import schema at "../DBadapter/ConsultarClientePremium_sp.xsd" ::)

declare variable $ClienteBD as element() (:: schema-element(ns1:OutputParameters) ::) external;

declare function local:func($ClienteBD as element() (:: schema-element(ns1:OutputParameters) ::)) as element() (:: schema-element(ns2:OBJETO_CLIENTES) ::) {
    <ns2:OBJETO_CLIENTES>
        {
            for $RFC_CLIENTES_Row in $ClienteBD/ns1:RFC_CLIENTES/ns1:RFC_CLIENTES_Row
            return 
            <ns2:CLIENTE>
                <ns2:NOMBRE_COMPLETO>{fn:data($RFC_CLIENTES_Row/ns1:NOMBRE_COMPLETO)}</ns2:NOMBRE_COMPLETO>
                <ns2:APELLIDO>{fn:data($RFC_CLIENTES_Row/ns1:APELLIDO)}</ns2:APELLIDO>
                <ns2:NOMBRE>{fn:data($RFC_CLIENTES_Row/ns1:NOMBRE)}</ns2:NOMBRE>
                <ns2:TIPO>{fn:data($RFC_CLIENTES_Row/ns1:TIPO)}</ns2:TIPO>
                <ns2:IDENTIFICACION>{fn:data($RFC_CLIENTES_Row/ns1:ASEGURADO)}</ns2:IDENTIFICACION>
                <ns2:EDAD>{fn:data($RFC_CLIENTES_Row/ns1:EDAD)}</ns2:EDAD>
                <ns2:SEXO>{fn:data($RFC_CLIENTES_Row/ns1:SEXO)}</ns2:SEXO>
                <ns2:FECHA_DE_NACIMIENTO>{fn:data($RFC_CLIENTES_Row/ns1:FECHA_DE_NACIMIENTO)}</ns2:FECHA_DE_NACIMIENTO>
                <ns2:ESTADO_CIVIL>{fn:data($RFC_CLIENTES_Row/ns1:ESTADO_CIVIL)}</ns2:ESTADO_CIVIL>
                <ns2:TELEFONO>{fn:data($RFC_CLIENTES_Row/ns1:TELEFONO)}</ns2:TELEFONO>
                <ns2:CELULAR>{fn:data($RFC_CLIENTES_Row/ns1:CELULAR)}</ns2:CELULAR>
                <ns2:EMAIL>{fn:data($RFC_CLIENTES_Row/ns1:EMAIL)}</ns2:EMAIL></ns2:CLIENTE>
        }
    </ns2:OBJETO_CLIENTES>
};

local:func($ClienteBD)
