<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt">

<xsl:param name="SearchTerms"></xsl:param>
  <xsl:param name="TimeZoneName"></xsl:param>
  <xsl:output method="html" omit-xml-declaration="yes"/>
  <xsl:param name="BasePathRelative"></xsl:param>
  <xsl:param name="BaseUrlAbsolute"></xsl:param>

  <xsl:template match="/">
    <h1>Search Results</h1>
    <p><xsl:value-of select="count(/ArrayOfWaiver/Waiver)"/>
    <xsl:text> result</xsl:text>
      <xsl:if test="count(/ArrayOfWaiver/Waiver)!=1">
        <xsl:text>s</xsl:text>
      </xsl:if>
      <xsl:choose>
        <xsl:when test="$SearchTerms!=''">
          <xsl:text> found for search term: </xsl:text>
          <xsl:value-of select="$SearchTerms"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text> found.</xsl:text>
        </xsl:otherwise>
      </xsl:choose>

    </p>
    
    <table class="table">
      <thead>
        <tr>
          <th>Name</th>
          <th>Participants</th>
          <td>
            <!-- expired column -->
          </td>
          <th>Signed</th>
          <th>Signed By</th>
          <th>View</th>
        </tr>
      </thead>
      <tbody>
    <xsl:for-each select="/ArrayOfWaiver/Waiver">
      <tr>
        <td>
          <xsl:value-of select="Particpants/WaiverParticipant/ParticipantNameFirst"/>
          <xsl:if test="Particpants/WaiverParticipant/ParticipantNameFirst!=''">
            <xsl:text> </xsl:text>
          </xsl:if>
          <xsl:value-of select="Particpants/WaiverParticipant/ParticipantName"/></td>
        <td><xsl:value-of select="count(Particpants/WaiverParticipant)"/></td>
        <td>
          <xsl:if test="Expired='true'">
            <span class="text-danger">
              <i class="fa fa-exclamation-triangle">
                <xsl:text> </xsl:text>
              </i>
              <xsl:text> Expired</xsl:text>
            </span>
          </xsl:if>
        </td>
        <td>
          <xsl:value-of select="dt:format-date(DateSigned,'MMMM d, yyyy h:mm a')"/>
          <xsl:text> </xsl:text>
          <xsl:value-of select="$TimeZoneName"/>
         
        </td>
        
        <td>
          <xsl:value-of select="SignedNameFirst"/>
          <xsl:if test="SignedNameFirst!=''">
            <xsl:text> </xsl:text>
          </xsl:if><xsl:value-of select="SignedName"/></td>
        <td>
          <a href="{$BasePathRelative}/admin/ViewWaiver.aspx?id={WaiverID}">View</a>
        </td>
      </tr>  
    </xsl:for-each>
      </tbody>
    </table>
    
    
  </xsl:template>
</xsl:stylesheet>