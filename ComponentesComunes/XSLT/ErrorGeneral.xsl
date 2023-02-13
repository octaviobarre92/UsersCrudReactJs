<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" 
exclude-result-prefixes="xs fn">
	<xsl:param name="bm.tns" />
	<xsl:param name="operation" />
	<xsl:param name="status" />
	<xsl:param name="descripcion"/>
	<xsl:param name="componente"/>        
	<xsl:param name="codigoError"/>
	<xsl:param name="detalleError"/>	
        <xsl:param name="mensajeError"/>
        <xsl:param name="location"/>
	<xsl:template match="/">
		<xsl:element name="tns:{$operation}MsjResp" namespace="{$bm.tns}">
			<xsl:element name="CabeceraResp"  namespace="{$bm.tns}">
				<xsl:element name="EstadoGeneral"   namespace="http://xmlns.sura.com/ObjetoEmpresarial/DominioComun/Comun/V1">
                                    <xsl:element name="Status"  namespace="http://xmlns.sura.com/ObjetoEmpresarial/DominioComun/Comun/V1">
                                            <xsl:value-of select="$status" />
                                    </xsl:element>
                                    <xsl:element name="Descripcion"  namespace="http://xmlns.sura.com/ObjetoEmpresarial/DominioComun/Comun/V1">
                                            <xsl:value-of select="$descripcion" />
                                    </xsl:element>
                                    <xsl:element name="Componente" namespace="http://xmlns.sura.com/ObjetoEmpresarial/DominioComun/Comun/V1">
                                            <xsl:value-of select="$componente" />
                                    </xsl:element>
                                </xsl:element>	                                     
                                <xsl:element name="EstadosPorRegistro" namespace="http://xmlns.sura.com/ObjetoEmpresarial/DominioComun/Comun/V1">
                                    <xsl:element name="Estado" namespace="http://xmlns.sura.com/ObjetoEmpresarial/DominioComun/Comun/V1">
                                        <xsl:element name="Status"  namespace="http://xmlns.sura.com/ObjetoEmpresarial/DominioComun/Comun/V1">
                                                <xsl:value-of select="$status" />
                                        </xsl:element>
                                        <xsl:element name="Descripcion"  namespace="http://xmlns.sura.com/ObjetoEmpresarial/DominioComun/Comun/V1">
                                                <xsl:value-of select="$mensajeError" />
                                        </xsl:element>
                                        <xsl:element name="Componente" namespace="http://xmlns.sura.com/ObjetoEmpresarial/DominioComun/Comun/V1">
                                                <xsl:value-of select="$location" />
                                        </xsl:element>
                                        <xsl:element name="EstadosDetalle" namespace="http://xmlns.sura.com/ObjetoEmpresarial/DominioComun/Comun/V1">
                                            <xsl:element name="EstadoDetalle" namespace="http://xmlns.sura.com/ObjetoEmpresarial/DominioComun/Comun/V1">
                                                <xsl:element name="Codigo" namespace="http://xmlns.sura.com/ObjetoEmpresarial/DominioComun/Comun/V1">
                                                        <xsl:value-of select="$codigoError" />
                                                </xsl:element>
                                                <xsl:element name="Descripcion" namespace="http://xmlns.sura.com/ObjetoEmpresarial/DominioComun/Comun/V1">
                                                        <xsl:value-of select="$mensajeError" />
                                                </xsl:element>
                                            </xsl:element>        
                                        </xsl:element>
                                    </xsl:element>
                                </xsl:element>
			</xsl:element>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
