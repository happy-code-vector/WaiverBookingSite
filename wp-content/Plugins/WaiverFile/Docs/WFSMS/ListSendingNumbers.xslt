<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="remove" xmlns:dt="http://exslt.org/dates-and-times"
    xmlns:cc1="remove" exclude-result-prefixes="cc1">

  <xsl:output method="xml"/>

  <xsl:template match="/">

    <h4>
      <xsl:choose>
        <xsl:when test="count(ArrayOfSendingNum/SendingNum)=1">Your SMS Number</xsl:when>
        <xsl:otherwise>Your SMS Numbers</xsl:otherwise>
      </xsl:choose>
      
    </h4>


    <table class="table">
     
      <tbody>
        <xsl:for-each select="ArrayOfSendingNum/SendingNum">
          <xsl:if test="position()!=1">
            <tr>
              <td colspan="2">
                <hr/>
              </td>
            </tr>
          </xsl:if>
          <tr>
            <td>
              <label>Number</label>
            </td>
            <td>
              <xsl:value-of select="FriendlyName"/>
            </td>
          </tr>
          <tr>
            <td>
              <label>Incoming Call Instructions</label>
            </td>
            <td>
              <xsl:value-of select="VoiceResponseFull"/>
            </td>
          </tr>
          
        </xsl:for-each>
      </tbody>
    </table>


  </xsl:template>

</xsl:stylesheet>