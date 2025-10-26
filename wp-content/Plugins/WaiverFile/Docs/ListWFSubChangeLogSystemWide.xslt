<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:diffgr="urn:schemas-microsoft-com:xml-diffgram-v1" xmlns:set="http://exslt.org/sets"
                xmlns:dt="http://exslt.org/dates-and-times" xmlns:asp="remove" xmlns:telerik="remove" exclude-result-prefixes="str dt set">

  <xsl:output method="html" omit-xml-declaration="yes"/>

 
  
  <xsl:template match="/">

  
    <xsl:variable name="quote">'</xsl:variable>
    <xsl:variable name="quoteESC">\'</xsl:variable>



    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">
          Recent Account Changes
        
       <div class="pull-right">
                <a href="/wp-admin/default.aspx?sc=WFCRM_ACCOUNT_CHANGE_LOG&amp;c=1" class="btn btn-default btn-sm">View Complete History</a>
              </div>
           </h3>     
      </div>
      <!-- /.box-header -->
      <div class="box-body no-padding">
        <xsl:if test="count(/ArrayOfWFSubscriptionChangeLog/WFSubscriptionChangeLog)=0">
          <xsl:attribute name="class">box-body</xsl:attribute>
          <p>No account history found.</p>
        </xsl:if>
        <table class="table table-condensed">
          <thead>
            <tr>
              <th>Date</th>
              <th>Customer</th>
              <th>Change</th>
              <th>Changed By</th>
              <th>Details</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="/ArrayOfWFSubscriptionChangeLog/WFSubscriptionChangeLog">
              <tr>
                <td>
                  <xsl:value-of select="dt:format-date(DateSaved,'MMM d, yyyy h:mm a')"/>
                </td>
                <td>
                  
                  <a href="/wp-admin/default.aspx?sc=EDITCUSTOMER&amp;id={CustomerID}">
                    <xsl:value-of select="CustomerCompany"/>
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="CustomerName"/>
                  </a>
                  
                </td>
                <td>
                  <xsl:value-of select="translate(ChangeAction,'_',' ')"/>
                </td>
                <td>
                  <xsl:choose>
                    <xsl:when test="WPUserID='00000000-0000-0000-0000-000000000000'">
                      System
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="UserDisplayName"/>
                      <xsl:text> (</xsl:text>
                      <a href="mailto:{UserEmail}">
                        <xsl:value-of select="UserEmail"/>
                      </a>
                      <xsl:text>)</xsl:text>
                    </xsl:otherwise>
                  </xsl:choose>

                </td>
                <td>
                  <xsl:value-of select="Details"/>
                </td>
              </tr>

            </xsl:for-each>
          </tbody>
        </table>

      </div>
      <!-- /.box-body -->
    </div>
    
    


    
    

  </xsl:template>

  
  <xsl:template mode="RenderProgress" match="*">

    <div class="table-responsive">
      <table class="table table-condensed table-striped">
        <thead>
          <tr>

            <th class="text-center"></th>
            
            <th class="text-center">Trial</th>
            <th></th>
            <th class="text-center">Forms</th>
            <th></th>
            <th class="text-center">Events</th>
            <th></th>
            <th class="text-center">Signed</th>
            <th></th>
            <th class="text-center">Plan</th>
            <th></th>
            <th class="text-center">Card</th>
            <th></th>
            <th class="text-center">Paid</th>
            
            <th class="text-center"></th>

          </tr>
        </thead>
        <tbody>


          <xsl:for-each select="/Main/DataSet/diffgr:diffgram/NewDataSet/Table">





            <tr>

              <td class="text-center">
                <xsl:text> </xsl:text>
              </td>
              <td class="text-center">
                <!-- trial set up -->
                <small class="badge" rel="tooltip" title="Trial Setup">
                  <xsl:choose>
                    <xsl:when test="Url!=''">
                      <xsl:attribute name="class">badge bg-green</xsl:attribute>
                      <i class="fa fa-check" ></i>
                    </xsl:when>
                    <xsl:otherwise>

                    </xsl:otherwise>
                  </xsl:choose>
                </small>
              </td>
              <td class="text-center">
                <span class="text-muted" style="opacity:0.3;">
                  <i class="fa fa-arrow-right">
                    <xsl:text> </xsl:text>
                  </i>
                </span>
              </td>
              <td class="text-center">
                <!-- number of waiver forms -->
                <span class="badge">
                  <xsl:choose>
                    <xsl:when test="numWaivers&gt;0">
                      <xsl:attribute name="class">badge bg-green</xsl:attribute>
                      <xsl:value-of select="numWaivers"/>
                    </xsl:when>
                    <xsl:otherwise>
                      0
                    </xsl:otherwise>
                  </xsl:choose>
                </span>
              </td>
              <td class="text-center">
                <span class="text-muted" style="opacity:0.3;">
                  <i class="fa fa-arrow-right">
                    <xsl:text> </xsl:text>
                  </i>
                </span>
              </td>
              <td class="text-center">
                <!-- number of events -->
                <span class="badge">
                  <xsl:choose>
                    <xsl:when test="numWaivers&gt;0 or numSignedWaivers &gt; 0 or SelectedPlanPrice&gt;0">
                      <xsl:attribute name="class">badge bg-green</xsl:attribute>
                      <xsl:value-of select="numEvents"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="numEvents"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </span>
              </td>
              <td class="text-center">
                <span class="text-muted" style="opacity:0.3;">
                  <i class="fa fa-arrow-right">
                    <xsl:text> </xsl:text>
                  </i>
                </span>
              </td>
              <td class="text-center">
                <!-- number of signed waivers -->
                <span class="badge">
                  <xsl:choose>
                    <xsl:when test="numSignedWaivers&gt;0">
                      <xsl:attribute name="class">badge bg-green</xsl:attribute>
                      <xsl:value-of select="numSignedWaivers"/>
                    </xsl:when>
                    <xsl:otherwise>0</xsl:otherwise>
                  </xsl:choose>
                </span>
              </td>
              <td class="text-center">
                <span class="text-muted" style="opacity:0.3;">
                  <i class="fa fa-arrow-right">
                    <xsl:text> </xsl:text>
                  </i>
                </span>
              </td>
              <td class="text-center">
                <!-- is a plan selected -->
                <span class="badge">
                  <xsl:choose>
                    <xsl:when test="SelectedPlanPrice&gt;0">
                      <xsl:attribute name="class">badge bg-green</xsl:attribute>
                      <xsl:text>$</xsl:text>
                      <xsl:value-of select="format-number(SelectedPlanPrice,'0')"/>
                      <xsl:choose>
                        <xsl:when test="SelectedPlanBillingInterval=0">Never</xsl:when>
                        <xsl:when test="SelectedPlanBillingInterval=1">/Day</xsl:when>
                        <xsl:when test="SelectedPlanBillingInterval=2">/Week</xsl:when>
                        <xsl:when test="SelectedPlanBillingInterval=3">/Mo</xsl:when>
                        <xsl:when test="SelectedPlanBillingInterval=4">/Qtr</xsl:when>
                        <xsl:when test="SelectedPlanBillingInterval=5">/Year</xsl:when>
                        <xsl:when test="SelectedPlanBillingInterval=6"> One Time</xsl:when>
                        <xsl:when test="SelectedPlanBillingInterval=7">/6 Mos</xsl:when>
                      </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>No</xsl:otherwise>
                  </xsl:choose>
                </span>
              </td>
              <td class="text-center">
                <span class="text-muted" style="opacity:0.3;">
                  <i class="fa fa-arrow-right">
                    <xsl:text> </xsl:text>
                  </i>
                </span>
              </td>
              <td class="text-center">
                <span class="badge">
                  <xsl:choose>
                    <xsl:when test="Last4!=''">
                      <xsl:attribute name="class">badge bg-green</xsl:attribute>
                      <xsl:value-of select="CardType"/>
                    </xsl:when>
                    <xsl:otherwise>No</xsl:otherwise>
                  </xsl:choose>

                </span>
              </td>
              <td class="text-center">
                <span class="text-muted" style="opacity:0.3;">
                  <i class="fa fa-arrow-right">
                    <xsl:text> </xsl:text>
                  </i>
                </span>
              </td>
              <td class="text-center">
                <span class="badge">
                  <xsl:choose>
                    <xsl:when test="orderTotal&gt;0">
                      <xsl:attribute name="class">badge bg-green</xsl:attribute>
                      <xsl:text>$</xsl:text>
                      <xsl:value-of select="orderTotal"/>
                    </xsl:when>
                    <xsl:otherwise>0</xsl:otherwise>
                  </xsl:choose>
                </span>
              </td>

              <td class="text-center">
                <xsl:text> </xsl:text>
              </td>
            
            </tr>





          </xsl:for-each>


        </tbody>
      </table>

      <!-- /.box-body -->
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
