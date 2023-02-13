<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:tns="http://xmlns.sura.com/MensajeIntegracion/DominioPago/PagoMI/V1" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:ns0="http://xmlns.oracle.com/pcbpel/adapter/db/sp/dbReferenceInsis" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction"
                xmlns:dcomcom="http://xmlns.sura.com/ObjetoEmpresarial/DominioComun/Comun/V1"
                xmlns:dpagpag="http://xmlns.sura.com/ObjetoIntegracion/DominioPago/Pago/V1">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="XSD">
            <oracle-xsl-mapper:schema location="../Databases/dbReferenceInsis_sp.xsd"/>
            <oracle-xsl-mapper:rootElement name="OutputParameters" namespace="http://xmlns.oracle.com/pcbpel/adapter/db/sp/dbReferenceInsis"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="XSD">
            <oracle-xsl-mapper:schema location="../../../ComponentesComunes/WSDL/xsd/DominioPago/Pago/V1/PagoMIV1.xsd"/>
            <oracle-xsl-mapper:rootElement name="ConfirmarPagoInsisMsjResp" namespace="http://xmlns.sura.com/MensajeIntegracion/DominioPago/PagoMI/V1"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.4.0(XSLT Build 190828.0353.3300) AT [WED MAY 20 18:31:48 COT 2020].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:ConfirmarPagoInsisMsjResp>
         <tns:CabeceraResp>
            <dcomcom:EstadoGeneral>
               <dcomcom:Status>
                  <xsl:value-of select="/ns0:OutputParameters/ns0:PO_STATUSMSG"/>
               </dcomcom:Status>
               <dcomcom:Descripcion>
                  <xsl:value-of select="/ns0:OutputParameters/ns0:PO_DESCMSG"/>
               </dcomcom:Descripcion>
            </dcomcom:EstadoGeneral>
         </tns:CabeceraResp>
      </tns:ConfirmarPagoInsisMsjResp>
   </xsl:template>
</xsl:stylesheet>
