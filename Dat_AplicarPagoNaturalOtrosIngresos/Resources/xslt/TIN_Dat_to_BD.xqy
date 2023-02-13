xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://suramericana.servicioscompartidos.contabilidad.causcontable";
(:: import schema at "../wsdl/otrosIngresosSAP.wsdl" ::)
declare namespace ns1="http://www.sura.com/ConsultarPolizaInsis";
(:: import schema at "../xsd/AplicarPagoOtrosIngresos.xsd" ::)

declare variable $RequestAplicarPagoOtros as element() (:: schema-element(ns1:OTROS_INGRESOS) ::) external;

declare function local:func($RequestAplicarPagoOtros as element() (:: schema-element(ns1:OTROS_INGRESOS) ::)) as element() (:: schema-element(ns2:MT_CausacionDocContableReq) ::) {
    <ns2:MT_CausacionDocContableReq>
        <tercero>
            <datosEntradaTercero>
                <cdGrupoCuentas>{fn:data($RequestAplicarPagoOtros/ns1:DATOS_SAP/ns1:tercero/ns1:cdGrupoCuentas)}</cdGrupoCuentas>
            </datosEntradaTercero>
            <datosDireccionTercero>
                <dsPrimerNombre>{fn:data($RequestAplicarPagoOtros/ns1:DATOS_SAP/ns1:tercero/ns1:dsPrimerNombre)}</dsPrimerNombre>
                <dsSegundoNombre>{fn:data($RequestAplicarPagoOtros/ns1:DATOS_SAP/ns1:tercero/ns1:dsSegundoNombre)}</dsSegundoNombre>
                <dsPrimerApellido>{fn:data($RequestAplicarPagoOtros/ns1:DATOS_SAP/ns1:tercero/ns1:dsPrimerApellido)}</dsPrimerApellido>
                <dsSegundoApellido>{fn:data($RequestAplicarPagoOtros/ns1:DATOS_SAP/ns1:tercero/ns1:dsSegundoApellido)}</dsSegundoApellido>
                <dsPersonaJuridica>{fn:data($RequestAplicarPagoOtros/ns1:DATOS_SAP/ns1:tercero/ns1:dsPersonaJuridica)}</dsPersonaJuridica>
                <cdIndicadorEntrada>{fn:data($RequestAplicarPagoOtros/ns1:DATOS_SAP/ns1:tercero/ns1:cdIndicadorEntrada)}</cdIndicadorEntrada>
                <cdConceptoBusqueda>{fn:data($RequestAplicarPagoOtros/ns1:DATOS_SAP/ns1:tercero/ns1:cdConceptoBusqueda)}</cdConceptoBusqueda>
                <dsDireccion>{fn:data($RequestAplicarPagoOtros/ns1:DATOS_SAP/ns1:tercero/ns1:dsDireccion)}</dsDireccion>
                <dsDireccion2>{fn:data($RequestAplicarPagoOtros/ns1:DATOS_SAP/ns1:tercero/ns1:dsDireccion2)}</dsDireccion2>
                <cdPais>{fn:data($RequestAplicarPagoOtros/ns1:DATOS_SAP/ns1:tercero/ns1:cdPais)}</cdPais>
                <cdRegion>{fn:data($RequestAplicarPagoOtros/ns1:DATOS_SAP/ns1:tercero/ns1:cdRegion)}</cdRegion>
                <cdPoblacion>{fn:data($RequestAplicarPagoOtros/ns1:DATOS_SAP/ns1:tercero/ns1:cdPoblacion)}</cdPoblacion>
                <nmApartadoAereo>{fn:data($RequestAplicarPagoOtros/ns1:DATOS_SAP/ns1:tercero/ns1:nmApartadoAereo)}</nmApartadoAereo>
                <cdIdioma>{fn:data($RequestAplicarPagoOtros/ns1:DATOS_SAP/ns1:tercero/ns1:cdIdioma)}</cdIdioma>
                <nmTelefono>{fn:data($RequestAplicarPagoOtros/ns1:DATOS_SAP/ns1:tercero/ns1:nmTelefono)}</nmTelefono>
                <nmTelefonoMovil>{fn:data($RequestAplicarPagoOtros/ns1:DATOS_SAP/ns1:tercero/ns1:nmTelefonoMovil)}</nmTelefonoMovil>
                <nmFax>{fn:data($RequestAplicarPagoOtros/ns1:DATOS_SAP/ns1:tercero/ns1:nmFax)}</nmFax>
            </datosDireccionTercero>
            <datosComunicacionTercero>
                <dsEmail>{fn:data($RequestAplicarPagoOtros/ns1:DATOS_SAP/ns1:tercero/ns1:dsEmail)}</dsEmail>
            </datosComunicacionTercero>
            <datosControlTercero>
                <nmIdentifFiscal>{fn:data($RequestAplicarPagoOtros/ns1:DATOS_SAP/ns1:tercero/ns1:nmIdentifFiscal)}</nmIdentifFiscal>
                <cdTipoNif>{fn:data($RequestAplicarPagoOtros/ns1:DATOS_SAP/ns1:tercero/ns1:cdTipoNif)}</cdTipoNif>
                <cdSucursal>{fn:data($RequestAplicarPagoOtros/ns1:DATOS_SAP/ns1:tercero/ns1:cdSucursal)}</cdSucursal>
            </datosControlTercero>
            <datosRelBancariaTercero>
                <cdPaisBancoCtaBan>{fn:data($RequestAplicarPagoOtros/ns1:DATOS_SAP/ns1:tercero/ns1:cdPaisBancoCtaBan)}</cdPaisBancoCtaBan>
                <cdBancoCtaBan>{fn:data($RequestAplicarPagoOtros/ns1:DATOS_SAP/ns1:tercero/ns1:cdBancoCtaBan)}</cdBancoCtaBan>
                <nmCuentaBancaria>{fn:data($RequestAplicarPagoOtros/ns1:DATOS_SAP/ns1:tercero/ns1:nmCuentaBancaria)}</nmCuentaBancaria>
                <cdTitularCtaBan>{fn:data($RequestAplicarPagoOtros/ns1:DATOS_SAP/ns1:tercero/ns1:cdTitularCtaBan)}</cdTitularCtaBan>
                <cdClaveCtrlCtaBan>{fn:data($RequestAplicarPagoOtros/ns1:DATOS_SAP/ns1:tercero/ns1:cdClaveCtrlCtaBan)}</cdClaveCtrlCtaBan>
            </datosRelBancariaTercero>
        </tercero>
        <paramClaseDoc>
            <cdFuente>{fn:data($RequestAplicarPagoOtros/ns1:DATOS_SAP/ns1:conversionContable/ns1:cdFuente)}</cdFuente>
            <cdCanal>{fn:data($RequestAplicarPagoOtros/ns1:DATOS_SAP/ns1:conversionContable/ns1:cdCanal)}</cdCanal>
            <cdTipoOperacion>{fn:data($RequestAplicarPagoOtros/ns1:DATOS_SAP/ns1:conversionContable/ns1:cdTipoOperacion)}</cdTipoOperacion>
            <nmAplicacion>{fn:data($RequestAplicarPagoOtros/ns1:DATOS_SAP/ns1:conversionContable/ns1:nmAplicacion)}</nmAplicacion>
        </paramClaseDoc>
        <cabecera>
            <feDocumento>{fn:data($RequestAplicarPagoOtros/ns1:DATOS_SAP/ns1:encabezado/ns1:feDocumento)}</feDocumento>
            <cdClaseDocumento></cdClaseDocumento>
            <cdSociedad>{fn:data($RequestAplicarPagoOtros/ns1:DATOS_SAP/ns1:encabezado/ns1:cdSociedad)}</cdSociedad>
            <feContabilizacion>{fn:data($RequestAplicarPagoOtros/ns1:DATOS_SAP/ns1:encabezado/ns1:feContabilizacion)}</feContabilizacion>
            <nmPeriodo></nmPeriodo>
            <cdMoneda>{fn:data($RequestAplicarPagoOtros/ns1:DATOS_SAP/ns1:encabezado/ns1:cdMoneda)}</cdMoneda>
            <cdReferencia>{fn:data($RequestAplicarPagoOtros/ns1:DATOS_SAP/ns1:encabezado/ns1:cdReferencia)}</cdReferencia>
            <dsTextoCabecera></dsTextoCabecera>
        </cabecera>
        {
            for $posiciones in $RequestAplicarPagoOtros/ns1:DATOS_SAP/ns1:posiciones
            return 
            <posiciones>
                <datosParamContables>
                    <cdParametro1>{fn:data($posiciones/ns1:cdParametro1)}</cdParametro1>
                    <cdParametro2>{fn:data($posiciones/ns1:cdParametro2)}</cdParametro2>
                    <cdParametro3>{fn:data($posiciones/ns1:cdParametro3)}</cdParametro3>
                    <cdParametro4>{fn:data($posiciones/ns1:cdParametro4)}</cdParametro4>
                    <cdParametro5>{fn:data($posiciones/ns1:cdParametro5)}</cdParametro5>
                    <cdParametro6>{fn:data($posiciones/ns1:cdParametro6)}</cdParametro6>
                    <cdParametro7>{fn:data($posiciones/ns1:cdParametro7)}</cdParametro7>
                    <cdParametro8>{fn:data($posiciones/ns1:cdParametro8)}</cdParametro8>
                    <cdParametro9>{fn:data($posiciones/ns1:cdParametro9)}</cdParametro9>
                    <cdParametro10>{fn:data($posiciones/ns1:cdParametro10)}</cdParametro10>
                </datosParamContables>
                <ptImporte>{fn:data($posiciones/ns1:ptImporte)}</ptImporte>
                <snCalcularImpuestos>{fn:data($posiciones/ns1:snCalcularImpuestos)}</snCalcularImpuestos>
                <cdIndicadorImpuestos>{fn:data($posiciones/ns1:cdIndicadorImpuestos)}</cdIndicadorImpuestos>
                <cdDivision>{fn:data($posiciones/ns1:cdDivision)}</cdDivision>
                <feBase>{fn:data($posiciones/ns1:feBase)}</feBase>
                <cdBloqueoBago>{fn:data($posiciones/ns1:cdBloqueoBago)}</cdBloqueoBago>
                <cdViaPago>{fn:data($posiciones/ns1:cdViaPago)}</cdViaPago>
                <cdAsignacion>{fn:data($posiciones/ns1:cdAsignacion)}</cdAsignacion>
                <dsTextoPosicion>{fn:data($posiciones/ns1:dsTextoPosicion)}</dsTextoPosicion>
                <cdClaveReferencia1>{fn:data($posiciones/ns1:cdClaveReferencia1)}</cdClaveReferencia1>
                <cdClaveReferencia2>{fn:data($posiciones/ns1:cdClaveReferencia2)}</cdClaveReferencia2>
                <cdClaveReferencia3>{fn:data($posiciones/ns1:cdClaveReferencia3)}</cdClaveReferencia3>
                <cdCondicionPago>{fn:data($posiciones/ns1:cdCondicionPago)}</cdCondicionPago>
                <feValor>{fn:data($posiciones/ns1:feValor)}</feValor>
                <cdTipoIdTercero>{fn:data($posiciones/ns1:cdTipoIdTercero)}</cdTipoIdTercero>
                <cdTercero>{fn:data($posiciones/ns1:cdTercero)}</cdTercero>
                <feExpedicion>{fn:data($posiciones/ns1:feExpedicion)}</feExpedicion>
                <feVencimiento>{fn:data($posiciones/ns1:feVencimiento)}</feVencimiento>
                <cdTipoIdNit>{fn:data($posiciones/ns1:cdTipoIdNit)}</cdTipoIdNit>
                <cdNIT>{fn:data($posiciones/ns1:cdNIT)}</cdNIT>
                <dsNombre>{fn:data($posiciones/ns1:dsNombre)}</dsNombre>
                <nmPolizaLider>{fn:data($posiciones/ns1:nmPolizaLider)}</nmPolizaLider>
                <nmCertificadoLider>{fn:data($posiciones/ns1:nmCertificadoLider)}</nmCertificadoLider>
                <datosRetenciones>
                    <cdTipoRetencion>{fn:data($posiciones/ns1:cdTipoRetencion)}</cdTipoRetencion>
                    <cdIndicadorRetencion>{fn:data($posiciones/ns1:cdIndicadorRetencion)}</cdIndicadorRetencion>
                </datosRetenciones>
                <cdTipoCuenta>{fn:data($posiciones/ns1:cdTipoCuenta)}</cdTipoCuenta>
                <cuentaBancaria>
                    <cdPaisBancoCtaBan>{fn:data($posiciones/ns1:cdPaisBancoCtaBan)}</cdPaisBancoCtaBan>
                    <cdBancoCtaBan>{fn:data($posiciones/ns1:cdBancoCtaBan)}</cdBancoCtaBan>
                    <nmCuentaBancaria>{fn:data($posiciones/ns1:nmCuentaBancaria)}</nmCuentaBancaria>
                    <cdTitularCtaBan>{fn:data($posiciones/ns1:cdTitularCtaBan)}</cdTitularCtaBan>
                    <cdClaveCtrlCtaBan>{fn:data($posiciones/ns1:cdClaveCtrlCtaBan)}</cdClaveCtrlCtaBan>
                </cuentaBancaria>
            </posiciones>
        }
        <parametrosAdicionales>
            <items>
                <key></key>
                <value></value>
            </items>
        </parametrosAdicionales>
    </ns2:MT_CausacionDocContableReq>
};

local:func($RequestAplicarPagoOtros)
