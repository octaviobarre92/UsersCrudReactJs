<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:ns0="http://xmlns.sura.com/MensajeIntegracion/DominioUtilitario/GestionDocumentalMI/V1" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:tns="http://tempuri.org/" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction"
                xmlns:dpropro="http://xmlns.sura.com/ObjetoIntegracion/DominioProceso/Proceso/V1"
                xmlns:dutigdoc="http://xmlns.sura.com/ObjetoIntegracion/DominioUtilitario/GestionDocumental/V1"
                xmlns:dcomcom="http://xmlns.sura.com/ObjetoEmpresarial/DominioComun/Comun/V1"
                xmlns:ns1="http://schemas.datacontract.org/2004/07/OBDocService"
                xmlns:wsp="http://schemas.xmlsoap.org/ws/2004/09/policy"
                xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/"
                xmlns:msc="http://schemas.microsoft.com/ws/2005/12/wsdl/contract"
                xmlns:wsaw="http://www.w3.org/2006/05/addressing/wsdl"
                xmlns:wsam="http://www.w3.org/2007/05/addressing/metadata"
                xmlns:wsa10="http://www.w3.org/2005/08/addressing"
                xmlns:wsap="http://schemas.xmlsoap.org/ws/2004/08/addressing/policy"
                xmlns:wsx="http://schemas.xmlsoap.org/ws/2004/09/mex"
                xmlns:ns2="http://schemas.microsoft.com/2003/10/Serialization/"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
                xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing"
                xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="XSD">
            <oracle-xsl-mapper:schema location="../../../ComponentesComunes/WSDL/xsd/DominioUtilitario/GestionDocumental/V1/GestionDocumentalMIV1.xsd"/>
            <oracle-xsl-mapper:rootElement name="AlmacenarDocumentoOnBaseMsjSol" namespace="http://xmlns.sura.com/MensajeIntegracion/DominioUtilitario/GestionDocumentalMI/V1"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../wsdl/OBDocService_1.wsdl"/>
            <oracle-xsl-mapper:rootElement name="OBDocStore" namespace="http://tempuri.org/"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.4.0(XSLT Build 190828.0353.3300) AT [SAT MAY 02 14:19:51 COT 2020].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:OBDocStore>
         <tns:sOBType>
            <xsl:value-of select="/ns0:AlmacenarDocumentoOnBaseMsjSol/ns0:IdDocumental"/>
         </tns:sOBType>
         <tns:oKWord>
            <xsl:for-each select="/ns0:AlmacenarDocumentoOnBaseMsjSol/ns0:Atributos/dutigdoc:Atributo">
               <ns1:OBKeyword>
                  <ns1:kwID>
                     <xsl:value-of select="dutigdoc:IdParametro"/>
                  </ns1:kwID>
                  <xsl:if test="dutigdoc:Nombre">
                     <ns1:kwName>
                        <xsl:value-of select="dutigdoc:Nombre"/>
                     </ns1:kwName>
                  </xsl:if>
                  <xsl:if test="dutigdoc:Valor">
                     <ns1:kwValue>
                        <xsl:value-of select="dutigdoc:Valor"/>
                     </ns1:kwValue>
                  </xsl:if>
               </ns1:OBKeyword>
            </xsl:for-each>
         </tns:oKWord>
         <tns:oDocPages>
            <xsl:for-each select="/ns0:AlmacenarDocumentoOnBaseMsjSol/ns0:Paginas/dutigdoc:Pagina">
               <ns1:pageData>
                  <ns1:pgContent>
                     <xsl:value-of select="dutigdoc:Contenido"/>
                  </ns1:pgContent>
                  <ns1:pgFormat>
                     <xsl:value-of select="dutigdoc:IdFormato"/>
                  </ns1:pgFormat>
               </ns1:pageData>
            </xsl:for-each>
         </tns:oDocPages>
      </tns:OBDocStore>
   </xsl:template>
</xsl:stylesheet>