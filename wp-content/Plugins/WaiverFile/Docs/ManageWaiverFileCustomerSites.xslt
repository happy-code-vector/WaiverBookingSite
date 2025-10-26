<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:math="http://exslt.org/math" xmlns:dt="http://exslt.org/dates-and-times" exclude-result-prefixes="str dt math">

  <xsl:output method="html" omit-xml-declaration="yes"/>


  <xsl:template match="/">
    <script type="text/javascript">

      $(function () {
      //tab postback maintenance
      $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
      var target = $(e.target).attr("href") // activated tab

      });
      });
    </script>
    
    <!--
    <xsl:copy-of select="/"></xsl:copy-of>
    -->

    <xsl:choose>
      <xsl:when test="count(/ArrayOfWFSubscription/WFSubscription[Service='SMS'])!=0">

        <div class="panel with-nav-tabs panel-default">
          <div class="panel-heading no-padding">
            <ul class="nav nav-tabs">
              <li class="active">
                <a data-toggle="tab" href="#tabwaiverfile">WaiverFile</a>
              </li>
              <li>
                <a data-toggle="tab" href="#tabsms">SMS</a>
              </li>
              
            </ul>
          </div>
          <div class="panel-body">
            <div class="tab-content">
              <div class="tab-pane fade in active" id="tabwaiverfile">

                <xsl:for-each select="/ArrayOfWFSubscription/WFSubscription[Service='WaiverFile']">
                  <xsl:apply-templates mode="RenderSub" select="."></xsl:apply-templates>
                </xsl:for-each>
                
              </div>
         
              <div class="tab-pane fade in" id="tabsms">

                <xsl:for-each select="/ArrayOfWFSubscription/WFSubscription[Service='SMS']">
                  <xsl:apply-templates mode="RenderSub" select="."></xsl:apply-templates>
                </xsl:for-each>

              </div>
            </div>
            
          </div>
        </div>
      </xsl:when>
      <xsl:otherwise>

        <xsl:for-each select="/ArrayOfWFSubscription/WFSubscription">
          <xsl:apply-templates mode="RenderSub" select="."></xsl:apply-templates>
        </xsl:for-each>
      
      </xsl:otherwise>
    </xsl:choose>





  </xsl:template>

  <xsl:template mode="RenderSub" match="*">

    <div class="row">
      <div class="col-sm-4">
        <p>
          <strong>Plan</strong>
          <xsl:text>: </xsl:text>
          <strong>
            <xsl:value-of select="Plan/Name"/>
          </strong>
          <br/>
          <strong>
            <xsl:value-of select="format-number(SelectedPrice/Price,'$#.00')"/>
            <xsl:choose>
              <xsl:when test="SelectedPrice/BillingInterval='Monthly'">
                <xsl:text> per month</xsl:text>
              </xsl:when>
              <xsl:when test="SelectedPrice/BillingInterval='Quarterly'">
                <xsl:text> per quarter</xsl:text>
              </xsl:when>
              <xsl:when test="SelectedPrice/BillingInterval='Yearly'">
                <xsl:text> per year</xsl:text>
              </xsl:when>
            </xsl:choose>
          </strong>
          <br/>
          <xsl:value-of select="SelectedPrice/Quota"/>
          <xsl:choose>
            <xsl:when test="SelectedPrice/QuotaInterval='Monthly'">
              <xsl:text> per month</xsl:text>
            </xsl:when>
            <xsl:when test="SelectedPrice/QuotaInterval='Quarterly'">
              <xsl:text> per quarter</xsl:text>
            </xsl:when>
            <xsl:when test="SelectedPrice/QuotaInterval='Yearly'">
              <xsl:text> per year</xsl:text>
            </xsl:when>
          </xsl:choose>





        </p>

        <xsl:if test="SelectedPrice/ID!=Plan/CurrentPrice/ID">
          <div class="WPERR_Information">
            This customer is on grandfathered pricing for this plan. The new price for this plan is   <xsl:value-of select="format-number(Plan/CurrentPrice/IntervalPrice,'$#.00')"/><xsl:text> </xsl:text><xsl:value-of select="Plan/CurrentPrice/Interval"/>

            <xsl:if test="Plan/CurrentPrice/IncludedMonthlyQuota!=0">
              <xsl:value-of select="Plan/CurrentPrice/IncludedMonthlyQuota"/>
              <xsl:text> per month</xsl:text>
              <br/>
            </xsl:if>
            <xsl:if test="Plan/CurrentPrice/IncludedQuarterlyQuota!=0">
              <xsl:value-of select="Plan/CurrentPrice/IncludedQuarterlyQuota"/>
              <xsl:text> per quarter</xsl:text>
              <br/>
            </xsl:if>
            <xsl:if test="Plan/CurrentPrice/IncludedAnnualQuota!=0">
              <xsl:value-of select="Plan/CurrentPrice/IncludedAnnualQuota"/>
              <xsl:text> per year</xsl:text>
              <br/>
            </xsl:if>

          </div>
        </xsl:if>






      </div>
      <div class="col-sm-4">

        <div class="form-group">
          <p>
            <label style="margin:0;">Subscription status: </label>
            <xsl:text> </xsl:text>
            <span>
              <xsl:if test="Status='Expired'">
                <xsl:attribute name="class">text-danger</xsl:attribute>
                <xsl:attribute name="style">font-weight:700;</xsl:attribute>
              </xsl:if>
              <xsl:value-of select="Status"/>
            </span>

          </p>

          <xsl:if test="SuspendDate!='9999-12-31T00:00:00'">
            <p class="text-danger">
              <label style="margin:0;">Suspension Date: </label>
              <xsl:text> </xsl:text>
              <xsl:value-of select="dt:format-date(SuspendDate,'MMMM d, yyyy')"/>
            </p>
          </xsl:if>

          <xsl:choose>

            <xsl:when test="SuspendDate!='9999-12-31T00:00:00'">
              <p>
                <a href="/wp-admin/default.aspx?sc=WF_SUBS_SET_SUSPEND&amp;id={ID}&amp;c=1" class="btn btn-danger btn-block btn-sm">Change Suspension</a>
              </p>
            </xsl:when>
            <xsl:when test="Status='Expired' or Status='Trial_expired'">
              <p>
                <a href="/wp-admin/default.aspx?sc=WF_SUBS_SET_SUSPEND&amp;id={ID}&amp;c=1" class="btn btn-danger btn-block btn-sm">Schedule Suspension</a>
              </p>
            </xsl:when>

          </xsl:choose>
          
          <p>

            <label style="margin:0;">Subscription Expires: </label>
            <xsl:text> </xsl:text>

            <xsl:value-of select="dt:format-date(ExpirationDate,'MMMM d, yyyy')"/>
          </p>
          <p>
            <label style="margin:0;">Subscription Starts: </label>
            <xsl:text> </xsl:text>
            <xsl:value-of select="dt:format-date(StartDate,'MMMM d, yyyy')"/>
          </p>

         
          
          
        </div>
      </div>

      <div class="col-sm-4">

        <xsl:choose>
          <xsl:when test="CCProfileID!='00000000-0000-0000-0000-000000000000'">
            <div>
              <span  class="text-success">
                <i class="fa fa-check-circle">
                  <xsl:text> </xsl:text>
                </i>
                Automatic payments enabled.
              </span>
              <br/>
              <xsl:value-of select="CreditCardProfile/CardType"/>
              <xsl:text> ending in </xsl:text>
              <xsl:value-of select="CreditCardProfile/Last4"/>
              <xsl:text> (</xsl:text>
              <xsl:value-of select="CreditCardProfile/CardExpirationMonth"/>
              <xsl:text>/</xsl:text>
              <xsl:value-of select="CreditCardProfile/CardExpirationYear"/>
              <xsl:text>)</xsl:text>
              <br/>
              <br/>

            </div>

            <xsl:if test="CCProfileProcessStatus='Error'">
              <div>
                <span  class="text-danger">
                  <i class="fa fa-times-circle-o">
                    <xsl:text> </xsl:text>
                  </i>
                  Last payment failed to go through. Edit subscription and set payment method to allow it to retry.
                </span>
              </div>
            </xsl:if>


          </xsl:when>
          <xsl:otherwise>
            <div>
              <span  class="text-danger">
                <i class="fa fa-times-circle-o">
                  <xsl:text> </xsl:text>
                </i>
                Automatic payments disabled.
              </span>
            </div>
          </xsl:otherwise>
        </xsl:choose>

        <p>
          <a href="/wp-admin/default.aspx?sc=WF_SUBS_EDIT_SUBSCRIPTION&amp;id={ID}&amp;c=1" class="btn btn-primary btn-block">Edit Subscription</a>
        </p>
        <p>
        <a href="/wp-admin/default.aspx?sc=WF_SUBS_CHANGE_OWNER&amp;id={ID}&amp;c=1" class="btn btn-default btn-block">Change Owner</a>
        </p>


      
       
      </div>
    </div>

    <xsl:if test="Status='Cancelled'">
      <div class="row">
        <div class="col-xs-12">
          <h4>
            Account marked as <span class="text-danger">Cancelled</span>. Prepare to delete data.
          </h4>
          <p>Once a customer account is marked as cancelled, data may be deleted after followup has been done.</p>
          <a href="/wp-admin/default.aspx?sc=WF_DELETE_SUBSCRIPTION&amp;id={ID}&amp;c=1" class="btn btn-danger">Delete Customer Data</a>
        </div>
      </div>
    </xsl:if>

    <xsl:if test="Status='Cancelled' or count(CancelReasons/SubscriptionCancelReason)&gt;1">
      
        <h4>Cancellation Reasons (<a href="?sc=WFCRM_EDIT_SUB_CANCELREASON&amp;id={ID}&amp;c=1">Add New</a>)</h4>
        <xsl:if test="count(CancelReasons/SubscriptionCancelReason)=0">
          <p>None</p>
        </xsl:if>
        <xsl:if test="count(CancelReasons/SubscriptionCancelReason)!=0">
          <table class="table table-condensed">
            <thead>
              <tr>
                <th>Reason</th>
                <th>Details</th>
                <th>Created</th>
                <th>Created By</th>
                <th>Last Modified</th>
                <th>Edit</th>
              </tr>
            </thead>
            <xsl:for-each select="CancelReasons/SubscriptionCancelReason">
              <tr>
                <td>
                  <xsl:value-of select="Reason/Name"/>
                  <xsl:if test="Reason.Description!=''">
                    <xsl:text> (</xsl:text>
                    <xsl:value-of select="Reason/Description"/>)
                  </xsl:if>
                </td>
                <td>
                  <xsl:value-of select="Details"/>
                </td>
                <td>
                  <xsl:value-of select="dt:format-date(Created,'MMMM d, yyyy')"/>
                </td>
                <td>
                  <xsl:value-of select="createdByFirst"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="createdByLast"/>
                  
                  <xsl:if test="createdByEmail!=''">
                    <xsl:text> </xsl:text>
                    <a href="mailto:{createdByEmail}">
                      <xsl:value-of select="createdByEmail"/>
                    </a>
                  </xsl:if>
                </td>
                <td>
                  <xsl:if test="LastModified!=Created or LastModifiedBy!=CreatedBy">
                    <xsl:value-of select="dt:format-date(Created,'MMMM d, yyyy')"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="updatedByFirst"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="updatedByLast"/>

                    <xsl:if test="updatedByEmail!=''">
                      <xsl:text> </xsl:text>
                      <a href="mailto:{updatedByEmail}">
                        <xsl:value-of select="updatedByEmail"/>
                      </a>
                    </xsl:if>
                  </xsl:if>
                </td>
                <td>
                  <a href="/wp-admin/default.aspx?sc=WFCRM_EDIT_SUB_CANCELREASON&amp;id={WFSubscriptionID}&amp;id2={ReasonID}&amp;c=1">Edit</a>
                </td>
              </tr>
            </xsl:for-each>
          </table>
        </xsl:if>
     
    </xsl:if>

    <div class="row">
      <div class="col-sm-4">

        <p>
          <strong>Plan Group Access</strong>
          <br/>
          <xsl:for-each select="PlanAccessGroups/WFPlanGroup[IsPrimaryPublic!='true']">
            <xsl:if test="position()!=1">
              <xsl:text>, </xsl:text>
            </xsl:if>
            <xsl:value-of select="GroupName"/>
          </xsl:for-each>
        </p>

      </div>
      <div class="col-sm-4">

        <p>
          <strong>Plan Access</strong>
          <br/>
          <xsl:for-each select="PlanAccess/WFPlan[IsPrimaryPublic!='true']">
            <xsl:if test="position()!=1">
              <xsl:text>, </xsl:text>
            </xsl:if>
            <xsl:value-of select="Name"/>
          </xsl:for-each>
        </p>

      </div>
      <div class="col-sm-4">
        <a href="/wp-admin/default.aspx?sc=WF_SUBS_MANAGE_CUSTOMER_PLAN_ACCESS&amp;c=1&amp;id={CustomerID}" class="btn btn-primary btn-block">Manage Plan Access</a>
      </div>
    </div>






    <p>

    </p>

    <xsl:if test="Service='WaiverFile' or count(Sites/WaiverSite[Status!='Deleted'])&gt;1">


      <h4>Sub-Accounts in this subscription:</h4>

      <xsl:for-each select="Sites/WaiverSite[Status!='Deleted']">

        <div class="row">
          <div class="col-sm-4">
            <div class="form-group">
              <strong>
                <xsl:value-of select="Name"/>
              </strong>
              <br/>
              <a href="https://www.waiverfile.com/b/{Url}" target="_blank">
                <xsl:text>/</xsl:text>
                <xsl:value-of select="Url"/>
                <xsl:text> </xsl:text>
                <i class="fa fa-sm fa-external-link ">
                  <xsl:text> </xsl:text>
                </i>
              </a>
            </div>
          </div>
          <div class="col-sm-4">
            Site Status: <strong>
              <span>
                <xsl:if test="Status='Suspended'">
                  <xsl:attribute name="class">text-danger</xsl:attribute>
                </xsl:if>
                <xsl:value-of select="Status"/>
              </span>

            </strong><br/>
            Security Mode:
            <strong>
              <xsl:attribute name="class">
                <xsl:choose>
                  <xsl:when test="SecurityMode='High'">text-success</xsl:when>
                  <xsl:when test="SecurityMode='Standard'">text-success</xsl:when>
                  <xsl:otherwise>text-danger</xsl:otherwise>
                </xsl:choose>
              </xsl:attribute>
              <xsl:value-of select="SecurityMode"/>
            </strong>
            <xsl:text> </xsl:text>
            (<a href="/wp-admin/default.aspx?sc=WF_EDIT_WAIVER_SITE_SECURITY_MODE&amp;id={ID}&amp;c=1" class="">Change</a>)
          </div>
          <div class="col-sm-4">
            <a href="/wp-admin/default.aspx?sc=WF_EDIT_WAIVER_SITE&amp;id={ID}&amp;c=1" class="btn btn-sm btn-default">Edit Site</a>
            <br/>
            <a href="/wp-admin/default.aspx?sc=WF_LIST_XSLTEMPLATES&amp;id={ID}&amp;c=1" class="btn btn-sm btn-default">Site XSL Templates</a>
          </div>

        </div>




      </xsl:for-each>
    </xsl:if>
    <xsl:if test="Service='WaiverFile' or count(AddonServices/WFSubscriptionAddonService)&gt;1">
      <h4>Add-On Services</h4>
      <xsl:if test="count(AddonServices/WFSubscriptionAddonService)=0">
        <p>None</p>
      </xsl:if>
      <xsl:if test="count(AddonServices/WFSubscriptionAddonService)!=0">
        <table class="table table-condensed">
          <thead>
            <tr>
              <th>Service</th>
              <th>Renews</th>
              <th>Status</th>
              <th>Expiration</th>
              <th>Price</th>
              <th>Edit</th>
            </tr>
          </thead>
          <xsl:for-each select="AddonServices/WFSubscriptionAddonService">
            <tr>
              <td>
                <xsl:value-of select="translate(ServiceType,'_',' ')"/>
              </td>
              <td>
                <xsl:value-of select="translate(RenewalPeriod,'_',' ')"/>
              </td>
              <td>
                <xsl:value-of select="translate(Status,'_',' ')"/>
              </td>
              <td>
                <xsl:value-of select="dt:format-date(ExpirationDate,'MMMM d, yyyy')"/>
              </td>
              <td>
                <xsl:choose>
                  <xsl:when test="OverridePricing='true' or OverridePricing='True'">
                    <xsl:text>$</xsl:text>
                    <xsl:value-of select="format-number(OverrideAmount,'0.00')"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="OverrideInterval"/> (overridden)
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="CurrentPriceDesc"/>
                  </xsl:otherwise>
                </xsl:choose>
              </td>
              <td>
                <a href="/wp-admin/default.aspx?sc=WF_VIEW_ADDON_SVC_DETAILS&amp;id={ID}&amp;c=1">Edit</a>
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </xsl:if>
    </xsl:if>
    <hr/>
    <h4>
      Usage
      <xsl:if test="count(Sites/WaiverSite)!=1">
        <xsl:text> (Combined usage from </xsl:text>
        <xsl:value-of select="count(Sites/WaiverSite)"/>
        <xsl:text> sites in subscription) </xsl:text>
      </xsl:if>
      (<a href="/wp-admin/default.aspx?sc=WF_SUBS_VIEW_SUB_USAGE_COMPLETE&amp;id={ID}&amp;c=1">View complete usage history</a>)
    </h4>
    <xsl:for-each select="Sites/WaiverSite[position()=1]/RecentWFSubscriptionPeriods/WFSubscriptionPeriod">

      <xsl:variable name="periodExpired">
        <xsl:choose>
          <xsl:when test="substring(translate(PeriodBegins,'-',''), 1, 8) &gt; substring(translate(../../../../ExpirationDate,'-',''),1, 8)">true</xsl:when>
          <xsl:otherwise>false</xsl:otherwise>
        </xsl:choose>
      </xsl:variable>



      <div class="row">
        <div class="col-xs-3">
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
        <div class="col-xs-2">
          <xsl:value-of select="NumUsed"/>

          <xsl:choose>
            <xsl:when test="NumIncludedTotal=-1">
              <xsl:text> used. No limit.</xsl:text>
            </xsl:when>
            <xsl:when test="NumIncludedTotal=0">
              <xsl:text> used.</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text> of </xsl:text>
              <xsl:value-of select="NumIncludedTotal"/>
              <xsl:text> used.</xsl:text>
            </xsl:otherwise>
          </xsl:choose>

          <xsl:text></xsl:text>
        </div>
        <div class="col-xs-2">
          <a href="/wp-admin/default.aspx?sc=WF_SUBS_MANAGEPERIOD&amp;id={ID}&amp;c=1" class="btn btn-primary btn-sm">Manage</a>
        </div>
      </div>




      <hr/>
    </xsl:for-each>

    <xsl:for-each select="Sites/WaiverSite[position()=1]/RecentWFSubscriptionPeriods_SMS/WFSubscriptionPeriod">

      <xsl:variable name="periodExpired">
        <xsl:choose>
          <xsl:when test="substring(translate(PeriodBegins,'-',''), 1, 8) &gt; substring(translate(../../../../ExpirationDate,'-',''),1, 8)">true</xsl:when>
          <xsl:otherwise>false</xsl:otherwise>
        </xsl:choose>
      </xsl:variable>



      <div class="row">
        <div class="col-xs-3">
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
        <div class="col-xs-2">
          <xsl:value-of select="NumUsed"/>

          <xsl:choose>
            <xsl:when test="NumIncludedTotal=-1">
              <xsl:text> used. No limit.</xsl:text>
            </xsl:when>
            <xsl:when test="NumIncludedTotal=0">
              <xsl:text> used.</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text> of </xsl:text>
              <xsl:value-of select="NumIncludedTotal"/>
              <xsl:text> used.</xsl:text>
            </xsl:otherwise>
          </xsl:choose>

          <xsl:text></xsl:text>
        </div>
        <div class="col-xs-2">
          <a href="/wp-admin/default.aspx?sc=WF_SUBS_MANAGEPERIOD&amp;id={ID}&amp;c=1" class="btn btn-primary btn-sm">Manage</a>
        </div>
      </div>




      <hr/>
    </xsl:for-each>


    <xsl:if test="count(Sites/WaiverSite[Status='Deleted'])!=0">

      <script type="text/javascript">
        $(document).ready(function(){
        $('.btnShowDeletedSites').click(function(){
        if($(this).data('status')=='off'){
        $(this).data('status','on');
        $(this).html('Hide');
        $('.hiddensites').each(function(){ $(this).show();  });

        }else{

        $(this).html('Show');
        $('.hiddensites').each(function(){ $(this).hide();  });

        $(this).data('status','off');
        }
        });
        });
      </script>
      <h4>Deleted Sites</h4>
      <a href="javascript:void(0);" class="btn btn-default btnShowDeletedSites" data-status="off">Show</a>

      <div class="hiddensites well" style="display:none;">
        <xsl:for-each select="Sites/WaiverSite[Status='Deleted']">
          <div class="row">
            <div class="col-sm-4">
              <div class="form-group">
                <strong>
                  <xsl:value-of select="Name"/>
                </strong>
                <br/>
                <a href="https://www.waiverfile.com/b/{Url}" target="_blank">
                  <xsl:text>/</xsl:text>
                  <xsl:value-of select="Url"/>
                  <xsl:text> </xsl:text>
                  <i class="fa fa-sm fa-external-link ">
                    <xsl:text> </xsl:text>
                  </i>
                </a>
              </div>
            </div>
            <div class="col-sm-4">
              Site Status: <strong>
                <span>
                  <xsl:if test="Status='Suspended'">
                    <xsl:attribute name="class">text-danger</xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="Status"/>
                </span>

              </strong>
            </div>
            <div class="col-sm-4">
              <a href="/wp-admin/default.aspx?sc=WF_EDIT_WAIVER_SITE&amp;id={ID}&amp;c=1" class="btn btn-sm btn-default">Edit Site</a>
              <br/>
              <a href="/wp-admin/default.aspx?sc=WF_LIST_XSLTEMPLATES&amp;id={ID}&amp;c=1" class="btn btn-sm btn-default">Site XSL Templates</a>
            </div>
          </div>

        </xsl:for-each>
      </div>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
