<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:asp="remove" xmlns:dt="http://exslt.org/dates-and-times"  xmlns:set="http://exslt.org/sets" extension-element-prefixes="dt set">

  <xsl:param name="SchemeAndDomain">https://www.waiverfile.com</xsl:param>
  <xsl:output method="xml" omit-xml-declaration="yes"/>


  <xsl:template match="/">



    <xsl:for-each select="set:distinct(/ArrayOfWaiverSite/WaiverSite[CustomerID!='00000000-0000-0000-0000-000000000000' and Status!='Deleted']/WFSubscriptionID)">
      <xsl:variable name="wfsubid">
        <xsl:value-of select="."/>
      </xsl:variable>


      <div class="row">
        <div class="col-xs-12">
          <xsl:text> </xsl:text>

          <xsl:if test="count(/ArrayOfWaiverSite/WaiverSite[WFSubscriptionID=$wfsubid])=1">
            <h3>
              <xsl:value-of select="/ArrayOfWaiverSite/WaiverSite[WFSubscriptionID=$wfsubid]/Name"/>
            </h3>
          </xsl:if>

          <strong>Plan:</strong>
          <xsl:text> </xsl:text>
          <xsl:value-of select="/ArrayOfWaiverSite/WaiverSite/WFSubscription[ID=$wfsubid]/Plan/Name"/>
          <xsl:text> - $</xsl:text>
          <xsl:value-of select="format-number(/ArrayOfWaiverSite/WaiverSite/WFSubscription[ID=$wfsubid]/SelectedPrice/Price,'#,##0.##')"/>
          <xsl:text> </xsl:text>
          <xsl:value-of select="/ArrayOfWaiverSite/WaiverSite/WFSubscription[ID=$wfsubid]/SelectedPrice/QuotaInterval"/>
          <br/>
          <strong>Status:</strong>
          <xsl:text> </xsl:text>
          <span style="font-weight:700;">
            <xsl:attribute name="class">
              <xsl:choose>
                <xsl:when test="/ArrayOfWaiverSite/WaiverSite/WFSubscription[ID=$wfsubid]/Status='Inactive'">text-danger</xsl:when>
                <xsl:when test="/ArrayOfWaiverSite/WaiverSite/WFSubscription[ID=$wfsubid]/Status='Active'">text-success</xsl:when>
                <xsl:when test="/ArrayOfWaiverSite/WaiverSite/WFSubscription[ID=$wfsubid]/Status='Expired'">text-danger</xsl:when>
                <xsl:when test="/ArrayOfWaiverSite/WaiverSite/WFSubscription[ID=$wfsubid]/Status='Cancelled'">text-muted</xsl:when>
              </xsl:choose>
            </xsl:attribute>
            <xsl:value-of select="/ArrayOfWaiverSite/WaiverSite/WFSubscription[ID=$wfsubid]/Status"/>
          </span>
          <br/>
          <strong>Expiration date:</strong>
          <xsl:text> </xsl:text>
          <xsl:value-of select="dt:month-in-year(/ArrayOfWaiverSite/WaiverSite/WFSubscription[ID=$wfsubid]/ExpirationDate)"/>
          <xsl:text>/</xsl:text>
          <xsl:value-of select="dt:day-in-month(/ArrayOfWaiverSite/WaiverSite/WFSubscription[ID=$wfsubid]/ExpirationDate)"/>
          <xsl:text>/</xsl:text>
          <xsl:value-of select="dt:year(/ArrayOfWaiverSite/WaiverSite/WFSubscription[ID=$wfsubid]/ExpirationDate)"/>
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
                <a href="{$SchemeAndDomain}/b/{/ArrayOfWaiverSite/WaiverSite[WFSubscriptionID=$wfsubid]/Url}/admin/Settings/Renew.aspx?id={/ArrayOfWaiverSite/WaiverSite[WFSubscriptionID=$wfsubid]/WFSubscription/ID}" class="btn btn-primary btn-block">Renew / Change Plan</a>

              </div>
              <div class="col-md-6">

                <a href="{$SchemeAndDomain}/b/{/ArrayOfWaiverSite/WaiverSite[WFSubscriptionID=$wfsubid]/Url}/admin/Settings/Usage.aspx?id={/ArrayOfWaiverSite/WaiverSite[WFSubscriptionID=$wfsubid]/WFSubscription/ID}" class="btn btn-default btn-block">
                  <i class="fa fa-bar-chart">
                    <xsl:text> </xsl:text>
                  </i> Complete Usage History
                </a>
              </div>

            </div>





            <xsl:if test="/ArrayOfWaiverSite/WaiverSite[WFSubscriptionID=$wfsubid]/WFSubscription/CCProfileID!='00000000-0000-0000-0000-000000000000'">
              <p class="bg-info" style="padding:15px;margin: 15px 0;border-radius: 10px;">

                Automatic payments scheduled
                <xsl:if test="/ArrayOfWaiverSite/WaiverSite[WFSubscriptionID=$wfsubid]/WFSubscription/CreditCardProfile/Last4!=''">
                  <xsl:text> using </xsl:text>
                  <xsl:value-of select="/ArrayOfWaiverSite/WaiverSite[WFSubscriptionID=$wfsubid]/WFSubscription/CreditCardProfile/CardType"/>
                  <xsl:text> ending in ************</xsl:text>
                  <xsl:value-of select="/ArrayOfWaiverSite/WaiverSite[WFSubscriptionID=$wfsubid]/WFSubscription/CreditCardProfile/Last4"/>
                </xsl:if>
                <br/>
                <br/>


                <asp:LinkButton runat="server" CssClass="btn btn-default" style="margin-left:15px;" Text="Cancel Automatic Payments" CommandName="CANCEL" CommandArgument="{$wfsubid}"></asp:LinkButton>
                <a href="{$SchemeAndDomain}/b/{/ArrayOfWaiverSite/WaiverSite[WFSubscriptionID=$wfsubid]/Url}/admin/Settings/Payment-History.aspx" class="btn btn-default" style="margin-left: 15px; ">Payment History</a>
              </p>
            </xsl:if>


          </p>




          <xsl:if test="count(/ArrayOfWaiverSite/WaiverSite[WFSubscriptionID=$wfsubid])&gt;1">
            <h5>Sub-Accounts in this subscription:</h5>
          </xsl:if>

          <xsl:for-each select="/ArrayOfWaiverSite/WaiverSite[WFSubscriptionID=$wfsubid and CustomerID!='00000000-0000-0000-0000-000000000000']">


            <xsl:if test="count(/ArrayOfWaiverSite/WaiverSite[WFSubscriptionID=$wfsubid])&gt;1">

              <h3>
                <xsl:value-of select="Name"/>
                <div class="pull-right">
                  <a href="{$SchemeAndDomain}/b/{Url}/admin" class="btn">
                    <i class="fa fa-tachometer">
                      <xsl:text> </xsl:text>
                    </i>
                    Admin Dashboard
                  </a>
                </div>

              </h3>

            </xsl:if>

            <hr/>

            <div class="row">
              <div class="col-sm-6">
                <div class="well">
                  <h4>Public Signing Link</h4>
                  <a href="{$SchemeAndDomain}/b/{Url}">
                    <xsl:value-of select="$SchemeAndDomain"/>
                    <xsl:text>/b/</xsl:text>
                    <xsl:value-of select="Url"/>
                  </a>
                  <p>
                    <em>Share this link anywhere you want to link to your waiver. </em>
                    <br/>
                    <strong>
                      <a href="../Style/ShareButtons.aspx">More sharing options</a>
                    </strong>

                  </p>
                </div>
              </div>
              <div class="col-sm-6">
                <div class="well">
                  <h4>Kiosk Signing Link</h4>
                  <a href="{$SchemeAndDomain}/d/{Url}">
                    <xsl:value-of select="$SchemeAndDomain"/>
                    <xsl:text>/d/</xsl:text>
                    <xsl:value-of select="Url"/>
                  </a>
                  <p>If you are using a device to collect signatures at your location, use this special address to enable some extra features</p>
                </div>
              </div>

            </div>





          </xsl:for-each>





          <xsl:for-each select="/ArrayOfWaiverSite/WaiverSite[WFSubscriptionID=$wfsubid]/WFSubscription/RecurringProfiles/PayPalRecurringProfile[Status='ActiveProfile']">
            <p class="bg-info" style="padding:15px;margin: 15px 0;border-radius: 10px;">

              Automatic payments scheduled
              <xsl:if test="CCLast4!=''">
                <xsl:text> using card ending in ************</xsl:text>
                <xsl:value-of select="CCLast4"/>
              </xsl:if>
              <br/>
              <br/>
              <asp:LinkButton runat="server" CssClass="btn btn-default" style="margin-left:15px;" Text="Cancel Automatic Payments" CommandName="CANCEL" CommandArgument="{PayPalRecurringProfile_ID}"></asp:LinkButton>
              <a href="{$SchemeAndDomain}/b/{/ArrayOfWaiverSite/WaiverSite[WFSubscriptionID=$wfsubid]/Url}/admin/Settings/Payment-History.aspx" class="btn btn-default" style="margin-left: 15px; ">Payment History</a>
            </p>
          </xsl:for-each>







          <h4>Recent Waiver Usage:</h4>
          <xsl:for-each select="/ArrayOfWaiverSite/WaiverSite[WFSubscriptionID=$wfsubid][position()=1]/RecentWFSubscriptionPeriods/WFSubscriptionPeriod">

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
                  <xsl:when test="NumIncludedTotal&lt;=0">
                    <xsl:text> unlimited </xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="NumIncludedTotal"/>
                  </xsl:otherwise>
                </xsl:choose>

                <xsl:text> used.</xsl:text>
              </div>

            </div>




            <hr/>
          </xsl:for-each>



          <xsl:if test="/ArrayOfWaiverSite/WaiverSite/WFSubscription[ID=$wfsubid]/AddonServices/WFSubscriptionAddonService">
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
                <xsl:for-each select="/ArrayOfWaiverSite/WaiverSite/WFSubscription[ID=$wfsubid]/AddonServices/WFSubscriptionAddonService">
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

      <a href="Cancel.aspx?id={$wfsubid}" class="btn btn-muted">Cancel my account</a>


    </xsl:for-each>

  </xsl:template>


</xsl:stylesheet>
