<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt">


  <xsl:param name="mode"></xsl:param>
  <xsl:param name="siteName"></xsl:param>
  <xsl:param name="siteID"></xsl:param>
  <xsl:param name="siteURL"></xsl:param>
  <xsl:param name="siteCount"></xsl:param>
  <xsl:param name="includeBackButton">true</xsl:param>
  <xsl:param name="SchemeAndDomain">https://www.waiverfile.com</xsl:param>


  <xsl:param name="service"></xsl:param>
  
  <xsl:output method="xml" omit-xml-declaration="yes"/>

  <xsl:template match="/">

    <xsl:variable name="itemNamePlural">
      <xsl:choose>
        <xsl:when test="$service='SMS'">Messages</xsl:when>
        <xsl:otherwise>Waivers</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    
    <xsl:choose>
      <xsl:when test="$mode='ONE_SITE'">

        <h4>
          <xsl:value-of select="$siteName"/>
          <xsl:text> </xsl:text>
          <small>(<a href="{$SchemeAndDomain}/b/{$siteURL}" target="_blank">
            <xsl:value-of select="$SchemeAndDomain"/>
            <xsl:text>/b/</xsl:text>
            <xsl:value-of select="$siteURL"/>)
          </a>
          </small>
        </h4>
          <table class="table table-condensed">
            <thead>
              <tr>
                <th>Period Begins</th>
                <th>Period Ends</th>
                <th>
                  <xsl:value-of select="$itemNamePlural"/> Included
                <xsl:if test="$siteCount &gt; 1">
                  <xsl:text> (shared across all sites)</xsl:text>
                </xsl:if>
                </th>
                <th>
                  <xsl:value-of select="$itemNamePlural"/> Used</th>
              </tr>
            </thead>
            <tbody>
              <xsl:for-each select="/ArrayOfWFSubscriptionPeriod/WFSubscriptionPeriod">
                <tr>
                  <td>
                    <xsl:value-of select="dt:format-date(PeriodBegins,'MMMM d, yyyy')"/>
                  </td>
                  <td>
                    <xsl:value-of select="dt:format-date(PeriodEnds,'MMMM d, yyyy')"/>
                  </td>
                  <td>
                    <xsl:choose>
                      <xsl:when test="NumIncludedTotal=-1">
                        Unlimited
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="NumIncludedTotal"/>
                      </xsl:otherwise>
                    </xsl:choose>
                    
                  </td>
                  <td>
                    <xsl:value-of select="NumUsedForSelectedSite"/>
                  </td>

                </tr>
              </xsl:for-each>
            </tbody>
          </table>
      
      </xsl:when>
      <xsl:when test="$mode='ENTIRE_SUBSCRIPTION'">
        
        <h3>
          <xsl:choose>
            <xsl:when test="$siteCount&gt;1">Combined Usage For All Sites</xsl:when>
            <xsl:otherwise>Subscription Usage</xsl:otherwise>
          </xsl:choose>
        </h3>
        <xsl:if test="$includeBackButton='true'">
        <div class="pull-right">
          <a href="Subscription.aspx" class="btn btn-default">Back to Subscription Overview</a>
        </div>
        </xsl:if>
        <table class="table table-condensed">
          <thead>
            <tr>
              <th>Period Begins</th>
              <th>Period Ends</th>
              <th>
                <xsl:value-of select="$itemNamePlural"/> Included</th>
              <th>
                <xsl:value-of select="$itemNamePlural"/> Used</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="/ArrayOfWFSubscriptionPeriod/WFSubscriptionPeriod">
              <tr>
                <td><xsl:value-of select="dt:format-date(PeriodBegins,'MMMM d, yyyy')"/></td>
                <td><xsl:value-of select="dt:format-date(PeriodEnds,'MMMM d, yyyy')"/></td>
                <td>
                  <xsl:choose>
                    <xsl:when test="NumIncludedTotal=-1">
                      Unlimited
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="NumIncludedTotal"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </td>
                <td><xsl:value-of select="NumUsed"/></td>
                
              </tr>
            </xsl:for-each>
          </tbody>
        </table>

      </xsl:when>
      
    </xsl:choose>

    
    
  </xsl:template>
</xsl:stylesheet>
