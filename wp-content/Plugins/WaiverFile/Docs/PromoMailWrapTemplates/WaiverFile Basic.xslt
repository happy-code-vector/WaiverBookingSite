<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:set="http://exslt.org/sets"
                xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt set">

  <xsl:output method="html" omit-xml-declaration="yes"/>

  <xsl:param name="Subject"></xsl:param>
  <xsl:param name="NumIncludedTotal"></xsl:param>
  <xsl:param name="NumUsed"></xsl:param>
  <xsl:param name="AdditionalWaiverPriceEach"></xsl:param>
  <xsl:param name="PeriodEnds"></xsl:param>

  <xsl:template match="/">

    <xsl:variable name="UnsubscribeUrl">
      <xsl:text>{UnsubscribeUrl}</xsl:text>
    </xsl:variable>

    <html>
      <head>
       
        <title>
          <xsl:value-of select="$Subject"/>
        </title>

      </head>
      <body style="color:#333;font-family: Arial, Helvetica, sans-serif;font-size:14px">

       
          <xsl:value-of select="/Main/PromoMessage/Body" disable-output-escaping="yes"/>


        <xsl:text>{{FOOTER}}</xsl:text>
        <xsl:text>{{SIGNATURE}}</xsl:text>



      </body>
    </html>


  </xsl:template>
</xsl:stylesheet>
