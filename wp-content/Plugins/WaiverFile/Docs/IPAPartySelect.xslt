<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt">

  <xsl:output method="html" omit-xml-declaration="yes"/>

  <xsl:param name="ShowMore"></xsl:param>
  <xsl:param name="Today"></xsl:param>

  <xsl:template match="/">

    <div class="row">
    <xsl:for-each select="ArrayOfWaiverEvent/WaiverEvent">
      <div class=" col-xs-6 col-sm-4">
        <a href="" class="btn btn-primary btn-block partyselect">
          <xsl:attribute name="href">
            <xsl:choose>
              <xsl:when test="NumWaiverForms=1">
                <xsl:text>Waiver.aspx?id=</xsl:text>
                <xsl:value-of select="WaiverEventID"/>
               </xsl:when>
              <xsl:otherwise>
                <xsl:text>ChooseWaiver.aspx?eventid=</xsl:text>
                <xsl:value-of select="WaiverEventID"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
          <xsl:value-of select="Name"/>
          <br/>
            <xsl:value-of select="TimeLabel"/>
        </a>
      </div>
      
    </xsl:for-each>
    </div>
    <xsl:if test="count(ArrayOfWaiverEvent/WaiverEvent)=0">
      
      <div class="row">
        <div class="container">
          <p>
            
              Sorry, we have no events scheduled today.
            
          </p>
        </div>
      </div>
      
    </xsl:if>

    <xsl:if test="$ShowMore='True'">
      <div class="row">
        <div class="container">
          <p>
    <a href="?action=showmore" class="btn btn-primary">Show more events</a>
          </p>
        </div>
      </div>
    </xsl:if>


  </xsl:template>
</xsl:stylesheet>
