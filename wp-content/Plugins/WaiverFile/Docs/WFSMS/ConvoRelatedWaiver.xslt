<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="remove" xmlns:dt="http://exslt.org/dates-and-times"
    xmlns:cc1="remove" exclude-result-prefixes="cc1">

  
  <xsl:param name="DateFormat"></xsl:param>
  <xsl:param name="TimeZoneName"></xsl:param>
  
  <xsl:output method="xml"/>

  <xsl:template match="/Waiver">


    <table class="table">
      <tr>
        <td>
          <label>Name</label>
        </td>
        <td>
          <xsl:value-of select="SignedNameFirst"/>
          <xsl:text> </xsl:text>
          <xsl:value-of select="SignedName"/>
        </td>
      </tr>
      <xsl:if test="Email!=''">
        <tr>
          <td>
            <label>Email</label>
          </td>
          <td> <a href="mailto:{Email}">
                  <xsl:value-of select="Email"/>
                </a></td>
      </tr>
      </xsl:if>
      <tr>
        <td>
          <label>Date Signed</label>
        </td>
        <td>
          <xsl:choose>
          <xsl:when test="$DateFormat=''">
            <xsl:value-of select="dt:format-date(DateSigned,'MMMM d, yyyy h:mm a')"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:variable name="combined_format_str">
              <xsl:value-of select="$DateFormat"></xsl:value-of>
              <xsl:text> h:mm a</xsl:text>
            </xsl:variable>
            <xsl:value-of select="dt:format-date(DateSigned,$combined_format_str)"/>

          </xsl:otherwise>
          </xsl:choose>
          <xsl:text> </xsl:text>
          <xsl:value-of select="$TimeZoneName"/>
        </td>
      </tr>
      <xsl:if test="count(Particpants/WaiverParticipant[IsSignee!='true'])!=0">
      <tr>
        <td colspan="2">
          <strong>Participants</strong>
        </td>
      </tr>
        </xsl:if>
        <xsl:for-each select="Particpants/WaiverParticipant[IsSignee!='true']">
          <tr>
            <td colspan="2"> <xsl:value-of select="ParticipantNameFirst"/>
                        <xsl:if test="ParticipantNameFirst!=''">
                          <xsl:text> </xsl:text>
                        </xsl:if>
                        <xsl:value-of select="ParticipantName"/></td>
            <td></td>
          
          </tr>
        </xsl:for-each>
      
    </table>
  
    
    <a href="../ViewWaiver.aspx?id={WaiverID}" class="btn btn-default">View Waiver</a>
    
    

    

  </xsl:template>

</xsl:stylesheet>