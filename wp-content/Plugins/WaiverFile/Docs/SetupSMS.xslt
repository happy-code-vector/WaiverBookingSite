<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:asp="remove" xmlns:str="http://exslt.org/strings" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt">

  <xsl:output method="html" omit-xml-declaration="yes"/>


  
  <xsl:template match="/">

    <xsl:if test="count(/ArrayOfTwilioAvailableNumber/TwilioAvailableNumber)=0">
      
    </xsl:if>

    <table class="table">
    <xsl:for-each select="/ArrayOfTwilioAvailableNumber/TwilioAvailableNumber">
      <tr>
        <td>
          <xsl:value-of select="FriendlyName"/>
        </td>
        <td>
          <xsl:value-of select="Locality"/>
        </td>
        <td>
          
          <xsl:value-of select="Region"/>
        </td>
        <td>
          <xsl:value-of select="IsoCountry"/>
        </td>
        <td>
          <a href="" class="btnSelectNum btn btn-primary" data-num="{PhoneNumber}" data-friendlyname="{FriendlyName}">Select</a>
          
        </td>
        
      </tr>
    </xsl:for-each>

    </table>
   
  </xsl:template>

  
</xsl:stylesheet>
