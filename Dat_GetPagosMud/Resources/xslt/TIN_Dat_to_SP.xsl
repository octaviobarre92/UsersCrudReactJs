<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:ns0="http://www.sura.com/GetPagos" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:tns="http://xmlns.oracle.com/pcbpel/adapter/db/sp/sp_GetPagosMud" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction"
                xmlns:nxsd="http://xmlns.oracle.com/pcbpel/nxsd">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="XSD">
            <oracle-xsl-mapper:schema location="../nxsd/GetPagosMud.xsd"/>
            <oracle-xsl-mapper:rootElement name="OBJETO_GETPAGOS" namespace="http://www.sura.com/GetPagos"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="XSD">
            <oracle-xsl-mapper:schema location="../Database/sp_GetPagosMud_sp.xsd"/>
            <oracle-xsl-mapper:rootElement name="InputParameters" namespace="http://xmlns.oracle.com/pcbpel/adapter/db/sp/sp_GetPagosMud"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.4.0(XSLT Build 190828.0353.3300) AT [SAT NOV 07 18:20:18 COT 2020].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:InputParameters>
         <xsl:if test="/ns0:OBJETO_GETPAGOS/ns0:CODIGO_CORREDOR">
            <tns:cod_corredor>
               <xsl:value-of select="/ns0:OBJETO_GETPAGOS/ns0:CODIGO_CORREDOR"/>
            </tns:cod_corredor>
         </xsl:if>
         <xsl:if test="/ns0:OBJETO_GETPAGOS/ns0:FECHA_INICIO">
            <tns:fecha_desde>
               <xsl:value-of select="/ns0:OBJETO_GETPAGOS/ns0:FECHA_INICIO"/>
            </tns:fecha_desde>
         </xsl:if>
         <xsl:if test="/ns0:OBJETO_GETPAGOS/ns0:FECHA_FIN">
            <tns:fecha_hasta>
               <xsl:value-of select="/ns0:OBJETO_GETPAGOS/ns0:FECHA_FIN"/>
            </tns:fecha_hasta>
         </xsl:if>
         <xsl:if test="/ns0:OBJETO_GETPAGOS/ns0:NRO_PAGINA">
            <tns:PageNum>
               <xsl:value-of select="/ns0:OBJETO_GETPAGOS/ns0:NRO_PAGINA"/>
            </tns:PageNum>
         </xsl:if>
      </tns:InputParameters>
   </xsl:template>
</xsl:stylesheet>