<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="3.0" encoding="UTF-8" omit-xml-declaration="yes" indent="yes"/>
	<!-- <xsl:strip-space elements="*"/> -->

	<!-- identity transform -->
	<xsl:template match="@* | node()">
		 <xsl:copy>
			  <xsl:apply-templates select="Правило|Группа">
					<xsl:sort select="Код"/>
			  </xsl:apply-templates>			  
			  <xsl:apply-templates select="@* | node()[not(self::Правило | self::Группа)]"/>
		 </xsl:copy>
	</xsl:template>

<xsl:template match="*[not(comment() | processing-instruction() | *)][normalize-space(text()) = '']">
    <xsl:element name="{name()}" namespace="{namespace-uri()}">
        <xsl:for-each select="@* | namespace::*">
            <xsl:copy/>
        </xsl:for-each>
    </xsl:element>
</xsl:template>

	<!--<xsl:template match="Параметры">
		 <xsl:copy>
			  <xsl:apply-templates select="Параметр">
					<xsl:sort select="@Имя" order="ascending"/>
			  </xsl:apply-templates>
		 </xsl:copy>
	</xsl:template>-->
	
	<xsl:template match="Группа">
		 <xsl:copy>
			  <xsl:apply-templates select="@* | *[not(self::Правило | self::Свойство)]"/>
			  <xsl:apply-templates select="Правило|Свойство">
					<xsl:sort select="Код"/>
			  </xsl:apply-templates>
		 </xsl:copy>
	</xsl:template>
	
	<xsl:template match="Свойства">
		 <xsl:copy>
			  <xsl:apply-templates select="@* | *[not(self::Группа | self::Свойство)]"/>
			  <xsl:apply-templates select="Группа">
					<xsl:sort select="Код"/>
			  </xsl:apply-templates>
			  <xsl:apply-templates select="Свойство">
					<xsl:sort select="Код"/>
			  </xsl:apply-templates>
		 </xsl:copy>
	</xsl:template>

</xsl:stylesheet>