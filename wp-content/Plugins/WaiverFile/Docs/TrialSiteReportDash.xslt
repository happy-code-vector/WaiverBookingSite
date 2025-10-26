<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:diffgr="urn:schemas-microsoft-com:xml-diffgram-v1" xmlns:set="http://exslt.org/sets"
                xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt set">

  <xsl:output method="html" omit-xml-declaration="yes"/>

  <xsl:param name="Now"></xsl:param>
  <xsl:param name="UtcNow"></xsl:param>

  <xsl:template match="/">

    <xsl:variable name="quote">'</xsl:variable>
    <xsl:variable name="quoteESC">\'</xsl:variable>


    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">
          Latest WaiverFile Sites
<span class="addbuttons">
          <a href="?sc=WF_TRIAL_REPORT&amp;c=1" class="ico_chart">Trial Report</a>

          <a href="?sc=WF_USAGE&amp;c=1" class="ico_chart">Usage Report</a>
        </span>  
        </h3>
      </div>
      <!-- /.box-header -->
      <div class="box-body">
    
    <xsl:for-each select="/DataSet/diffgr:diffgram/NewDataSet/Table">

      <div class="panel panel-default">

        <div class="panel-heading">
          <h3 class="panel-title">
            <a href="/wp-admin/default.aspx?sc=WF_EDITCUSTOMER&amp;id={Customer_ID}">
              <xsl:value-of select="Name"/>
            </a>
            <div class="pull-right">
              <a href="https://www.waiverfile.com/b/{Url}" target="_blank">
                waiverfile.com/b/
                <xsl:value-of select="Url"></xsl:value-of>
              </a>
            </div>
          </h3>
        </div>

        <div class="panel-body">

          <div class="row">
            <div class="col-sm-6">
              
              <xsl:value-of select="First_Name"/>
              <xsl:text> </xsl:text>
              <xsl:value-of select="Last_Name"/>
              <xsl:text> </xsl:text><br/>
              <a href="mailto:{email}">
                <xsl:value-of select="email"/>
              </a>
              <br/>
              Waivers Signed: <strong>
                <xsl:value-of select="numSignedWaivers"/>
            </strong><br/>
              Waiver Forms:   <strong>
              <xsl:value-of select="numWaivers"/>
            </strong><br/>
              Events:         <strong><xsl:value-of select="numEvents"/></strong><br/>
            </div>
            <div class="col-sm-6">


              Created
              <strong>
              <xsl:call-template name="timeSince">
                <xsl:with-param name="date">
                  <xsl:value-of select="DateAdded"/>
                </xsl:with-param>
                <xsl:with-param name="now">
                  <xsl:value-of select="$UtcNow"/>
                </xsl:with-param>
              </xsl:call-template>
              </strong>
              <br/>

              Logged in
              <strong>
              <xsl:call-template name="timeSince">
                <xsl:with-param name="date">
                  <xsl:value-of select="Last_Login"/>
                </xsl:with-param>
                <xsl:with-param name="now">
                  <xsl:value-of select="$Now"/>
                </xsl:with-param>
              </xsl:call-template>
              </strong>
              <br/>



              <xsl:variable name="wrapclass">
                <!-- if expired, render text red-->
                <xsl:if test="substring(dt:difference($Now, ExpirationDate),1,1)='-'">
                  text-danger
                </xsl:if>
              </xsl:variable>

              <span class="{$wrapclass}">
                <strong>
              <xsl:call-template name="timeUntilOrSince">
                <xsl:with-param name="date">
                  <xsl:value-of select="ExpirationDate"/>
                </xsl:with-param>
                <xsl:with-param name="now">
                  <xsl:value-of select="$Now"/>
                </xsl:with-param>
                <xsl:with-param name="preTextSince">Expires </xsl:with-param>
                <xsl:with-param name="preTextUntil">Expired </xsl:with-param>
              </xsl:call-template>
                </strong>
              </span>
              <xsl:text>(</xsl:text>
              <xsl:value-of select="dt:month-in-year(ExpirationDate)"/>
              <xsl:text>/</xsl:text>
              <xsl:value-of select="dt:day-in-month(ExpirationDate)"/>
              <xsl:text>/</xsl:text>
              <xsl:value-of select="dt:year(ExpirationDate)"/>
              <xsl:text>)</xsl:text>
              <br/>

              Payments: <strong><xsl:value-of select="numOrders"/>
              </strong><br/>

            
              
            </div>
          </div>

          <xsl:if test="AdminNotes!=''">
          Notes: <strong><xsl:value-of select="AdminNotes"/></strong><br/>
        </xsl:if>
         

        </div>
      </div>
      
    </xsl:for-each>

        <!-- /.box-body -->
      </div>
    </div>


  </xsl:template>


  <xsl:template name="timeUntilOrSince">
    <xsl:param name="now"></xsl:param>
    <xsl:param name="date"></xsl:param>
    <xsl:param name="preTextUntil"></xsl:param>
    <xsl:param name="preTextSince"></xsl:param>

    <xsl:variable name="vDuration">
      <xsl:value-of select="dt:difference($now, $date)"/>
    </xsl:variable>

   
    <xsl:choose>
      <xsl:when test="substring($vDuration,1,1)='-'">
        <xsl:value-of select="$preTextUntil"/>
        <xsl:variable name="vDays"
             select="substring-before(substring-after($vDuration,'P'),'D')"/>
        <xsl:variable name="vHours"
             select="substring-before(substring-after($vDuration,'T'),'H')"/>
        <xsl:variable name="vMinutes"
             select="substring-before(substring-after($vDuration,'H'),'M')"/>
        <xsl:if test="$vDays">
          <xsl:value-of select="concat($vDays,' days ')"/>
        </xsl:if>
          <xsl:if test="$vHours">
            <xsl:value-of select="concat($vHours,' hours ')"/>
          </xsl:if>
          <xsl:if test="$vMinutes">
            <xsl:value-of select="concat($vMinutes,' minutes ')"/>
          </xsl:if>
        <xsl:choose>
          <xsl:when test="$vDays or $vHours or $vMinutes">
            <xsl:text>ago</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>Just now</xsl:text>
          </xsl:otherwise>
        </xsl:choose>

      </xsl:when>
      <xsl:when test="$vDuration=0">Now</xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$preTextSince"/>

        <xsl:variable name="vDurationNeg">
          <xsl:value-of select="dt:difference($date, $now)"/>
        </xsl:variable>
        <xsl:text>in </xsl:text>
        <xsl:variable name="vDays"
           select="substring-before(substring-after($vDurationNeg,'P'),'D')"/>
        <xsl:variable name="vHours"
             select="substring-before(substring-after($vDurationNeg,'T'),'H')"/>
        <xsl:variable name="vMinutes"
             select="substring-before(substring-after($vDurationNeg,'H'),'M')"/>
        <xsl:if test="$vDays">
          <xsl:value-of select="concat($vDays,' days ')"/>
        </xsl:if>
        <xsl:if test="$vDays&lt;=1">
          <xsl:if test="$vHours">
            <xsl:value-of select="concat($vHours,' hours ')"/>
          </xsl:if>
          <xsl:if test="$vMinutes">
            <xsl:value-of select="concat($vMinutes,' minutes ')"/>
          </xsl:if>
        </xsl:if>

      </xsl:otherwise>
    </xsl:choose>




  </xsl:template>

  <xsl:template name="timeSince">
    <xsl:param name="now"></xsl:param>
    <xsl:param name="date"></xsl:param>
    
    <xsl:variable name="vDuration">
      <xsl:value-of select="dt:difference($now, $date)"/>
    </xsl:variable>
    
    <xsl:variable name="vDays"
         select="substring-before(substring-after($vDuration,'P'),'D')"/>
    <xsl:variable name="vHours"
         select="substring-before(substring-after($vDuration,'T'),'H')"/>
    <xsl:variable name="vMinutes"
         select="substring-before(substring-after($vDuration,'H'),'M')"/>
    <xsl:if test="$vDays">
      <xsl:value-of select="concat($vDays,' days ')"/>
    </xsl:if>
    
    <xsl:if test="$vHours">
      <xsl:value-of select="concat($vHours,' hours ')"/>
    </xsl:if>
    <xsl:if test="$vMinutes">
      <xsl:value-of select="concat($vMinutes,' minutes ')"/>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="$vDays or $vHours or $vMinutes">
        <xsl:text>ago</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>Just now</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>




  
</xsl:stylesheet>
