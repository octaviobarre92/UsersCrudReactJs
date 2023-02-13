xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://sura.com.pa/crearDatosBasicosSiniestro/";
(:: import schema at "../../../ComponentesComunes/WSDL_Externos/crearDatosBasicosSiniestro_v1.4.wsdl" ::)
declare namespace ns2="http://www.sura.com.pa/Siniestro";
(:: import schema at "../nxsd/RqCrearDatosBasicosSiniestro.xsd" ::)

declare variable $idEnvio as xs:string external;
declare variable $codCliente as xs:string external;
declare variable $codSucursal as xs:string external;
declare variable $fechaEnvio as xs:string external;
declare variable $CrearSiniestro as element() (:: schema-element(ns1:CrearDatosBasicosSiniestro) ::) external;

declare function local:func($codCliente as xs:string, 
                            $fechaEnvio as xs:string,
                            $CrearSiniestro as element() (:: schema-element(ns1:CrearDatosBasicosSiniestro) ::)) as element() (:: schema-element(ns2:OBJ_SINIESTRO) ::) {
    <ns2:OBJ_SINIESTRO>
        {
        if ($CrearSiniestro/idEnvio) then
          <ns2:IdEnvio>{fn:data($CrearSiniestro/idEnvio)}</ns2:IdEnvio>
        else
          <ns2:IdEnvio>123</ns2:IdEnvio>
        }
        <ns2:FechaEnvio>{fn:data($fechaEnvio)}</ns2:FechaEnvio>
        <ns2:CodigoCliente>{fn:data($codCliente)}</ns2:CodigoCliente>
        {
        if ($CrearSiniestro/codigoSucursalAseguradora) then
          <ns2:CodigoSucursalAseguradora>{fn:data($CrearSiniestro/codigoSucursalAseguradora)}</ns2:CodigoSucursalAseguradora>
        else
          <ns2:CodigoSucursalAseguradora>8011</ns2:CodigoSucursalAseguradora>
        }        
        <ns2:IdPais>PA</ns2:IdPais>
        <ns2:NumeroSiniestro>{fn:data($CrearSiniestro/numSiniestro)}</ns2:NumeroSiniestro>
        <ns2:IdProducto>{fn:data($CrearSiniestro/idProducto)}</ns2:IdProducto>
        <ns2:PolizaCliente>{fn:data($CrearSiniestro/polizaCliente)}</ns2:PolizaCliente>
        {
            if ($CrearSiniestro/fechaReclamo)
            then <ns2:FechaReclamacion>{fn:data($CrearSiniestro/fechaReclamo)}</ns2:FechaReclamacion>
            else ()
        }
        {
            if ($CrearSiniestro/fechaSiniestro)
            then <ns2:FechaSiniestro>{fn:data($CrearSiniestro/fechaSiniestro)}</ns2:FechaSiniestro>
            else ()
        }
        {
            if ($CrearSiniestro/fechaAgendaTaller)
            then <ns2:FechaAgendaTaller>{fn:data($CrearSiniestro/fechaAgendaTaller)}</ns2:FechaAgendaTaller>
            else ()
        }
        {
            if ($CrearSiniestro/fechaCreacionPresupuesto)
            then <ns2:FechaCreacionPresupuesto>{fn:data($CrearSiniestro/fechaCreacionPresupuesto)}</ns2:FechaCreacionPresupuesto>
            else ()
        }
        {
            if ($CrearSiniestro/fechaEntradaTaller)
            then <ns2:FechaEntradaTaller>{fn:data($CrearSiniestro/fechaEntradaTaller)}</ns2:FechaEntradaTaller>
            else ()
        }
        {
            if ($CrearSiniestro/fechaEstimadaSalidaTaller)
            then <ns2:FechaEstimadaSalidaTaller>{fn:data($CrearSiniestro/fechaEstimadaSalidaTaller)}</ns2:FechaEstimadaSalidaTaller>
            else ()
        }
        {
            if ($CrearSiniestro/diasReparacion)
            then <ns2:DiasReparacion>{fn:data($CrearSiniestro/diasReparacion)}</ns2:DiasReparacion>
            else ()
        }
        {
            if ($CrearSiniestro/ciudadAtencion)
            then <ns2:CiudadAtencion>{fn:data($CrearSiniestro/ciudadAtencion)}</ns2:CiudadAtencion>
            else ()
        }
        {
            if ($CrearSiniestro/ciudadSiniestro)
            then <ns2:CiudadSiniestro>{fn:data($CrearSiniestro/ciudadSiniestro)}</ns2:CiudadSiniestro>
            else ()
        }
        {
            if ($CrearSiniestro/nomTaller)
            then <ns2:NomTaller>{fn:data($CrearSiniestro/nomTaller)}</ns2:NomTaller>
            else ()
        }
        {
            if ($CrearSiniestro/idTaller)
            then <ns2:IdTaller>{fn:data($CrearSiniestro/idTaller)}</ns2:IdTaller>
            else ()
        }
        {
            if ($CrearSiniestro/nomEvaluador)
            then <ns2:NombreEvaluador>{fn:data($CrearSiniestro/nomEvaluador)}</ns2:NombreEvaluador>
            else ()
        }
        {
            if ($CrearSiniestro/idEvaluador)
            then <ns2:IdEvaluador>{fn:data($CrearSiniestro/idEvaluador)}</ns2:IdEvaluador>
            else ()
        }
        {
            if ($CrearSiniestro/indicadorFraude)
            then <ns2:IndicadorFraude>{fn:data($CrearSiniestro/indicadorFraude)}</ns2:IndicadorFraude>
            else ()
        }
        <ns2:Placa>{fn:data($CrearSiniestro/numPlaca)}</ns2:Placa>
        <ns2:Vin>{fn:data($CrearSiniestro/codigoVin)}</ns2:Vin>
        <ns2:DescripcionVehiculo>{fn:data($CrearSiniestro/descVehiculo)}</ns2:DescripcionVehiculo>
        {
            if ($CrearSiniestro/codigoVehiculo)
            then <ns2:CodigoVehiculo>{fn:data($CrearSiniestro/codigoVehiculo)}</ns2:CodigoVehiculo>
            else ()
        }
        <ns2:Modelo>{fn:data($CrearSiniestro/modeloVehiculo)}</ns2:Modelo>
        {
            if ($CrearSiniestro/codigoMotor)
            then <ns2:CodigoMotor>{fn:data($CrearSiniestro/codigoMotor)}</ns2:CodigoMotor>
            else ()
        }
        <ns2:TipoIdentificacion>{fn:data($CrearSiniestro/tipoIdentificacion)}</ns2:TipoIdentificacion>
        <ns2:IdPropietario>{fn:data($CrearSiniestro/idPropietario)}</ns2:IdPropietario>
        <ns2:NomPropietario>{fn:data($CrearSiniestro/nomPropietario)}</ns2:NomPropietario>
        {
            if ($CrearSiniestro/dirPropietario)
            then <ns2:DirPropietario>{fn:data($CrearSiniestro/dirPropietario)}</ns2:DirPropietario>
            else ()
        }
        {
            if ($CrearSiniestro/telPropietario)
            then <ns2:TelPropietario>{fn:data($CrearSiniestro/telPropietario)}</ns2:TelPropietario>
            else ()
        }
        {
            if ($CrearSiniestro/emailPropietario)
            then <ns2:EmailPropietario>{fn:data($CrearSiniestro/emailPropietario)}</ns2:EmailPropietario>
            else ()
        }
        <ns2:Cobertura>{fn:data($CrearSiniestro/Coberturas/idCobertura)}</ns2:Cobertura>
        <ns2:ValorAsegurado>{fn:data($CrearSiniestro/Coberturas/valorAsegurado)}</ns2:ValorAsegurado>
        {
            if ($CrearSiniestro/Coberturas/montoMaxReparacion)
            then <ns2:MontoMaxRepcon>{fn:data($CrearSiniestro/Coberturas/montoMaxReparacion)}</ns2:MontoMaxRepcon>
            else ()
        }
        <ns2:ValorDeducible>{fn:data($CrearSiniestro/Coberturas/valorDeducible)}</ns2:ValorDeducible>
        {
            if ($CrearSiniestro/Coberturas/tipoDeducible)
            then <ns2:TipoDeducible>{fn:data($CrearSiniestro/Coberturas/tipoDeducible)}</ns2:TipoDeducible>
            else ()
        }
        {
            if ($CrearSiniestro/Coberturas/numSalrDedcbl)
            then <ns2:NumSalrDedcbl>{fn:data($CrearSiniestro/Coberturas/numSalrDedcbl)}</ns2:NumSalrDedcbl>
            else ()
        }
        {
            if ($CrearSiniestro/Coberturas/porcentajeDeducible)
            then <ns2:PorcentajeDeducible>{fn:data($CrearSiniestro/Coberturas/porcentajeDeducible)}</ns2:PorcentajeDeducible>
            else ()
        }
        <ns2:Estado>{fn:data($CrearSiniestro/estado)}</ns2:Estado>
        {
            if ($CrearSiniestro/subEstado)
            then <ns2:SubEstado>{fn:data($CrearSiniestro/subEstado)}</ns2:SubEstado>
            else ()
        }
        {
            if ($CrearSiniestro/codigoSegmentoClte)
            then <ns2:CodigoSegmentoCliente>{fn:data($CrearSiniestro/codigoSegmentoClte)}</ns2:CodigoSegmentoCliente>
            else ()
        }
        {
            if ($CrearSiniestro/descSegmentoClte)
            then <ns2:DescrpcnSegmntClint>{fn:data($CrearSiniestro/descSegmentoClte)}</ns2:DescrpcnSegmntClint>
            else ()
        }
        {
            if ($CrearSiniestro/codigoSegmentoClte1)
            then <ns2:CodigoSegmentoCliente1>{fn:data($CrearSiniestro/codigoSegmentoClte1)}</ns2:CodigoSegmentoCliente1>
            else ()
        }
        {
            if ($CrearSiniestro/descSegmentoClte1)
            then <ns2:DescrpcnSegmntClint1>{fn:data($CrearSiniestro/descSegmentoClte1)}</ns2:DescrpcnSegmntClint1>
            else ()
        }
        {
            if ($CrearSiniestro/codigoSegmentoClte2)
            then <ns2:CodigoSegmentoCliente2>{fn:data($CrearSiniestro/codigoSegmentoClte2)}</ns2:CodigoSegmentoCliente2>
            else ()
        }
        {
            if ($CrearSiniestro/descSegmentoClte2)
            then <ns2:DescrpcnSegmntClint2>{fn:data($CrearSiniestro/descSegmentoClte2)}</ns2:DescrpcnSegmntClint2>
            else ()
        }
        {
            if ($CrearSiniestro/codigoComprtmntClte)
            then <ns2:CodigoComprtmntClint>{fn:data($CrearSiniestro/codigoComprtmntClte)}</ns2:CodigoComprtmntClint>
            else ()
        }
        {
            if ($CrearSiniestro/descComprtmntClte)
            then <ns2:DescComprtmntClint>{fn:data($CrearSiniestro/descComprtmntClte)}</ns2:DescComprtmntClint>
            else ()
        }
        {
            if ($CrearSiniestro/influenciador='S')
            then <ns2:Influenciador>true</ns2:Influenciador>
            else
            <ns2:Influenciador>false</ns2:Influenciador>
        }
        {
            if ($CrearSiniestro/estadoCartera)
            then <ns2:EstadoCartera>{fn:data($CrearSiniestro/estadoCartera)}</ns2:EstadoCartera>
            else ()
        }
        {
            if ($CrearSiniestro/tipoVehiculo)
            then <ns2:TipoVehiculo>{fn:data($CrearSiniestro/tipoVehiculo)}</ns2:TipoVehiculo>
            else ()
        }
        {
            if ($CrearSiniestro/direccionEvento/dirEvento)
            then <ns2:DirEvento>{fn:data($CrearSiniestro/direccionEvento/dirEvento)}</ns2:DirEvento>
            else ()
        }
        {
            if ($CrearSiniestro/tipoServicio)
            then <ns2:TipoServicio>{fn:data($CrearSiniestro/tipoServicio)}</ns2:TipoServicio>
            else ()
        }
        <ns2:Moneda>{fn:data($CrearSiniestro/moneda)}</ns2:Moneda>
       
    </ns2:OBJ_SINIESTRO>
};

local:func($codCliente, $fechaEnvio, $CrearSiniestro)
