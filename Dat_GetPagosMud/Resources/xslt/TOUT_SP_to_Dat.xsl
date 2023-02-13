<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:tns="http://www.sura.com/GetPagos" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:ns0="http://xmlns.oracle.com/pcbpel/adapter/db/sp/sp_GetPagosMud" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction"
                xmlns:nxsd="http://xmlns.oracle.com/pcbpel/nxsd">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="XSD">
            <oracle-xsl-mapper:schema location="../Database/sp_GetPagosMud_sp.xsd"/>
            <oracle-xsl-mapper:rootElement name="OutputParameters" namespace="http://xmlns.oracle.com/pcbpel/adapter/db/sp/sp_GetPagosMud"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="XSD">
            <oracle-xsl-mapper:schema location="../nxsd/RsGetPagosMud.xsd"/>
            <oracle-xsl-mapper:rootElement name="OBJETO_GETPAGOS" namespace="http://www.sura.com/GetPagos"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.4.0(XSLT Build 190828.0353.3300) AT [SUN NOV 08 22:13:05 COT 2020].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:param name="codigoOperacion"/>
   <xsl:param name="fechaProcesamiento"/>
   <xsl:param name="fechaTransaccion"/>
   <xsl:param name="idTransaccion"/>
   <xsl:param name="sistemaDestino"/>
   <xsl:param name="sistemaOrigen"/>
   <xsl:param name="componente"/>
   <xsl:param name="origen"/>
   <xsl:template match="/">
      <tns:OBJETO_GETPAGOS>
         <tns:CABECERA>
            <xsl:if test="$fechaTransaccion">
               <tns:FECHA_TRANSACCION>
                  <xsl:value-of select="$fechaTransaccion"/>
               </tns:FECHA_TRANSACCION>
            </xsl:if>
            <xsl:if test="$sistemaDestino">
               <tns:SISTEMA_DESTINO>
                  <xsl:value-of select="$sistemaDestino"/>
               </tns:SISTEMA_DESTINO>
            </xsl:if>
            <xsl:if test="$sistemaOrigen">
               <tns:SISTEMA_ORIGEN>
                  <xsl:value-of select="$sistemaOrigen"/>
               </tns:SISTEMA_ORIGEN>
            </xsl:if>
            <xsl:if test="$idTransaccion">
               <tns:ID_TRANSACCION_OSB>
                  <xsl:value-of select="$idTransaccion"/>
               </tns:ID_TRANSACCION_OSB>
            </xsl:if>
            <xsl:if test="$fechaProcesamiento">
               <tns:FECHA_PROCESAMIENTO>
                  <xsl:value-of select="$fechaProcesamiento"/>
               </tns:FECHA_PROCESAMIENTO>
            </xsl:if>
            <xsl:if test="$codigoOperacion">
               <tns:CODIGO_OPERACION>
                  <xsl:value-of select="$codigoOperacion"/>
               </tns:CODIGO_OPERACION>
            </xsl:if>
            <tns:PAGINACION>
               <xsl:if test="/ns0:OutputParameters/ns0:totalPages">
                  <tns:CANTIDAD_DE_PAGINAS>
                     <xsl:value-of select="/ns0:OutputParameters/ns0:totalPages"/>
                  </tns:CANTIDAD_DE_PAGINAS>
               </xsl:if>
            </tns:PAGINACION>
         </tns:CABECERA>
         <tns:STATUS>
            <xsl:if test="/ns0:OutputParameters/ns0:descMSG">
               <tns:DETALLE>
                  <xsl:value-of select="/ns0:OutputParameters/ns0:descMSG"/>
               </tns:DETALLE>
            </xsl:if>
            <xsl:if test="/ns0:OutputParameters/ns0:statusMSG">
               <tns:CODIGO>200</tns:CODIGO>
            </xsl:if>
            <xsl:if test="$componente">
               <tns:COMPONENTE>
                  <xsl:value-of select="$componente"/>
               </tns:COMPONENTE>
            </xsl:if>
            <xsl:if test="$origen">
               <tns:ORIGEN>
                  <xsl:value-of select="$origen"/>
               </tns:ORIGEN>
            </xsl:if>
         </tns:STATUS>
         <xsl:for-each select="/ns0:OutputParameters/ns0:RowSet/ns0:Row">
            <tns:INFO_PAGO>
               <xsl:if test="ns0:Column[@name='Cod_corredor']">
                  <tns:COD_CORREDOR>
                     <xsl:value-of select="ns0:Column[@name='Cod_corredor']"/>
                  </tns:COD_CORREDOR>
               </xsl:if>
               <xsl:if test="ns0:Column[@name='Nro_Recibo']">
                  <tns:NUMERO_RECIBO>
                     <xsl:value-of select="ns0:Column[@name='Nro_Recibo']"/>
                  </tns:NUMERO_RECIBO>
               </xsl:if>
               <xsl:if test="ns0:Column[@name='Pagado']">
                  <tns:MONTO>
                     <xsl:value-of select="ns0:Column[@name='Pagado']"/>
                  </tns:MONTO>
               </xsl:if>
               <xsl:if test="ns0:Column[@name='IsDirecto']">
                  <tns:DIRECTO>
                     <xsl:value-of select="ns0:Column[@name='IsDirecto']"/>
                  </tns:DIRECTO>
               </xsl:if>
               <xsl:if test="ns0:Column[@name='Comision']">
                  <tns:COMISION>
                     <xsl:value-of select="ns0:Column[@name='Comision']"/>
                  </tns:COMISION>
               </xsl:if>
               <xsl:if test="ns0:Column[@name='Porc_comision']">
                  <tns:PORCENTAJE_COMISION>
                     <xsl:value-of select="ns0:Column[@name='Porc_comision']"/>
                  </tns:PORCENTAJE_COMISION>
               </xsl:if>
               <xsl:if test="ns0:Column[@name='Fecha_pago']">
                  <tns:FECHA_PAGO>
                     <xsl:value-of select="ns0:Column[@name='Fecha_pago']"/>
                  </tns:FECHA_PAGO>
               </xsl:if>
               <tns:OBJETO_POLIZA>
                  <xsl:if test="ns0:Column[@name='Cod_ramo']">
                     <tns:COD_RAMO>
                        <xsl:value-of select="ns0:Column[@name='Cod_ramo']"/>
                     </tns:COD_RAMO>
                  </xsl:if>
                  <xsl:if test="ns0:Column[@name='Ramo']">
                     <tns:DESC_RAMO>
                        <xsl:value-of select="ns0:Column[@name='Ramo']"/>
                     </tns:DESC_RAMO>
                  </xsl:if>
                  <xsl:if test="ns0:Column[@name='Nro_poliza']">
                     <tns:NUMERO_POLIZA>
                        <xsl:value-of select="ns0:Column[@name='Nro_poliza']"/>
                     </tns:NUMERO_POLIZA>
                  </xsl:if>
                  <xsl:if test="ns0:Column[@name='Fecha_desde']">
                     <tns:VIGENCIA_DESDE>
                        <xsl:value-of select="ns0:Column[@name='Fecha_desde']"/>
                     </tns:VIGENCIA_DESDE>
                  </xsl:if>
                  <xsl:if test="ns0:Column[@name='Fecha_hasta']">
                     <tns:VIGENCIA_HASTA>
                        <xsl:value-of select="ns0:Column[@name='Fecha_hasta']"/>
                     </tns:VIGENCIA_HASTA>
                  </xsl:if>
                  <xsl:if test="ns0:Column[@name='Id_poliza']">
                     <tns:ID_POLIZA>
                        <xsl:value-of select="ns0:Column[@name='Id_poliza']"/>
                     </tns:ID_POLIZA>
                  </xsl:if>
                  <xsl:if test="ns0:Column[@name='Poliza_inicial']">
                     <tns:NUMERO_POLIZA_INICIAL>
                        <xsl:value-of select="ns0:Column[@name='Poliza_inicial']"/>
                     </tns:NUMERO_POLIZA_INICIAL>
                  </xsl:if>
                  <xsl:if test="ns0:Column[@name='Poliza_secuencia']">
                     <tns:SECUENCIAL_POLIZA>
                        <xsl:value-of select="ns0:Column[@name='Poliza_secuencia']"/>
                     </tns:SECUENCIAL_POLIZA>
                  </xsl:if>
               </tns:OBJETO_POLIZA>
               <tns:CONTRATANTE>
                  <xsl:if test="ns0:Column[@name='Id_cont']">
                     <tns:ID_CONTRATANTE>
                        <xsl:value-of select="ns0:Column[@name='Id_cont']"/>
                     </tns:ID_CONTRATANTE>
                  </xsl:if>
                  <xsl:if test="ns0:Column[@name='Nombre_cont']">
                     <tns:NOMBRE>
                        <xsl:value-of select="ns0:Column[@name='Nombre_cont']"/>
                     </tns:NOMBRE>
                  </xsl:if>
                  <xsl:if test="ns0:Column[@name='Apellido_cont']">
                     <tns:APELLIDO>
                        <xsl:value-of select="ns0:Column[@name='Apellido_cont']"/>
                     </tns:APELLIDO>
                  </xsl:if>
                  <xsl:if test="ns0:Column[@name='Razon_social_cont']">
                     <tns:RAZON_SOCIAL>
                        <xsl:value-of select="ns0:Column[@name='Razon_social_cont']"/>
                     </tns:RAZON_SOCIAL>
                  </xsl:if>
                  <xsl:if test="ns0:Column[@name='Id_tipo_persona_cont']">
                     <tns:TIPO_PERSONA>
                        <xsl:value-of select="ns0:Column[@name='Id_tipo_persona_cont']"/>
                     </tns:TIPO_PERSONA>
                  </xsl:if>
                  <xsl:if test="ns0:Column[@name='Identificacion_cont']">
                     <tns:NUMERO_IDENTIFICACION>
                        <xsl:value-of select="ns0:Column[@name='Identificacion_cont']"/>
                     </tns:NUMERO_IDENTIFICACION>
                  </xsl:if>
               </tns:CONTRATANTE>
               <tns:PERSONA_ASEGURADA>
                  <xsl:if test="ns0:Column[@name='Id_aseg']">
                     <tns:ID_ASEGURADO>
                        <xsl:value-of select="ns0:Column[@name='Id_aseg']"/>
                     </tns:ID_ASEGURADO>
                  </xsl:if>
                  <xsl:if test="ns0:Column[@name='Razon_social_aseg']">
                     <tns:RAZON_SOCIAL_ASEGURADO>
                        <xsl:value-of select="ns0:Column[@name='Razon_social_aseg']"/>
                     </tns:RAZON_SOCIAL_ASEGURADO>
                  </xsl:if>
                  <xsl:if test="ns0:Column[@name='Id_tipo_persona_aseg']">
                     <tns:ID_TIPO_PERSONA>
                        <xsl:value-of select="ns0:Column[@name='Id_tipo_persona_aseg']"/>
                     </tns:ID_TIPO_PERSONA>
                  </xsl:if>
                  <xsl:if test="ns0:Column[@name='Nombre_aseg']">
                     <tns:NOMBRE>
                        <xsl:value-of select="ns0:Column[@name='Nombre_aseg']"/>
                     </tns:NOMBRE>
                  </xsl:if>
                  <xsl:if test="ns0:Column[@name='Apellido_aseg']">
                     <tns:APELLIDO>
                        <xsl:value-of select="ns0:Column[@name='Apellido_aseg']"/>
                     </tns:APELLIDO>
                  </xsl:if>
                  <xsl:if test="ns0:Column[@name='Identificacion_aseg']">
                     <tns:NUMERO_IDENTIFICACION>
                        <xsl:value-of select="ns0:Column[@name='Identificacion_aseg']"/>
                     </tns:NUMERO_IDENTIFICACION>
                  </xsl:if>
               </tns:PERSONA_ASEGURADA>
            </tns:INFO_PAGO>
         </xsl:for-each>
      </tns:OBJETO_GETPAGOS>
   </xsl:template>
</xsl:stylesheet>
