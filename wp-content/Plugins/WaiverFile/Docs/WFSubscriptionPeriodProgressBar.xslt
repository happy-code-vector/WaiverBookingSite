<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:math="http://exslt.org/math" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt math">

  <xsl:output method="html" omit-xml-declaration="yes"/>


  <xsl:template match="/">
    <!--
    <xsl:copy-of select="/"></xsl:copy-of>
    -->
   
        <xsl:for-each select="//WFSubscriptionPeriod">
          <hr/>
          <div class="row">
            <div class="col-xs-4">
              <strong>
                <xsl:value-of select="dt:format-date(PeriodBegins,'M/d/yyyy')"/>
                <xsl:text> - </xsl:text>
                <xsl:value-of select="dt:format-date(PeriodEnds,'M/d/yyyy')"/>
              </strong>
            
            </div>
           

            <div class="col-xs-5">

              <xsl:variable name="periodExpired">
                <xsl:choose>
                  <xsl:when test="substring(translate(PeriodBegins,'-',''), 1, 8) &gt; substring(translate(../../../../ExpirationDate,'-',''),1, 8)">true</xsl:when>
                  <xsl:otherwise>false</xsl:otherwise>
                </xsl:choose>
              </xsl:variable>

              
              <xsl:variable name="percent">
                <xsl:value-of select="round(NumUsed div NumIncludedTotal * 100)"/>
              </xsl:variable>
              <xsl:variable name="percentmax100">
                <xsl:choose>
                  <xsl:when test="NumUsed=0">0</xsl:when>
                  <xsl:when test="round(NumUsed div NumIncludedTotal * 100) &gt; 100">100</xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="round(NumUsed div NumIncludedTotal * 100)"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:variable>

              <xsl:choose>
                <xsl:when test="NumIncluded&lt;=0">
                  <xsl:text> </xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <div class="progress">
                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="{$percent}" aria-valuemin="0" aria-valuemax="100" style="min-width: 2em; width: {$percentmax100}%;">
                      <xsl:choose>
                        <xsl:when test="$percent &gt; 100  or $periodExpired='true'">
                          <xsl:attribute name="class">progress-bar progress-bar-danger</xsl:attribute>
                        </xsl:when>
                      </xsl:choose>
                      <!-- THIS OPTION RUNS IT AS WARNING/ERROR AT 85/95 PERCENT. USE THIS FOR CLIENT-FACING. CHANGING TO ONLY SHOW RED OVER 100 FOR INTERNAL.
                        <xsl:choose>
                        <xsl:when test="$percent &gt;= 85 and $percent &lt; 95">
                        <xsl:attribute name="class">progress-bar progress-bar-warning</xsl:attribute>
                        </xsl:when>
                        <xsl:when test="$percent &gt;= 95">
                        <xsl:attribute name="class">progress-bar progress-bar-danger</xsl:attribute>
                        </xsl:when>
                        </xsl:choose>
                      -->
                      <xsl:choose>
                        <xsl:when test="$percent &gt; 100">
                          <xsl:text>Over by </xsl:text>
                          <xsl:value-of select="NumUsed - NumIncludedTotal"/>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:value-of select="$percent"/>%
                        </xsl:otherwise>
                      </xsl:choose>

                    </div>
                  </div>

                </xsl:otherwise>
              </xsl:choose>


            </div>
            <div class="col-xs-3">
               <xsl:value-of select="NumUsed"/>
              <xsl:text> of </xsl:text>
              <xsl:value-of select="NumIncludedTotal"/>
              <xsl:text></xsl:text>
            </div>
          
          </div>





        </xsl:for-each>
        
      <hr/>


  </xsl:template>
</xsl:stylesheet>
