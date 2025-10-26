<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt">

  <xsl:output method="html" omit-xml-declaration="yes"/>

 

  <xsl:template match="/">

    <xsl:for-each select="/ArrayOfWaiverEventCategory/WaiverEventCategory">

      <a href="PartySelect.aspx?catid={ID}" class="btn btn-lg btn-light">
        <xsl:value-of select="Name"/>
      </a>

    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
