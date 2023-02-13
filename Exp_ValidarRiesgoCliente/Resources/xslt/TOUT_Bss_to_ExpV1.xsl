<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:tns="http://sura.com.pa/matrizRiesgoCliente/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:ns0="http://www.sura.com/MensajeIntegracion/DominioCliente/ClienteMEN/V1" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction"
                xmlns:dcliubi="http://www.sura.com/ObjetoEmpresarial/DominioCliente/Ubicacion/V2"
                xmlns:ns1="http://www.sura.com/ObjetoEmpresarial/DominioCliente/Ubicacion/V1"
                xmlns:dcomcom="http://xmlns.sura.com/ObjetoEmpresarial/DominioComun/Comun/V1"
                xmlns:dcliper="http://www.sura.com/ObjetoEmpresarial/DominioCliente/Persona/V1"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="XSD">
            <oracle-xsl-mapper:schema location="../../../ComponentesComunes/WSDL/xsd/DominioCliente/Cliente/V1/ClienteMENV1.xsd"/>
            <oracle-xsl-mapper:rootElement name="ValidarRiesgoClienteMsjResp" namespace="http://www.sura.com/MensajeIntegracion/DominioCliente/ClienteMEN/V1"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../matrizRiesgoCliente.wsdl"/>
            <oracle-xsl-mapper:rootElement name="validarRiesgoClienteResponse" namespace="http://sura.com.pa/matrizRiesgoCliente/"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.4.0(XSLT Build 190828.0353.3300) AT [TUE MAY 19 14:01:16 COT 2020].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:validarRiesgoClienteResponse>
         <statusMSG>
            <xsl:value-of select="/ns0:ValidarRiesgoClienteMsjResp/ns0:CabeceraResp/dcomcom:EstadoGeneral/dcomcom:Status"/>
         </statusMSG>
         <xsl:choose>
            <xsl:when test="/ns0:ValidarRiesgoClienteMsjResp/ns0:CabeceraResp/dcomcom:EstadoGeneral/dcomcom:Status = &quot;OK&quot;">
               <descMSG>
                  <xsl:value-of select="/ns0:ValidarRiesgoClienteMsjResp/ns0:CabeceraResp/dcomcom:EstadoGeneral/dcomcom:Descripcion"/>
               </descMSG>
            </xsl:when>
            <xsl:when test="/ns0:ValidarRiesgoClienteMsjResp/ns0:CabeceraResp/dcomcom:EstadoGeneral/dcomcom:Status = &quot;ERR&quot;">
               <descMSG>
                  <xsl:value-of select="concat (/ns0:ValidarRiesgoClienteMsjResp/ns0:CabeceraResp/dcomcom:EstadoGeneral/dcomcom:Descripcion, /ns0:ValidarRiesgoClienteMsjResp/ns0:CabeceraResp/dcomcom:EstadosPorRegistro/dcomcom:Estado/dcomcom:Descripcion )"/>
               </descMSG>
            </xsl:when>
         </xsl:choose>
         <nivelRiesgo>
            <xsl:value-of select="/ns0:ValidarRiesgoClienteMsjResp/ns0:NivelRiesgo"/>
         </nivelRiesgo>
      </tns:validarRiesgoClienteResponse>
   </xsl:template>
</xsl:stylesheet>
