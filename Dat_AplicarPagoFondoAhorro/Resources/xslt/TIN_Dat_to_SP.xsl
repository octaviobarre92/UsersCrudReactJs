<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:ns0="http://www.sura.com.pa/AplicarFondoAhorro" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:tns="http://xmlns.oracle.com/pcbpel/adapter/db/sp/sp_validaciones_sap" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction"
                xmlns:nxsd="http://xmlns.oracle.com/pcbpel/nxsd">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="XSD">
            <oracle-xsl-mapper:schema location="../nxsd/RqFondoAhorro.xsd"/>
            <oracle-xsl-mapper:rootElement name="OBJETO_PAGO" namespace="http://www.sura.com.pa/AplicarFondoAhorro"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="XSD">
            <oracle-xsl-mapper:schema location="../database/sp_validaciones_sap_sp.xsd"/>
            <oracle-xsl-mapper:rootElement name="InputParameters" namespace="http://xmlns.oracle.com/pcbpel/adapter/db/sp/sp_validaciones_sap"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.4.0(XSLT Build 190828.0353.3300) AT [WED MAR 17 14:18:37 COT 2021].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:InputParameters>
         <xsl:if test="/ns0:OBJETO_PAGO/ns0:TITULAR/ns0:NUMERO_IDENTIFICACION">
            <tns:PVA_CEDULA>
               <xsl:value-of select="/ns0:OBJETO_PAGO/ns0:TITULAR/ns0:NUMERO_IDENTIFICACION"/>
            </tns:PVA_CEDULA>
         </xsl:if>
         <tns:PVA_CDTIPOCED>QC</tns:PVA_CDTIPOCED>
         <xsl:if test="/ns0:OBJETO_PAGO/ns0:POLIZA/ns0:NUMERO_POLIZA">
            <tns:PNU_TITULO>
               <xsl:value-of select="/ns0:OBJETO_PAGO/ns0:POLIZA/ns0:NUMERO_POLIZA"/>
            </tns:PNU_TITULO>
         </xsl:if>
         <xsl:if test="/ns0:OBJETO_PAGO/ns0:ESTRUCTURA_COMERCIAL/ns0:SUCURSAL">
            <tns:PVA_OFICINA>
               <xsl:value-of select="/ns0:OBJETO_PAGO/ns0:ESTRUCTURA_COMERCIAL/ns0:SUCURSAL"/>
            </tns:PVA_OFICINA>
         </xsl:if>
         <xsl:if test="/ns0:OBJETO_PAGO/ns0:INFO_PAGO/ns0:FECHA_OPERACION">
            <tns:PDA_FEOPERACION>
               <xsl:value-of select="/ns0:OBJETO_PAGO/ns0:INFO_PAGO/ns0:FECHA_OPERACION"/>
            </tns:PDA_FEOPERACION>
         </xsl:if>
         <xsl:if test="/ns0:OBJETO_PAGO/ns0:POLIZA/ns0:USUARIO">
            <tns:PVA_USER>
               <xsl:value-of select="/ns0:OBJETO_PAGO/ns0:POLIZA/ns0:USUARIO"/>
            </tns:PVA_USER>
         </xsl:if>
         <xsl:if test="/ns0:OBJETO_PAGO/ns0:INFO_PAGO/ns0:IMPORTE">
            <tns:PNU_VALOR>
               <xsl:value-of select="/ns0:OBJETO_PAGO/ns0:INFO_PAGO/ns0:IMPORTE"/>
            </tns:PNU_VALOR>
         </xsl:if>
         <tns:PVA_OPERACION>REINTEGRO FONDO DE AHORRO</tns:PVA_OPERACION>
         <xsl:if test="/ns0:OBJETO_PAGO/ns0:INFO_PAGO/ns0:TIPO_CUENTA">
            <tns:PVA_FORMA_PAGO>
               <xsl:value-of select="/ns0:OBJETO_PAGO/ns0:INFO_PAGO/ns0:TIPO_CUENTA"/>
            </tns:PVA_FORMA_PAGO>
         </xsl:if>
         <tns:PVA_RESPUESTA>' '</tns:PVA_RESPUESTA>
         <xsl:if test="/ns0:OBJETO_PAGO/ns0:INFO_PAGO/ns0:ID_RECIBO">
            <tns:PVA_DOCUMENTO>
               <xsl:value-of select="/ns0:OBJETO_PAGO/ns0:INFO_PAGO/ns0:ID_RECIBO"/>
            </tns:PVA_DOCUMENTO>
         </xsl:if>
         <tns:PNU_MARCAPOLI>2</tns:PNU_MARCAPOLI>
      </tns:InputParameters>
   </xsl:template>
</xsl:stylesheet>
