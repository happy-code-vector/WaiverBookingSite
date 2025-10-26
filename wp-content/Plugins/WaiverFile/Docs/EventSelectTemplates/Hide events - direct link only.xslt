<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt">

  <xsl:output method="html" omit-xml-declaration="yes"/>

  <xsl:param name="ShowMore"></xsl:param>
  <xsl:param name="Today"></xsl:param>
  <xsl:param name="Tomorrow"></xsl:param>
  <xsl:param name="DayCutoffHour"></xsl:param>
  <xsl:param name="catid"></xsl:param>
  <!-- this template can be used to hide all upcming events. -->

  <xsl:template match="/">

    <div class="row">
      <div class="container">
        <p>

          Please use a direct link to sign your waiver.

        </p>
      </div>
    </div>


  </xsl:template>
</xsl:stylesheet>
