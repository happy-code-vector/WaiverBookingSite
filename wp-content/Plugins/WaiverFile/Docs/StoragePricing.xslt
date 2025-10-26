<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:asp="remove" xmlns:diffgr="urn:schemas-microsoft-com:xml-diffgram-v1" xmlns:set="http://exslt.org/sets"
                xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt set">

  <xsl:output method="html" omit-xml-declaration="yes"/>


  <xsl:template match="/">

    <h3>Add-On Storage Pricing</h3>
    <p>Extra storage is used for add-on services such as custom photo steps. Your account will be billed automatically based on actual usage.</p>
  <table class="table">
    <!-- only showing less than $20/mo. -->
  <xsl:for-each select="/ArrayOfWFSubscriptionAddonServicePriceLevel/WFSubscriptionAddonServicePriceLevel[Price&lt;20]"  >
    <tr>
      <td>
        
        <xsl:text>Up to </xsl:text>
        <xsl:choose>
          <xsl:when test="GBIncluded&gt;=1000">
            <xsl:value-of select="GBIncluded div 1000"/>
            <xsl:text> TB</xsl:text>
          
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="GBIncluded"/>
        <xsl:text> GB</xsl:text>
          
        </xsl:otherwise>
        </xsl:choose>
        
      </td>
      <td>
        <xsl:text>$</xsl:text>
        <xsl:value-of select="Price"/>
      <xsl:text> per month</xsl:text>
      </td>
    </tr>
  
  </xsl:for-each>
    <tr>
      <td colspan="2">
        <a href="https://www.waiverfile.com/Contact.aspx">Contact us</a> if you need space beyond 100 GB
      </td>
    </tr>
  </table>
    
    
  </xsl:template>
</xsl:stylesheet>