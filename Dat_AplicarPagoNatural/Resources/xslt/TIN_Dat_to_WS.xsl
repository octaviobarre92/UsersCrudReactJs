<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:ns0="http://www.sura.com.pa/AplicarPagoNatural" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:tns="urn:com-softwareag-entirex-rpc:SURADESA-WSSAPLEG" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction"
                xmlns:nxsd="http://xmlns.oracle.com/pcbpel/nxsd"
                xmlns:sn0="urn:com-softwareag-entirex-rpc:SURADESA-BORRARDV"
                xmlns:sn1="urn:com-softwareag-entirex-rpc:SURADESA-CUADRADV"
                xmlns:ns1="http://namespace.softwareag.com/entirex/xml/mapping"
                xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/"
                xmlns:EntireX="urn:com.softwareag.entirex.xml.rt"
                xmlns:sn6="urn:com-softwareag-entirex-rpc:SURADESA-CVVALRDI"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
                xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/"
                xmlns:sn5="urn:com-softwareag-entirex-rpc:SURADESA-CVMOVNVA"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:sn7="urn:com-softwareag-entirex-rpc:SURADESA-CARGADEV"
                xmlns:sn2="urn:com-softwareag-entirex-rpc:SURADESA-CVBENONE"
                xmlns:sn4="urn:com-softwareag-entirex-rpc:SURADESA-WSFASUVI"
                xmlns:sn3="urn:com-softwareag-entirex-rpc:SURADESA-CVSALPAO">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="XSD">
            <oracle-xsl-mapper:schema location="../nxsd/RqAplicarPagoNatural.xsd"/>
            <oracle-xsl-mapper:rootElement name="OBJETO_PAGO" namespace="http://www.sura.com.pa/AplicarPagoNatural"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../wsdl/NAT_LABO.wsdl"/>
            <oracle-xsl-mapper:rootElement name="WSSAPLEG" namespace="urn:com-softwareag-entirex-rpc:SURADESA-WSSAPLEG"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.4.0(XSLT Build 190828.0353.3300) AT [SUN MAR 14 09:32:39 COT 2021].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:WSSAPLEG>
         <xsl:if test="/ns0:OBJETO_PAGO/ns0:INFO_PAGO/ns0:ID_RECIBO">
            <ID-RECIBO>
               <xsl:value-of select="/ns0:OBJETO_PAGO/ns0:INFO_PAGO/ns0:ID_RECIBO"/>
            </ID-RECIBO>
         </xsl:if>
         <xsl:if test="/ns0:OBJETO_PAGO/ns0:POLIZA/ns0:RAMO">
            <RAMO>
               <xsl:value-of select="/ns0:OBJETO_PAGO/ns0:POLIZA/ns0:RAMO"/>
            </RAMO>
         </xsl:if>
         <xsl:if test="/ns0:OBJETO_PAGO/ns0:POLIZA/ns0:SUB_RAMO">
            <plan>
               <xsl:value-of select="/ns0:OBJETO_PAGO/ns0:POLIZA/ns0:SUB_RAMO"/>
            </plan>
         </xsl:if>
         <xsl:if test="/ns0:OBJETO_PAGO/ns0:POLIZA/ns0:NUMERO_POLIZA">
            <NU-POLIZA>
               <xsl:value-of select="/ns0:OBJETO_PAGO/ns0:POLIZA/ns0:NUMERO_POLIZA"/>
            </NU-POLIZA>
         </xsl:if>
         <xsl:if test="/ns0:OBJETO_PAGO/ns0:INFO_PAGO/ns0:IMPORTE">
            <IMPORTE>
               <xsl:value-of select="/ns0:OBJETO_PAGO/ns0:INFO_PAGO/ns0:IMPORTE"/>
            </IMPORTE>
         </xsl:if>
         <IMPUESTO>0</IMPUESTO>
         <xsl:if test="/ns0:OBJETO_PAGO/ns0:INFO_PAGO/ns0:TIPO_RECAUDO">
            <TIPO-RECAUDO>
               <xsl:value-of select="/ns0:OBJETO_PAGO/ns0:INFO_PAGO/ns0:TIPO_RECAUDO"/>
            </TIPO-RECAUDO>
         </xsl:if>
         <xsl:if test="/ns0:OBJETO_PAGO/ns0:INFO_PAGO/ns0:CONCEPTO_RECAUDO">
            <CONCEPTO-RECAUDO>
               <xsl:value-of select="/ns0:OBJETO_PAGO/ns0:INFO_PAGO/ns0:CONCEPTO_RECAUDO"/>
            </CONCEPTO-RECAUDO>
         </xsl:if>
         <xsl:if test="/ns0:OBJETO_PAGO/ns0:INFO_PAGO/ns0:FUENTE">
            <FUENTE>
               <xsl:value-of select="/ns0:OBJETO_PAGO/ns0:INFO_PAGO/ns0:FUENTE"/>
            </FUENTE>
         </xsl:if>
         <xsl:if test="/ns0:OBJETO_PAGO/ns0:INFO_PAGO/ns0:FECHA_OPERACION">
            <FE-OPERACION>
               <xsl:value-of select="/ns0:OBJETO_PAGO/ns0:INFO_PAGO/ns0:FECHA_OPERACION"/>
            </FE-OPERACION>
         </xsl:if>
         <xsl:if test="/ns0:OBJETO_PAGO/ns0:POLIZA/ns0:USUARIO">
            <USUARIO>
               <xsl:value-of select="/ns0:OBJETO_PAGO/ns0:POLIZA/ns0:USUARIO"/>
            </USUARIO>
         </xsl:if>
         <COMI-ADELANTADA>0</COMI-ADELANTADA>
         <GASTO-COBRANZA-ADELANTADO>0</GASTO-COBRANZA-ADELANTADO>
         <NU-DIAS-CARTERA>0</NU-DIAS-CARTERA>
         <xsl:if test="/ns0:OBJETO_PAGO/ns0:INFO_PAGO/ns0:NUMERO_CAJA">
            <xsl:choose>
               <xsl:when test="/ns0:OBJETO_PAGO/ns0:INFO_PAGO/ns0:NUMERO_CAJA">
                  <REC-CAJASAP>
                     <xsl:value-of select="/ns0:OBJETO_PAGO/ns0:INFO_PAGO/ns0:NUMERO_CAJA"/>
                  </REC-CAJASAP>
               </xsl:when>
               <xsl:otherwise>
                  <REC-CAJASAP>01</REC-CAJASAP>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:if>
         <xsl:if test="/ns0:OBJETO_PAGO/ns0:ESTRUCTURA_COMERCIAL/ns0:REFERENCIA">
            <NU-RECLAMO>
               <xsl:value-of select="/ns0:OBJETO_PAGO/ns0:ESTRUCTURA_COMERCIAL/ns0:REFERENCIA"/>
            </NU-RECLAMO>
         </xsl:if>
         <TI-REF-ADICIONAL>0</TI-REF-ADICIONAL>
         <NU-REF-ADICIONAL>N</NU-REF-ADICIONAL>
         <xsl:if test="/ns0:OBJETO_PAGO/ns0:POLIZA/ns0:VIGENCIA_DESDE">
            <FE-INI-POLIZA>
               <xsl:value-of select="/ns0:OBJETO_PAGO/ns0:POLIZA/ns0:VIGENCIA_DESDE"/>
            </FE-INI-POLIZA>
         </xsl:if>
         <xsl:if test="/ns0:OBJETO_PAGO/ns0:POLIZA/ns0:VIGENCIA_HASTA">
            <FE-FIN-POLIZA>
               <xsl:value-of select="/ns0:OBJETO_PAGO/ns0:POLIZA/ns0:VIGENCIA_HASTA"/>
            </FE-FIN-POLIZA>
         </xsl:if>
         <xsl:if test="/ns0:OBJETO_PAGO/ns0:INFO_PAGO/ns0:ESTADO_PAGO">
            <REC-STATUS>
               <xsl:value-of select="/ns0:OBJETO_PAGO/ns0:INFO_PAGO/ns0:ESTADO_PAGO"/>
            </REC-STATUS>
         </xsl:if>
         <xsl:if test="/ns0:OBJETO_PAGO/ns0:ESTRUCTURA_COMERCIAL/ns0:SUCURSAL">
            <COMENTARIO-RECAUDO>
               <xsl:value-of select="concat (&quot;SUC&quot;, /ns0:OBJETO_PAGO/ns0:ESTRUCTURA_COMERCIAL/ns0:SUCURSAL )"/>
            </COMENTARIO-RECAUDO>
         </xsl:if>
         <PRONTOPAGO>0</PRONTOPAGO>
         <xsl:if test="/ns0:OBJETO_PAGO/ns0:INFO_PAGO/ns0:TIPO_CUENTA">
            <medio-pago>
               <xsl:value-of select="/ns0:OBJETO_PAGO/ns0:INFO_PAGO/ns0:TIPO_CUENTA"/>
            </medio-pago>
         </xsl:if>
         <DESCUENTO>0</DESCUENTO>
         <DESCRIPCION>RECAUDO PRIMA</DESCRIPCION>
         <xsl:if test="/ns0:OBJETO_PAGO/ns0:TITULAR/ns0:TIPO_IDENTIFICACION">
            <TI-ID-TITULAR>
               <xsl:value-of select="/ns0:OBJETO_PAGO/ns0:TITULAR/ns0:TIPO_IDENTIFICACION"/>
            </TI-ID-TITULAR>
         </xsl:if>
         <xsl:if test="/ns0:OBJETO_PAGO/ns0:TITULAR/ns0:NUMERO_IDENTIFICACION">
            <ID-TITULAR>
               <xsl:value-of select="/ns0:OBJETO_PAGO/ns0:TITULAR/ns0:NUMERO_IDENTIFICACION"/>
            </ID-TITULAR>
         </xsl:if>
      </tns:WSSAPLEG>
   </xsl:template>
</xsl:stylesheet>
