<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:set="http://exslt.org/sets"
                xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt set">

  <xsl:output method="html" omit-xml-declaration="yes"/>



  <xsl:template match="/">

    <xsl:if test="count(/ArrayOfWaiverEvent/WaiverEvent)=0">
      <p>
        <strong>No events found</strong>
      </p>
    </xsl:if>
    <table class="table table-condensed">
      <xsl:for-each select="/ArrayOfWaiverEvent/WaiverEvent">
        <tr>
          <td>
            <xsl:value-of select="Name"/>
          </td>
          <td><xsl:value-of select="TimeLabel"/></td>
          <td>
            <a href="javascript:void(0);" class="selectevent btn btn-primary btn-sm" data-evtid="{WaiverEventID}" data-evtname="{Name} - {TimeLabel}">Select</a>
          </td>
        </tr>
      </xsl:for-each>
    </table>
    
    
  </xsl:template>
</xsl:stylesheet>
