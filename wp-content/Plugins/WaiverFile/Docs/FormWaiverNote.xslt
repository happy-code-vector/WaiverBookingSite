<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:diffgr="urn:schemas-microsoft-com:xml-diffgram-v1" xmlns:asp="remove" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt">

  <xsl:param name="TimeZoneName"></xsl:param>
    <xsl:output method="html" omit-xml-declaration="yes"/>
  <xsl:param name="DateFormat"></xsl:param>
  <xsl:param name="BasePathRelative"></xsl:param>
  <xsl:param name="UserRole"></xsl:param>
  <xsl:param name="IncludeButtons">true</xsl:param>
  <xsl:param name="ShowLimitedDataWarning"></xsl:param>
  <xsl:param name="IncludeEditWaiver"></xsl:param>
  <xsl:param name="LoadOriginalVersion"></xsl:param><!-- true -->
  
  <xsl:variable name="DateFormatWithTime">
    <xsl:value-of select="$DateFormat"/>
    <xsl:text> h:mm a</xsl:text>
  </xsl:variable>

  
  <xsl:template match="/">





    <xsl:for-each select="/Main/Waiver">
      <p class="text-muted">
        
        <xsl:text>Adding notes for waiver signed by </xsl:text>
        <xsl:value-of select="SignedNameFirst"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="SignedName"/>
      </p>
    </xsl:for-each>

  </xsl:template>


</xsl:stylesheet>
