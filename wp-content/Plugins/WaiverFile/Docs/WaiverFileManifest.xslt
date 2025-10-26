<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:set="http://exslt.org/sets" xmlns:str="http://exslt.org/strings" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt set">
    
    <xsl:output method="html" omit-xml-declaration="yes"/>


    
    <xsl:template match="/">
      <html>
        <head>
          <title>WaiverFile Export Table Of Contents</title>
          <link rel="stylesheet" type="text/css" href="includes/bootstrap.min.css"></link>
          <link rel="stylesheet" type="text/css" href="includes/export.css"></link>
        </head>
        <body>





          <!--
      <div class="headerbox">
      todo: display waiver site info here
      </div>-->
          <div class="container">
         
          <div class="widget">
            <h3>
              <img src="includes/waiverfile-logo-sm.gif" alt="WaiverFile"/> Export Table of Contents
            </h3>
            <p>This file shows a listing of all the waiver forms that are part of the enclosed package. </p>
          </div>

         
          
          <table class="table table-condensed">
            <tr>
              
                <th>Participant Name</th>
                <th>Signed Name</th>
                <th>Address</th>
                <th>City</th>
                <th>State</th>
                <th>Zip</th>
                <th>Phone</th>
                <th>DOB</th>
                <th>Email</th>
              <th>View Waiver</th>
              
            </tr>

            <xsl:for-each select="set:distinct(//WaiverEvent/WaiverEventID)">
              <xsl:variable name="evtid">
                <xsl:value-of select="."/>
              </xsl:variable>

  
  <tr>
    <td colspan="10"><strong><xsl:value-of select="//WaiverEvent[WaiverEventID=$evtid]/Name"/>
    <xsl:text> - </xsl:text>
      <xsl:value-of select="//WaiverEvent[WaiverEventID=$evtid]/TimeLabel"/>
    </strong></td>
  </tr>
                <xsl:for-each select="//Waiver[WaiverEventID=$evtid]">
                  <xsl:for-each select="Particpants/WaiverParticipant">

                        <tr>
                          <td>
                            <xsl:value-of select="ParticipantNameFirst"/>
                            <xsl:if test="ParticipantNameFirst!=''">
                              <xsl:text> </xsl:text>
                            </xsl:if>
                            <xsl:value-of select="ParticipantName"/></td>
                          <td>
                            <xsl:value-of select="../../SignedNameFirst"/>
                            <xsl:if test="../../SignedNameFirst!=''">
                              <xsl:text> </xsl:text>
                            </xsl:if><xsl:value-of select="../../SignedName"/></td>
                          <td><xsl:value-of select="../../Address"/></td>
                          <td><xsl:value-of select="../../City"/></td>
                          <td><xsl:value-of select="../../State"/></td>
                          <td><xsl:value-of select="../../Zip"/></td>
                          <td><xsl:value-of select="../../Phone"/></td>
                          <td><xsl:value-of select="../../DOB"/></td>
                          <td>
                            <xsl:if test="../../Email!=''">
                              <a href="mailto:{../../Email}">
                              <xsl:value-of select="../../Email"/>
                              </a>
                            </xsl:if></td>
                          <td>
                            <a href="{../../ExportFileRelativePath}">View Waiver</a>
                          </td>
                        </tr>
                        
                      </xsl:for-each>
                  </xsl:for-each>
              
            </xsl:for-each>
            
          </table>


          </div>

        </body>

      </html>
    </xsl:template>
</xsl:stylesheet>
