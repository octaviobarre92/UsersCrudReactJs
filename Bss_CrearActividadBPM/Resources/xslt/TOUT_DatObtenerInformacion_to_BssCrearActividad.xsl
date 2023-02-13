<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:ns0="http://xmlns.sura.com/MensajeIntegracion/DominioProceso/BPMMI/V1" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction"
                xmlns:dpropro="http://xmlns.sura.com/ObjetoIntegracion/DominioProceso/Proceso/V1"
                xmlns:dcomcom="http://xmlns.sura.com/ObjetoEmpresarial/DominioComun/Comun/V1">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="XSD">
            <oracle-xsl-mapper:schema location="../../../ComponentesComunes/WSDL/xsd/DominioProceso/BPM/V1/ProcesoMIV1.xsd"/>
            <oracle-xsl-mapper:rootElement name="ObtenerReferenciaBPMMsjResp" namespace="http://xmlns.sura.com/MensajeIntegracion/DominioProceso/BPMMI/V1"/>
         </oracle-xsl-mapper:source>
         <oracle-xsl-mapper:source type="XSD">
            <oracle-xsl-mapper:schema location="../../../ComponentesComunes/WSDL/xsd/DominioProceso/BPM/V1/ProcesoMIV1.xsd"/>
            <oracle-xsl-mapper:rootElement name="CrearActividadBPMMsjSol"
                                           namespace="http://xmlns.sura.com/MensajeIntegracion/DominioProceso/BPMMI/V1"/>
            <oracle-xsl-mapper:param name="CrearActividadBPM"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="XSD">
            <oracle-xsl-mapper:schema location="../../../ComponentesComunes/WSDL/xsd/DominioProceso/BPM/V1/ProcesoMIV1.xsd"/>
            <oracle-xsl-mapper:rootElement name="CrearActividadBPMMsjSol" namespace="http://xmlns.sura.com/MensajeIntegracion/DominioProceso/BPMMI/V1"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.4.0(XSLT Build 190828.0353.3300) AT [TUE APR 07 15:45:44 COT 2020].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:param name="CrearActividadBPM"/>
   <xsl:template match="/">
      <ns0:CrearActividadBPMMsjSol>
         <ns0:CabeceraSol>
            <dcomcom:CodigoOperacion>
               <xsl:value-of select="$CrearActividadBPM/ns0:CrearActividadBPMMsjSol/ns0:CabeceraSol/dcomcom:CodigoOperacion"/>
            </dcomcom:CodigoOperacion>
            <dcomcom:FechaProcesamiento>
               <xsl:value-of select="$CrearActividadBPM/ns0:CrearActividadBPMMsjSol/ns0:CabeceraSol/dcomcom:FechaProcesamiento"/>
            </dcomcom:FechaProcesamiento>
            <dcomcom:FechaTransaccion>
               <xsl:value-of select="$CrearActividadBPM/ns0:CrearActividadBPMMsjSol/ns0:CabeceraSol/dcomcom:FechaTransaccion"/>
            </dcomcom:FechaTransaccion>
            <dcomcom:IdTransaccionOsb>
               <xsl:value-of select="$CrearActividadBPM/ns0:CrearActividadBPMMsjSol/ns0:CabeceraSol/dcomcom:IdTransaccionOsb"/>
            </dcomcom:IdTransaccionOsb>
            <dcomcom:SistemaDestino>
               <xsl:value-of select="$CrearActividadBPM/ns0:CrearActividadBPMMsjSol/ns0:CabeceraSol/dcomcom:SistemaDestino"/>
            </dcomcom:SistemaDestino>
            <dcomcom:SistemaOrigen>
               <xsl:value-of select="$CrearActividadBPM/ns0:CrearActividadBPMMsjSol/ns0:CabeceraSol/dcomcom:SistemaOrigen"/>
            </dcomcom:SistemaOrigen>
         </ns0:CabeceraSol>
         <ns0:TipoActividad>
            <xsl:value-of select="$CrearActividadBPM/ns0:CrearActividadBPMMsjSol/ns0:TipoActividad"/>
         </ns0:TipoActividad>
         <ns0:AsuntoActividad>
            <xsl:value-of select="$CrearActividadBPM/ns0:CrearActividadBPMMsjSol/ns0:AsuntoActividad"/>
         </ns0:AsuntoActividad>
         <ns0:IdUsuario>
            <xsl:value-of select="/ns0:ObtenerReferenciaBPMMsjResp/ns0:IdUsuario"/>
         </ns0:IdUsuario>
         <ns0:IdProceso>
            <xsl:value-of select="$CrearActividadBPM/ns0:CrearActividadBPMMsjSol/ns0:IdProceso"/>
         </ns0:IdProceso>
         <ns0:IdPersona>
            <xsl:value-of select="$CrearActividadBPM/ns0:CrearActividadBPMMsjSol/ns0:IdPersona"/>
         </ns0:IdPersona>
         <ns0:NumPoliza>
            <xsl:value-of select="$CrearActividadBPM/ns0:CrearActividadBPMMsjSol/ns0:NumPoliza"/>
         </ns0:NumPoliza>
         <ns0:TipoReferencia>
            <xsl:value-of select="/ns0:ObtenerReferenciaBPMMsjResp/ns0:ReferenciaActividad"/>
         </ns0:TipoReferencia>
         <ns0:NumReferencia>
            <xsl:value-of select="$CrearActividadBPM/ns0:CrearActividadBPMMsjSol/ns0:NumReferencia"/>
         </ns0:NumReferencia>
         <ns0:IdDocumental>
            <xsl:value-of select="/ns0:ObtenerReferenciaBPMMsjResp/ns0:IdTipoDocumental"/>
         </ns0:IdDocumental>
      </ns0:CrearActividadBPMMsjSol>
   </xsl:template>
</xsl:stylesheet>
