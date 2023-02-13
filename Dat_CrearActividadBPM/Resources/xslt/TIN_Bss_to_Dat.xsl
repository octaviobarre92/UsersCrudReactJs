<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:tns="http://tempuri.org/" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:ns0="http://xmlns.sura.com/MensajeIntegracion/DominioProceso/BPMMI/V1" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction"
                
                xmlns:ns1="http://schemas.datacontract.org/2004/07/OBService"
                xmlns:dpropro="http://xmlns.sura.com/ObjetoIntegracion/DominioProceso/Proceso/V1"
                xmlns:dcomcom="http://xmlns.sura.com/ObjetoEmpresarial/DominioComun/Comun/V1">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="XSD">
            <oracle-xsl-mapper:schema location="../../../ComponentesComunes/WSDL/xsd/DominioProceso/BPM/V1/ProcesoMIV1.xsd"/>
            <oracle-xsl-mapper:rootElement name="CrearActividadBPMMsjSol" namespace="http://xmlns.sura.com/MensajeIntegracion/DominioProceso/BPMMI/V1"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="XSD">
            <oracle-xsl-mapper:schema location="../../../Dat_CrearActividadBPM/Resources/wsdl/OBService.xsd"/>
            <oracle-xsl-mapper:rootElement name="OBDocCreate" namespace="http://tempuri.org/"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.4.0(XSLT Build 190828.0353.3300) AT [MON MAR 30 14:20:28 COT 2020].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:OBDocCreate>
         <tns:sOBType>
            <xsl:value-of select="/ns0:CrearActividadBPMMsjSol/ns0:IdDocumental"/>
         </tns:sOBType>
         <tns:sOBClass>
            <xsl:value-of select="/ns0:CrearActividadBPMMsjSol/ns0:TipoReferencia"/>
         </tns:sOBClass>
         <tns:oKWord>
            <xsl:if test="/ns0:CrearActividadBPMMsjSol/ns0:TipoActividad">
               <ns1:OBKeyword>
                  <ns1:kwID>
                     <xsl:value-of select='"102"'/>
                  </ns1:kwID>
                  <ns1:kwName>
                     <xsl:value-of select="local-name(/ns0:CrearActividadBPMMsjSol/ns0:TipoActividad)"/>
                  </ns1:kwName>
                  <xsl:choose>
                     <xsl:when test="/ns0:CrearActividadBPMMsjSol/ns0:TipoActividad = &quot;1&quot;">
                        <ns1:kwValue>Consulta</ns1:kwValue>
                     </xsl:when>
                     <xsl:when test="/ns0:CrearActividadBPMMsjSol/ns0:TipoActividad = &quot;2&quot;">
                        <ns1:kwValue>Solicitud</ns1:kwValue>
                     </xsl:when>
                     <xsl:when test="/ns0:CrearActividadBPMMsjSol/ns0:TipoActividad = &quot;3&quot;">
                        <ns1:kwValue>Carga Masiva</ns1:kwValue>
                     </xsl:when>
                  </xsl:choose>
               </ns1:OBKeyword>
            </xsl:if>
            <xsl:if test="/ns0:CrearActividadBPMMsjSol/ns0:AsuntoActividad">
               <ns1:OBKeyword>
                  <ns1:kwID>
                     <xsl:value-of select='"103"'/>
                  </ns1:kwID>
                  <ns1:kwName>
                     <xsl:value-of select="local-name(/ns0:CrearActividadBPMMsjSol/ns0:AsuntoActividad)"/>
                  </ns1:kwName>
                  <ns1:kwValue>
                     <xsl:value-of select="/ns0:CrearActividadBPMMsjSol/ns0:AsuntoActividad"/>
                  </ns1:kwValue>
               </ns1:OBKeyword>
            </xsl:if>
            <xsl:if test="/ns0:CrearActividadBPMMsjSol/ns0:IdUsuario">
               <ns1:OBKeyword>
                  <ns1:kwID>
                     <xsl:value-of select='"104"'/>
                  </ns1:kwID>
                  <ns1:kwName>
                     <xsl:value-of select="local-name(/ns0:CrearActividadBPMMsjSol/ns0:IdUsuario)"/>
                  </ns1:kwName>
                  <ns1:kwValue>
                     <xsl:value-of select="/ns0:CrearActividadBPMMsjSol/ns0:IdUsuario"/>
                  </ns1:kwValue>
               </ns1:OBKeyword>
            </xsl:if>
            <xsl:if test="/ns0:CrearActividadBPMMsjSol/ns0:IdProceso">
               <ns1:OBKeyword>
                  <ns1:kwID>
                     <xsl:value-of select='"105"'/>
                  </ns1:kwID>
                  <ns1:kwName>
                     <xsl:value-of select="local-name(/ns0:CrearActividadBPMMsjSol/ns0:IdProceso)"/>
                  </ns1:kwName>
                  <ns1:kwValue>
                     <xsl:value-of select="/ns0:CrearActividadBPMMsjSol/ns0:IdProceso"/>
                  </ns1:kwValue>
               </ns1:OBKeyword>
            </xsl:if>
            <xsl:if test="/ns0:CrearActividadBPMMsjSol/ns0:IdPersona">
               <ns1:OBKeyword>
                  <ns1:kwID>
                     <xsl:value-of select='"106"'/>
                  </ns1:kwID>
                  <ns1:kwName>
                     <xsl:value-of select="local-name(/ns0:CrearActividadBPMMsjSol/ns0:IdPersona)"/>
                  </ns1:kwName>
                  <ns1:kwValue>
                     <xsl:value-of select="/ns0:CrearActividadBPMMsjSol/ns0:IdPersona"/>
                  </ns1:kwValue>
               </ns1:OBKeyword>
            </xsl:if>
            <xsl:if test="/ns0:CrearActividadBPMMsjSol/ns0:NumPoliza">
               <ns1:OBKeyword>
                  <ns1:kwID>
                     <xsl:value-of select='"107"'/>
                  </ns1:kwID>
                  <ns1:kwName>
                     <xsl:value-of select="local-name(/ns0:CrearActividadBPMMsjSol/ns0:NumPoliza)"/>
                  </ns1:kwName>
                  <ns1:kwValue>
                     <xsl:value-of select="/ns0:CrearActividadBPMMsjSol/ns0:NumPoliza"/>
                  </ns1:kwValue>
               </ns1:OBKeyword>
            </xsl:if>
            <xsl:if test="/ns0:CrearActividadBPMMsjSol/ns0:TipoReferencia">
               <ns1:OBKeyword>
                  <ns1:kwID>
                     <xsl:value-of select='"108"'/>
                  </ns1:kwID>
                  <ns1:kwName>
                     <xsl:value-of select="local-name(/ns0:CrearActividadBPMMsjSol/ns0:TipoReferencia)"/>
                  </ns1:kwName>
                  <ns1:kwValue>
                     <xsl:value-of select="/ns0:CrearActividadBPMMsjSol/ns0:TipoReferencia"/>
                  </ns1:kwValue>
               </ns1:OBKeyword>
            </xsl:if>
            <xsl:if test="/ns0:CrearActividadBPMMsjSol/ns0:NumReferencia">
               <ns1:OBKeyword>
                  <ns1:kwID>
                     <xsl:value-of select='"109"'/>
                  </ns1:kwID>
                  <ns1:kwName>
                     <xsl:value-of select="local-name(/ns0:CrearActividadBPMMsjSol/ns0:NumReferencia)"/>
                  </ns1:kwName>
                  <ns1:kwValue>
                     <xsl:value-of select="/ns0:CrearActividadBPMMsjSol/ns0:NumReferencia"/>
                  </ns1:kwValue>
               </ns1:OBKeyword>
            </xsl:if>
         </tns:oKWord>
      </tns:OBDocCreate>
   </xsl:template>
</xsl:stylesheet>
