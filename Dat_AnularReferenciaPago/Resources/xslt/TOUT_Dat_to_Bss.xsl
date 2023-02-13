<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:tns="http://xmlns.sura.com/MensajeIntegracion/DominioSAP/SAPMI/V1" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:ns0="http://www.ctinsuretech.com/SURA/PA/INSIS/BLC/custom/AdmonEgresosService/definitions" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:ns1="http://www.ctinsuretech.com/SURA/PA/INSIS/BLC/custom/AdmonEgresosService/"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
                xmlns:dsapsap="http://xmlns.sura.com/ObjetoIntegracion/DominioSAP/SAP/V1"
                xmlns:dcomcom="http://xmlns.sura.com/ObjetoEmpresarial/DominioComun/Comun/V1">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../../../Dat_AnularReferenciaPago/Resources/wsdl/AdmonEgresosService.wsdl"/>
            <oracle-xsl-mapper:rootElement name="AnularRefPagoRs" namespace="http://www.ctinsuretech.com/SURA/PA/INSIS/BLC/custom/AdmonEgresosService/definitions"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="XSD">
            <oracle-xsl-mapper:schema location="../../../ComponentesComunes/WSDL/xsd/DominioSAP/SAP/V1/SAPMIV1.xsd"/>
            <oracle-xsl-mapper:rootElement name="AnularReferenciaPagoMsjResp" namespace="http://xmlns.sura.com/MensajeIntegracion/DominioSAP/SAPMI/V1"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.4.0(XSLT Build 190828.0353.3300) AT [SAT APR 04 19:40:34 COT 2020].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:AnularReferenciaPagoMsjResp>
         <tns:CabeceraResp>
            <dcomcom:EstadoGeneral>
               <dcomcom:Status>
                  <xsl:value-of select="/ns0:AnularRefPagoRs/ns0:estatus"/>
               </dcomcom:Status>
               <dcomcom:Descripcion>
                  <xsl:value-of select="/ns0:AnularRefPagoRs/ns0:descripcion"/>
               </dcomcom:Descripcion>
            </dcomcom:EstadoGeneral>
         </tns:CabeceraResp>
      </tns:AnularReferenciaPagoMsjResp>
   </xsl:template>
</xsl:stylesheet>