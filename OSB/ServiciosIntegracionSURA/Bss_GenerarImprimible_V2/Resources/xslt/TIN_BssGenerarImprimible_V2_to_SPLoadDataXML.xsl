<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:ns0="http://www.sura.com/MensajeIntegracion/DominioPoliza/PolizaMIN/V1" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:tns="http://xmlns.oracle.com/pcbpel/adapter/db/sp/dbLoadDataXML" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction"
                xmlns:dutidoc="http://xmlns.sura.com/ObjetoIntegracion/DominioUtilitario/GestionDocumental/V1"
                xmlns:dcomcom="http://xmlns.sura.com/ObjetoEmpresarial/DominioComun/Comun/V1">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="XSD">
            <oracle-xsl-mapper:schema location="../../../ComponentesComunes/WSDL/xsd/DominioPoliza/Poliza/V1/PolizaMINV1.xsd"/>
            <oracle-xsl-mapper:rootElement name="GenerarImprimibleMsjSol" namespace="http://www.sura.com/MensajeIntegracion/DominioPoliza/PolizaMIN/V1"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="XSD">
            <oracle-xsl-mapper:schema location="../Database/dbLoadDataXML_sp.xsd"/>
            <oracle-xsl-mapper:rootElement name="InputParameters" namespace="http://xmlns.oracle.com/pcbpel/adapter/db/sp/dbLoadDataXML"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.4.0(XSLT Build 190828.0353.3300) AT [TUE JUN 09 12:20:50 COT 2020].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:InputParameters>
         <xsl:if test="/ns0:GenerarImprimibleMsjSol/ns0:CodigoPrintOut">
            <tns:PI_CODEPO>
               <xsl:value-of select="/ns0:GenerarImprimibleMsjSol/ns0:CodigoPrintOut"/>
            </tns:PI_CODEPO>
         </xsl:if>
         <xsl:if test="/ns0:GenerarImprimibleMsjSol/ns0:CodigoOperacion">
            <tns:PI_CODEOPER>
               <xsl:value-of select="/ns0:GenerarImprimibleMsjSol/ns0:CodigoOperacion"/>
            </tns:PI_CODEOPER>
         </xsl:if>
         <xsl:if test="/ns0:GenerarImprimibleMsjSol/ns0:TipoEjecucion">
            <tns:PI_TYPEEXEC>
               <xsl:value-of select="/ns0:GenerarImprimibleMsjSol/ns0:TipoEjecucion"/>
            </tns:PI_TYPEEXEC>
         </xsl:if>
         <xsl:if test="/ns0:GenerarImprimibleMsjSol/ns0:InfoImprimible/ns0:CodigoCliente">
            <tns:PI_PEOPLEID>
               <xsl:value-of select="/ns0:GenerarImprimibleMsjSol/ns0:InfoImprimible/ns0:CodigoCliente"/>
            </tns:PI_PEOPLEID>
         </xsl:if>
         <xsl:if test="/ns0:GenerarImprimibleMsjSol/ns0:InfoImprimible/ns0:IdPersona">
            <tns:PI_CLIENTID>
               <xsl:value-of select="/ns0:GenerarImprimibleMsjSol/ns0:InfoImprimible/ns0:IdPersona"/>
            </tns:PI_CLIENTID>
         </xsl:if>
         <xsl:if test="/ns0:GenerarImprimibleMsjSol/ns0:InfoImprimible/ns0:CodigoAgente">
            <tns:PI_AGENTID>
               <xsl:value-of select="/ns0:GenerarImprimibleMsjSol/ns0:InfoImprimible/ns0:CodigoAgente"/>
            </tns:PI_AGENTID>
         </xsl:if>
         <xsl:if test="/ns0:GenerarImprimibleMsjSol/ns0:InfoImprimible/ns0:NumeroPoliza">
            <tns:PI_POLICYID>
               <xsl:value-of select="/ns0:GenerarImprimibleMsjSol/ns0:InfoImprimible/ns0:NumeroPoliza"/>
            </tns:PI_POLICYID>
         </xsl:if>
         <xsl:if test="/ns0:GenerarImprimibleMsjSol/ns0:InfoImprimible/ns0:NumeroEndoso">
            <tns:PI_ANNEXID>
               <xsl:value-of select="/ns0:GenerarImprimibleMsjSol/ns0:InfoImprimible/ns0:NumeroEndoso"/>
            </tns:PI_ANNEXID>
         </xsl:if>
         <xsl:if test="/ns0:GenerarImprimibleMsjSol/ns0:InfoImprimible/ns0:NumeroReclamo">
            <tns:PI_CLAIMID>
               <xsl:value-of select="/ns0:GenerarImprimibleMsjSol/ns0:InfoImprimible/ns0:NumeroReclamo"/>
            </tns:PI_CLAIMID>
         </xsl:if>
         <xsl:if test="/ns0:GenerarImprimibleMsjSol/ns0:InfoImprimible/ns0:SecuencialPoliza">
            <tns:PI_SECID>
               <xsl:value-of select="/ns0:GenerarImprimibleMsjSol/ns0:InfoImprimible/ns0:SecuencialPoliza"/>
            </tns:PI_SECID>
         </xsl:if>
         <xsl:if test="/ns0:GenerarImprimibleMsjSol/ns0:EmailsFrom">
            <tns:PI_LISTEMAILFROM>
               <xsl:value-of select="/ns0:GenerarImprimibleMsjSol/ns0:EmailsFrom"/>
            </tns:PI_LISTEMAILFROM>
         </xsl:if>
         <xsl:if test="/ns0:GenerarImprimibleMsjSol/ns0:EmailsTo">
            <tns:PI_LISTEMAILTO>
               <xsl:value-of select="/ns0:GenerarImprimibleMsjSol/ns0:EmailsTo"/>
            </tns:PI_LISTEMAILTO>
         </xsl:if>
      </tns:InputParameters>
   </xsl:template>
</xsl:stylesheet>
