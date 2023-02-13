<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:tns="http://sura.com.pa/Actividad/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:ns0="http://xmlns.sura.com/MensajeIntegracion/DominioProceso/BPMMI/V1" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction"
                xmlns:dpropro="http://www.sura.com/ObjetoEmpresarial/DominioProceso/Proceso/V1"
                xmlns:dcomcom="http://xmlns.sura.com/ObjetoEmpresarial/DominioComun/Comun/V1"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="XSD">
            <oracle-xsl-mapper:schema location="../../../ComponentesComunes/WSDL/xsd/DominioProceso/BPM/V1/ProcesoMIV1.xsd"/>
            <oracle-xsl-mapper:rootElement name="CrearActividadBPMMsjResp" namespace="http://xmlns.sura.com/MensajeIntegracion/DominioProceso/BPMMI/V1"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../../../ComponentesComunes/WSDL/integrationBPM.wsdl"/>
            <oracle-xsl-mapper:rootElement name="crearActividadResponse" namespace="http://sura.com.pa/Actividad/"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.4.0(XSLT Build 190828.0353.3300) AT [MON OCT 04 18:05:24 COT 2021].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:crearActividadResponse>
         <statusMSG>
            <xsl:value-of select="/ns0:CrearActividadBPMMsjResp/ns0:CabeceraResp/dcomcom:EstadoGeneral/dcomcom:Status"/>
         </statusMSG>
         <xsl:choose>
            <xsl:when test="/ns0:CrearActividadBPMMsjResp/ns0:CabeceraResp/dcomcom:EstadoGeneral/dcomcom:Status = &quot;OK&quot;">
               <descMSG>
                  <xsl:value-of select="/ns0:CrearActividadBPMMsjResp/ns0:CabeceraResp/dcomcom:EstadoGeneral/dcomcom:Descripcion"/>
               </descMSG>
            </xsl:when>
            <xsl:when test="/ns0:CrearActividadBPMMsjResp/ns0:CabeceraResp/dcomcom:EstadoGeneral/dcomcom:Status = &quot;ERR&quot;">
               <descMSG>
                  <xsl:value-of select="concat (/ns0:CrearActividadBPMMsjResp/ns0:CabeceraResp/dcomcom:EstadoGeneral/dcomcom:Descripcion, &quot; &quot;, /ns0:CrearActividadBPMMsjResp/ns0:CabeceraResp/dcomcom:EstadosPorRegistro/dcomcom:Estado/dcomcom:Descripcion )"/>
               </descMSG>
            </xsl:when>
         </xsl:choose>
         <idActividad>
            <xsl:value-of select="/ns0:CrearActividadBPMMsjResp/ns0:IdActividad"/>
         </idActividad>
      </tns:crearActividadResponse>
   </xsl:template>
</xsl:stylesheet>
