<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:asp="remove" xmlns:dt="http://exslt.org/dates-and-times"  xmlns:set="http://exslt.org/sets" extension-element-prefixes="dt set">

  <xsl:param name="SchemeAndDomain">https://www.waiverfile.com</xsl:param>
  <xsl:output method="xml" omit-xml-declaration="yes"/>


  <xsl:template match="/WaiverSite">


    <div class="row">

      <div class="col-sm-6">
        <h3>Waiver Plan</h3>

        <div class="well">
          <xsl:call-template name="RenderPlan"></xsl:call-template>
        </div>
      </div>
      <div class="col-sm-6">
        <h3>Text Messaging Plan</h3>

        <div class="well">
          <xsl:choose>
            <xsl:when test="SMSSubscriptionID='00000000-0000-0000-0000-000000000000'">
              <p>No text messaging plan selected.</p>
              <a href="../SMS/SMSDemo.aspx" class="btn btn-primary">Why Add Text Messaging?</a>

            </xsl:when>
            <xsl:otherwise>

              <xsl:call-template name="RenderPlanSMS"></xsl:call-template>

            </xsl:otherwise>
          </xsl:choose>
        </div>
      </div>
      
    </div>
   

  </xsl:template>


  <xsl:template name="RenderPlanSMS">



    <div class="row">
      <div class="col-xs-12">
        <xsl:text> </xsl:text>

        <xsl:if test="count(/WaiverSite)=1">
          <h3>
            <xsl:value-of select="/WaiverSite/Name"/>
          </h3>
        </xsl:if>

        <strong>Plan:</strong>
        <xsl:text> </xsl:text>
        <xsl:value-of select="/WaiverSite/WFSubscription_SMS/Plan/Name"/>
        <xsl:text> - $</xsl:text>
        <xsl:value-of select="format-number(/WaiverSite/WFSubscription_SMS/SelectedPrice/Price,'#,##0.##')"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="/WaiverSite/WFSubscription_SMS/SelectedPrice/QuotaInterval"/>
        <br/>
        <strong>Status:</strong>
        <xsl:text> </xsl:text>
        <span style="font-weight:700;">
          <xsl:attribute name="class">
            <xsl:choose>
              <xsl:when test="/WaiverSite/WFSubscription_SMS/Status='Inactive'">text-danger</xsl:when>
              <xsl:when test="/WaiverSite/WFSubscription_SMS/Status='Active'">text-success</xsl:when>
              <xsl:when test="/WaiverSite/WFSubscription_SMS/Status='Expired'">text-danger</xsl:when>
              <xsl:when test="/WaiverSite/WFSubscription_SMS/Status='Cancelled'">text-muted</xsl:when>
            </xsl:choose>
          </xsl:attribute>
          <xsl:value-of select="/WaiverSite/WFSubscription_SMS/Status"/>
        </span>
        <br/>
        <strong>Expiration date:</strong>
        <xsl:text> </xsl:text>
        <xsl:value-of select="dt:month-in-year(/WaiverSite/WFSubscription_SMS/ExpirationDate)"/>
        <xsl:text>/</xsl:text>
        <xsl:value-of select="dt:day-in-month(/WaiverSite/WFSubscription_SMS/ExpirationDate)"/>
        <xsl:text>/</xsl:text>
        <xsl:value-of select="dt:year(/WaiverSite/WFSubscription_SMS/ExpirationDate)"/>
        <br/>

        <p>
          <!--<a href="ManageUserAccess.aspx?id={ID}" class="btn btn-primary">Manage User Access</a>
            <xsl:text> </xsl:text>
            <a href="ManageQuestions.aspx?id={ID}" class="btn btn-primary">Manage Questions</a>
            <xsl:text> </xsl:text>
            <a href="Usage.aspx?id={ID}" class="btn btn-primary">Usage</a>
            <xsl:text> </xsl:text>
            -->

          <div class="row">
            <div class="col-md-6">
              <a href="{$SchemeAndDomain}/b/{/WaiverSite/Url}/admin/Settings/Renew.aspx" class="btn btn-primary btn-block">Renew / Change Plan</a>

            </div>
            <div class="col-md-6">

              <a href="{$SchemeAndDomain}/b/{/WaiverSite/Url}/admin/Settings/Usage.aspx?id={/WaiverSite/WFSubscription_SMS/ID}" class="btn btn-default btn-block">
                <i class="fa fa-bar-chart">
                  <xsl:text> </xsl:text>
                </i> Complete Usage History
              </a>
            </div>

          </div>





          <xsl:if test="/WaiverSite/WFSubscription_SMS/CCProfileID!='00000000-0000-0000-0000-000000000000'">
            <p class="bg-info" style="padding:15px;margin: 15px 0;border-radius: 10px;">

              Automatic payments scheduled
              <xsl:if test="/WaiverSite/WFSubscription_SMS/CreditCardProfile/Last4!=''">
                <xsl:text> using </xsl:text>
                <xsl:value-of select="/WaiverSite/WFSubscription_SMS/CreditCardProfile/CardType"/>
                <xsl:text> ending in ************</xsl:text>
                <xsl:value-of select="/WaiverSite/WFSubscription_SMS/CreditCardProfile/Last4"/>
              </xsl:if>
              <br/>
              <br/>


              <asp:LinkButton runat="server" CssClass="btn btn-default" style="margin-left:15px;" Text="Cancel Automatic Payments" CommandName="CANCEL" CommandArgument="{WFSubscription_SMS/ID}"></asp:LinkButton>
              <a href="{$SchemeAndDomain}/b/{/WaiverSite/Url}/admin/Settings/Payment-History.aspx" class="btn btn-default" style="margin-left: 15px; ">Payment History</a>
            </p>
          </xsl:if>


        </p>




        <xsl:if test="count(/WaiverSite)&gt;1">
          <h5>Sub-Accounts in this subscription:</h5>
        </xsl:if>





        <xsl:for-each select="/WaiverSite/WFSubscription_SMS/RecurringProfiles/PayPalRecurringProfile[Status='ActiveProfile']">
          <p class="bg-info" style="padding:15px;margin: 15px 0;border-radius: 10px;">

            Automatic payments scheduled
            <xsl:if test="CCLast4!=''">
              <xsl:text> using card ending in ************</xsl:text>
              <xsl:value-of select="CCLast4"/>
            </xsl:if>
            <br/>
            <br/>
            <asp:LinkButton runat="server" CssClass="btn btn-default" style="margin-left:15px;" Text="Cancel Automatic Payments" CommandName="CANCEL" CommandArgument="{PayPalRecurringProfile_ID}"></asp:LinkButton>
            <a href="{$SchemeAndDomain}/b/{/WaiverSite/Url}/admin/Settings/Payment-History.aspx" class="btn btn-default" style="margin-left: 15px; ">Payment History</a>
          </p>
        </xsl:for-each>







        <h4>Recent Usage:</h4>
        <xsl:for-each select="/WaiverSite[position()=1]/RecentWFSubscriptionPeriods_SMS/WFSubscriptionPeriod">

          <xsl:variable name="periodExpired">
            <xsl:choose>
              <xsl:when test="substring(translate(PeriodBegins,'-',''), 1, 8) &gt; substring(translate(../../WFSubscription/ExpirationDate,'-',''),1, 8)">true</xsl:when>
              <xsl:otherwise>false</xsl:otherwise>
            </xsl:choose>
          </xsl:variable>

          <div class="row">
            <div class="col-xs-4">
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
            </div>


            <div class="col-xs-5">

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
                <xsl:when test="NumIncludedTotal&lt;=0">
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
              

              <xsl:choose>
                <xsl:when test="NumIncludedTotal&lt;0">
                  <xsl:text> of unlimited </xsl:text>
                </xsl:when>
                <xsl:when test="NumIncludedTotal=0">

                </xsl:when>
                <xsl:otherwise>
                  <xsl:text> of </xsl:text>
                  <xsl:value-of select="NumIncludedTotal"/>
                </xsl:otherwise>
              </xsl:choose>

              <xsl:text> used.</xsl:text>
            </div>

          </div>




          <hr/>
        </xsl:for-each>



      </div>
    </div>

    <a href="CancelSMS.aspx?id={WFSubscription_SMS/ID}" class="btn btn-muted">Cancel Text Messaging</a>


  </xsl:template>

  
  <xsl:template name="RenderPlan">



    <div class="row">
      <div class="col-xs-12">
        <xsl:text> </xsl:text>

        <xsl:if test="count(/WaiverSite)=1">
          <h3>
            <xsl:value-of select="/WaiverSite/Name"/>
          </h3>
        </xsl:if>

        <strong>Plan:</strong>
        <xsl:text> </xsl:text>
        <xsl:value-of select="/WaiverSite/WFSubscription/Plan/Name"/>
        <xsl:text> - $</xsl:text>
        <xsl:value-of select="format-number(/WaiverSite/WFSubscription/SelectedPrice/Price,'#,##0.##')"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="/WaiverSite/WFSubscription/SelectedPrice/QuotaInterval"/>
        <br/>
        <strong>Status:</strong>
        <xsl:text> </xsl:text>
        <span style="font-weight:700;">
          <xsl:attribute name="class">
            <xsl:choose>
              <xsl:when test="/WaiverSite/WFSubscription/Status='Inactive'">text-danger</xsl:when>
              <xsl:when test="/WaiverSite/WFSubscription/Status='Active'">text-success</xsl:when>
              <xsl:when test="/WaiverSite/WFSubscription/Status='Expired'">text-danger</xsl:when>
              <xsl:when test="/WaiverSite/WFSubscription/Status='Cancelled'">text-muted</xsl:when>
            </xsl:choose>
          </xsl:attribute>
          <xsl:value-of select="/WaiverSite/WFSubscription/Status"/>
        </span>
        <br/>
        <strong>Expiration date:</strong>
        <xsl:text> </xsl:text>
        <xsl:value-of select="dt:month-in-year(/WaiverSite/WFSubscription/ExpirationDate)"/>
        <xsl:text>/</xsl:text>
        <xsl:value-of select="dt:day-in-month(/WaiverSite/WFSubscription/ExpirationDate)"/>
        <xsl:text>/</xsl:text>
        <xsl:value-of select="dt:year(/WaiverSite/WFSubscription/ExpirationDate)"/>
        <br/>

        <p>
          <!--<a href="ManageUserAccess.aspx?id={ID}" class="btn btn-primary">Manage User Access</a>
            <xsl:text> </xsl:text>
            <a href="ManageQuestions.aspx?id={ID}" class="btn btn-primary">Manage Questions</a>
            <xsl:text> </xsl:text>
            <a href="Usage.aspx?id={ID}" class="btn btn-primary">Usage</a>
            <xsl:text> </xsl:text>
            -->

          <div class="row">
            <div class="col-md-6">
              <a href="{$SchemeAndDomain}/b/{/WaiverSite/Url}/admin/Settings/Renew.aspx" class="btn btn-primary btn-block">Renew / Change Plan</a>

            </div>
            <div class="col-md-6">

              <a href="{$SchemeAndDomain}/b/{/WaiverSite/Url}/admin/Settings/Usage.aspx?id={/WaiverSite/WFSubscription/ID}" class="btn btn-default btn-block">
                <i class="fa fa-bar-chart">
                  <xsl:text> </xsl:text>
                </i> Complete Usage History
              </a>
            </div>

          </div>





          <xsl:if test="/WaiverSite/WFSubscription/CCProfileID!='00000000-0000-0000-0000-000000000000'">
            <p class="bg-info" style="padding:15px;margin: 15px 0;border-radius: 10px;">

              Automatic payments scheduled
              <xsl:if test="/WaiverSite/WFSubscription/CreditCardProfile/Last4!=''">
                <xsl:text> using </xsl:text>
                <xsl:value-of select="/WaiverSite/WFSubscription/CreditCardProfile/CardType"/>
                <xsl:text> ending in ************</xsl:text>
                <xsl:value-of select="/WaiverSite/WFSubscription/CreditCardProfile/Last4"/>
              </xsl:if>
              <br/>
              <br/>


              <asp:LinkButton runat="server" CssClass="btn btn-default" style="margin-left:15px;" Text="Cancel Automatic Payments" CommandName="CANCEL" CommandArgument="{WFSubscription/ID}"></asp:LinkButton>
              <a href="{$SchemeAndDomain}/b/{/WaiverSite/Url}/admin/Settings/Payment-History.aspx" class="btn btn-default" style="margin-left: 15px; ">Payment History</a>
            </p>
          </xsl:if>


        </p>




        <xsl:if test="count(/WaiverSite)&gt;1">
          <h5>Sub-Accounts in this subscription:</h5>
        </xsl:if>


        <xsl:for-each select="/WaiverSite/WFSubscription/RecurringProfiles/PayPalRecurringProfile[Status='ActiveProfile']">
          <p class="bg-info" style="padding:15px;margin: 15px 0;border-radius: 10px;">

            Automatic payments scheduled
            <xsl:if test="CCLast4!=''">
              <xsl:text> using card ending in ************</xsl:text>
              <xsl:value-of select="CCLast4"/>
            </xsl:if>
            <br/>
            <br/>
            <asp:LinkButton runat="server" CssClass="btn btn-default" style="margin-left:15px;" Text="Cancel Automatic Payments" CommandName="CANCEL" CommandArgument="{PayPalRecurringProfile_ID}"></asp:LinkButton>
            <a href="{$SchemeAndDomain}/b/{/WaiverSite/Url}/admin/Settings/Payment-History.aspx" class="btn btn-default" style="margin-left: 15px; ">Payment History</a>
          </p>
        </xsl:for-each>







        <h4>Recent Usage:</h4>
        <xsl:for-each select="/WaiverSite[position()=1]/RecentWFSubscriptionPeriods/WFSubscriptionPeriod">

          <xsl:variable name="periodExpired">
            <xsl:choose>
              <xsl:when test="substring(translate(PeriodBegins,'-',''), 1, 8) &gt;= substring(translate(../../WFSubscription/ExpirationDate,'-',''),1, 8)">true</xsl:when>
              <xsl:otherwise>false</xsl:otherwise>
            </xsl:choose>
          </xsl:variable>

          <div class="row">
            <div class="col-xs-4">
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
            </div>


            <div class="col-xs-5">

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
                <xsl:when test="NumIncludedTotal&lt;=0">
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
             
              <xsl:choose>
                <xsl:when test="NumIncludedTotal&lt;0">
                  <xsl:text> of unlimited </xsl:text>
                </xsl:when>
                <xsl:when test="NumIncludedTotal=0">
                
                </xsl:when>
                <xsl:otherwise>
                  <xsl:text> of </xsl:text>
                  <xsl:value-of select="NumIncludedTotal"/>
                </xsl:otherwise>
              </xsl:choose>

              <xsl:text> used.</xsl:text>
            </div>

          </div>




          <hr/>
        </xsl:for-each>



        <xsl:if test="/WaiverSite/WFSubscription/AddonServices/WFSubscriptionAddonService">
          <h4>Add-On Services:</h4>

          <table class="table">
            <thead>
              <tr>
                <th>Service Name</th>
                <th>Current Usage</th>
                <th>Pricing</th>
              </tr>
            </thead>
            <tbody>
              <xsl:for-each select="/WaiverSite/WFSubscription/AddonServices/WFSubscriptionAddonService">
                <tr>
                  <td>
                    <strong>
                      <xsl:value-of select="translate(ServiceType,'_',' ')"/>
                    </strong>
                  </td>
                  <td>
                    <xsl:choose>
                      <xsl:when test="CurrentUsage&gt;=1000 and CurrentUsage&lt;1000000 ">
                        <xsl:value-of select="format-number(CurrentUsage div 1000, '#.00')"/> MB
                      </xsl:when>
                      <xsl:when test="CurrentUsage&gt;=1000000 and CurrentUsage&lt;1000000000 ">
                        <xsl:value-of select="format-number(CurrentUsage div 1000000, '#.00')"/> GB
                      </xsl:when>
                      <xsl:when test="CurrentUsage&gt;=1000000000">
                        <xsl:value-of select="format-number(CurrentUsage div 1000000000, '#.00')"/> TB
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="CurrentUsage"/> KB
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                  <td>
                    <xsl:value-of select="CurrentPriceDesc"/>
                  </td>
                </tr>

              </xsl:for-each>
            </tbody>
          </table>

          <br/>
          <br/>
        </xsl:if>

      </div>
    </div>

    <a href="Cancel.aspx?id={WFSubscription/ID}" class="btn btn-muted">Cancel my account</a>


  </xsl:template>


</xsl:stylesheet>
