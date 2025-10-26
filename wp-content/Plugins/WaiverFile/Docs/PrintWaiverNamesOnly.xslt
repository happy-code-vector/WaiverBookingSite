<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:set="http://exslt.org/sets"
                xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt set">
    
    <xsl:output method="html" omit-xml-declaration="yes"/>

  
    
    <xsl:template match="/">


      <style type="text/css">
        p.breakhere {page-break-before: always}
      </style>


      <xsl:for-each select="set:distinct(//WaiverEvent/WaiverEventID)">
        <xsl:variable name="evtid">
          <xsl:value-of select="."/>
        </xsl:variable>


        <h3>
          Name: <xsl:value-of select="//WaiverEvent[WaiverEventID=$evtid]/Name"/>
        </h3>

        <ul>
          <xsl:for-each select="//WaiverParticipant[../../WaiverEvent/WaiverEventID=$evtid]">
            <xsl:sort select="ParticipantName"/>
            <xsl:sort select="ParticipantNameFirst"/>
            <li>
              <xsl:value-of select="ParticipantNameFirst"/>
              <xsl:if test="ParticipantNameFirst!=''">
                <xsl:text> </xsl:text>
              </xsl:if>
              <xsl:value-of select="ParticipantName"/> - Signed by  <xsl:value-of select="../../SignedNameFirst"/>
              <xsl:if test="../../SignedNameFirst!=''">
                <xsl:text> </xsl:text>
              </xsl:if>
              <xsl:value-of select="../../SignedName"/>
            </li>
          </xsl:for-each>
        </ul>
      </xsl:for-each>
      
     
    </xsl:template>
</xsl:stylesheet>
