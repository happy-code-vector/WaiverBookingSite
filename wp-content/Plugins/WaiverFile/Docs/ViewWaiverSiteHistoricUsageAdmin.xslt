<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt">


  <xsl:param name="mode"></xsl:param>
  <xsl:param name="siteName"></xsl:param>
  <xsl:param name="siteID"></xsl:param>
  <xsl:param name="siteURL"></xsl:param>
  <xsl:param name="siteCount"></xsl:param>
  
    <xsl:output method="xml" omit-xml-declaration="yes"/>

  <xsl:template match="/">



      
    
    <xsl:choose>
      <xsl:when test="$mode='ONE_SITE'">


        <div class="box box-primary">
          <div class="box-header with-border">

            <h3 class="box-title">
              <xsl:value-of select="$siteName"/>
              <xsl:text> </xsl:text>
              <small>
                <a href="https://{$siteURL}" target="_blank">
                  <xsl:value-of select="$siteURL"/>
                </a>
              </small>
            </h3>
          </div>
          <!-- /.box-header -->
          <div class="box-body">

            <table class="table table-condensed">

              <tbody>
                <xsl:for-each select="/ArrayOfWFSubscriptionPeriod/WFSubscriptionPeriod">

                  <xsl:variable name="periodExpired">
                    <xsl:choose>
                      <xsl:when test="substring(translate(PeriodBegins,'-',''), 1, 8) &gt; substring(translate(../../../../ExpirationDate,'-',''),1, 8)">true</xsl:when>
                      <xsl:otherwise>false</xsl:otherwise>
                    </xsl:choose>
                  </xsl:variable>

                  <tr>
                    <td>
                      <strong>
                        <xsl:value-of select="dt:format-date(PeriodBegins,'M/d/yyyy')"/>
                        <xsl:text> - </xsl:text>
                        <xsl:value-of select="dt:format-date(PeriodEnds,'M/d/yyyy')"/>
                      </strong>
                      <xsl:if test="position()=1">
                        <p class="help-block" style="margin:0;">Current Period</p>
                      </xsl:if>
                      <xsl:if test="position()=2">
                        <p class="help-block" style="margin:0;">Previous Period</p>
                      </xsl:if>
                      <xsl:if test="$periodExpired='true'">
                        <strong class="text-danger">* Unpaid</strong>
                      </xsl:if>
                    </td>

                    <td>



                     


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

                    </td>
                    <td>
                      <xsl:value-of select="NumUsed"/>
                      <xsl:text> of </xsl:text>
                      <xsl:value-of select="NumIncludedTotal"/>
                      <xsl:text></xsl:text>
                    </td>
                    <td>
                      <a href="/wp-admin/default.aspx?sc=WF_SUBS_MANAGEPERIOD&amp;id={ID}&amp;c=1" class="btn btn-primary btn-sm">Manage</a>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>


          </div>
        </div>




      </xsl:when>
      <xsl:when test="$mode='ENTIRE_SUBSCRIPTION'">



        <div class="box box-primary">
          <div class="box-header with-border">
            <h3 class="box-title">
              <xsl:choose>
                <xsl:when test="$siteCount&gt;1">Combined Usage For All Sites</xsl:when>
                <xsl:otherwise>Subscription Usage</xsl:otherwise>
              </xsl:choose>
            </h3>
          </div>
          <!-- /.box-header -->
          <div class="box-body">


            <table class="table table-condensed">
              
              <tbody>
                <xsl:for-each select="/ArrayOfWFSubscriptionPeriod/WFSubscriptionPeriod">
                  
                  <xsl:variable name="periodExpired">
                    <xsl:choose>
                      <xsl:when test="substring(translate(PeriodBegins,'-',''), 1, 8) &gt; substring(translate(../../../../ExpirationDate,'-',''),1, 8)">true</xsl:when>
                      <xsl:otherwise>false</xsl:otherwise>
                    </xsl:choose>
                  </xsl:variable>
                  
                  <tr>
                    <td>
                      <strong>
                        <xsl:value-of select="dt:format-date(PeriodBegins,'M/d/yyyy')"/>
                        <xsl:text> - </xsl:text>
                        <xsl:value-of select="dt:format-date(PeriodEnds,'M/d/yyyy')"/>
                      </strong>
                      <xsl:if test="position()=1">
                        <p class="help-block" style="margin:0;">Current Period</p>
                      </xsl:if>
                      <xsl:if test="position()=2">
                        <p class="help-block" style="margin:0;">Previous Period</p>
                      </xsl:if>
                      <xsl:if test="$periodExpired='true'">
                        <strong class="text-danger">* Unpaid</strong>
                      </xsl:if>
                    </td>
                    
                    <td>
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

                      <div class="progress">
                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="{$percent}" aria-valuemin="0" aria-valuemax="100" style="min-width: 2em; width: {$percentmax100}%;">
                          <xsl:choose>
                            <xsl:when test="$percent &gt; 100 or $periodExpired='true'">
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

                    </td>
                    <td>
                      <xsl:value-of select="NumUsed"/>
                      <xsl:text> of </xsl:text>
                      <xsl:value-of select="NumIncludedTotal"/>
                      <xsl:text></xsl:text>
                    </td>
                    <td>
                      <a href="/wp-admin/default.aspx?sc=WF_SUBS_MANAGEPERIOD&amp;id={ID}&amp;c=1" class="btn btn-primary btn-sm">Manage</a>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>

          </div>
        </div>



      </xsl:when>
      
    </xsl:choose>

    
    
  </xsl:template>
</xsl:stylesheet>
