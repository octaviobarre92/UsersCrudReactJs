<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:tns="http://xmlns.sura.com/MensajeIntegracion/DominioUtilitario/GestionDocumentalMI/V1" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:ns0="http://www.sura.com/MensajeIntegracion/DominioPoliza/PolizaMIN/V1" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction"
                xmlns:dutidoc="http://xmlns.sura.com/ObjetoIntegracion/DominioUtilitario/GestionDocumental/V1"
                xmlns:dcomcom="http://xmlns.sura.com/ObjetoEmpresarial/DominioComun/Comun/V1"
                xmlns:dpropro="http://xmlns.sura.com/ObjetoIntegracion/DominioProceso/Proceso/V1">
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
            <oracle-xsl-mapper:schema location="../../../ComponentesComunes/WSDL/xsd/DominioUtilitario/GestionDocumental/V1/GestionDocumentalMIV1.xsd"/>
            <oracle-xsl-mapper:rootElement name="CargarDocumentoMsjSol" namespace="http://xmlns.sura.com/MensajeIntegracion/DominioUtilitario/GestionDocumentalMI/V1"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.4.0(XSLT Build 190828.0353.3300) AT [SAT JUN 13 22:42:07 COT 2020].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:param name="documentoBase64"/>
   <xsl:param name="documentPath"/>
   <xsl:param name="extension"/>
   <xsl:template match="/">
      <tns:CargarDocumentoMsjSol>
         <xsl:if test="/ns0:GenerarImprimibleMsjSol/ns0:CabeceraSol">
            <tns:CabeceraSol>
               <dcomcom:CodigoOperacion>
                  <xsl:value-of select="/ns0:GenerarImprimibleMsjSol/ns0:CabeceraSol/dcomcom:CodigoOperacion"/>
               </dcomcom:CodigoOperacion>
               <dcomcom:FechaProcesamiento>
                  <xsl:value-of select="/ns0:GenerarImprimibleMsjSol/ns0:CabeceraSol/dcomcom:FechaProcesamiento"/>
               </dcomcom:FechaProcesamiento>
               <dcomcom:FechaTransaccion>
                  <xsl:value-of select="/ns0:GenerarImprimibleMsjSol/ns0:CabeceraSol/dcomcom:FechaTransaccion"/>
               </dcomcom:FechaTransaccion>
               <xsl:if test="/ns0:GenerarImprimibleMsjSol/ns0:CabeceraSol/dcomcom:IdTransaccionOsb">
                  <dcomcom:IdTransaccionOsb>
                     <xsl:value-of select="/ns0:GenerarImprimibleMsjSol/ns0:CabeceraSol/dcomcom:IdTransaccionOsb"/>
                  </dcomcom:IdTransaccionOsb>
               </xsl:if>
               <xsl:if test="/ns0:GenerarImprimibleMsjSol/ns0:CabeceraSol/dcomcom:SistemaDestino">
                  <dcomcom:SistemaDestino>
                     <xsl:value-of select="/ns0:GenerarImprimibleMsjSol/ns0:CabeceraSol/dcomcom:SistemaDestino"/>
                  </dcomcom:SistemaDestino>
               </xsl:if>
               <xsl:if test="/ns0:GenerarImprimibleMsjSol/ns0:CabeceraSol/dcomcom:SistemaOrigen">
                  <dcomcom:SistemaOrigen>
                     <xsl:value-of select="/ns0:GenerarImprimibleMsjSol/ns0:CabeceraSol/dcomcom:SistemaOrigen"/>
                  </dcomcom:SistemaOrigen>
               </xsl:if>
            </tns:CabeceraSol>
         </xsl:if>
         <xsl:if test="/ns0:GenerarImprimibleMsjSol/ns0:InfoImprimible/ns0:IdPersona">
            <tns:IdentificacionPersona>
               <xsl:value-of select="/ns0:GenerarImprimibleMsjSol/ns0:InfoImprimible/ns0:IdPersona"/>
            </tns:IdentificacionPersona>
         </xsl:if>
         <tns:Documento>
            <xsl:if test="/ns0:GenerarImprimibleMsjSol/ns0:IdDocInsis">
               <dutidoc:IdDocumentoINSIS>
                  <xsl:value-of select="/ns0:GenerarImprimibleMsjSol/ns0:IdDocInsis"/>
               </dutidoc:IdDocumentoINSIS>
            </xsl:if>
            <dutidoc:Extension>
               <xsl:value-of select="$extension"/>
            </dutidoc:Extension>
            <xsl:if test="/ns0:GenerarImprimibleMsjSol/ns0:CodigoPrintOut">
               <dutidoc:Comentario>
                  <xsl:value-of select="/ns0:GenerarImprimibleMsjSol/ns0:CodigoPrintOut"/>
               </dutidoc:Comentario>
            </xsl:if>
            <xsl:if test="$documentPath">
               <dutidoc:UrlPathINSIS>
                  <xsl:value-of select="$documentPath"/>
               </dutidoc:UrlPathINSIS>
            </xsl:if>
            <dutidoc:EstadoDocumento>A</dutidoc:EstadoDocumento>
            <dutidoc:Paginas>
               <dutidoc:Pagina>
                  <dutidoc:Contenido>
                     <xsl:value-of select="$documentoBase64"/>
                  </dutidoc:Contenido>
               </dutidoc:Pagina>
            </dutidoc:Paginas>
         </tns:Documento>
         <tns:TipoOperacion>R</tns:TipoOperacion>
      </tns:CargarDocumentoMsjSol>
   </xsl:template>
</xsl:stylesheet>
