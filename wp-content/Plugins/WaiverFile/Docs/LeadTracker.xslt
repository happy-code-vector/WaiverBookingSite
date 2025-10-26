<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:diffgr="urn:schemas-microsoft-com:xml-diffgram-v1" xmlns:set="http://exslt.org/sets"
                xmlns:dt="http://exslt.org/dates-and-times" xmlns:asp="remove" exclude-result-prefixes="str dt set">

  <xsl:output method="html" omit-xml-declaration="yes"/>

  <xsl:param name="Now"></xsl:param>
  <xsl:param name="UtcNow"></xsl:param>
  <!-- PAGING PARAMS -->
  <xsl:param name="PageIdx"></xsl:param>
  <xsl:param name="PageSize"></xsl:param>
  <xsl:param name="NumPages"></xsl:param>
  <xsl:param name="TotalResults"></xsl:param>


  <xsl:template match="/">

   
    <xsl:variable name="quote">'</xsl:variable>
    <xsl:variable name="quoteESC">\'</xsl:variable>

    <style type="text/css">
      .alert.small{ padding:5px; display:inline-block; }
    </style>
    <script type="text/javascript">

      $(document).ready(function(){
      $('[rel=tooltip]').tooltip({ placement: 'bottom'});

      });
    </script>
      <div class="table-responsive">
          <table class="table table-condensed">
            <thead>
              <tr>
                <th>Status</th>
                <th>Lead Name</th>
                <th>Site</th>
                
                
                
                <th>Trial</th>
                <th>Forms</th>
                <th>Events</th>
                <th>Signed</th>
                <th>Plan</th>
                <th>Card</th>
                <th>Paid</th>
                
                
                <th>Subscription</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>


              <xsl:for-each select="/Main/DataSet/diffgr:diffgram/NewDataSet/Table">


       
                
                
                <tr>
                  <td rowspan="2">
                    
                    
                    <p>
                      <small>
                        <i class="fa fa-flag" data-toggle="tooltip" data-original-title="{LeadStatusName}" style="color:{Color};" ></i>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="LeadStatusName"/>
                      </small>
                    </p>
                    <p>
                    <small>
                    <xsl:choose>
                      <xsl:when test="AssignedTo='00000000-0000-0000-0000-000000000000'">
                        Unassigned
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:text>Assigned to </xsl:text>
                        <xsl:variable name="assignedto">
                          <xsl:value-of select="AssignedTo"/>
                        </xsl:variable>
                        <xsl:value-of select="/Main/ArrayOfWPUser/WPUser[ID=$assignedto]/First_Name"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="/Main/ArrayOfWPUser/WPUser[ID=$assignedto]/Last_Name"/>
                      </xsl:otherwise>
                    </xsl:choose>
                    </small>
                    </p>
                  </td>
                  <td rowspan="2">

                    <xsl:variable name="Name">
                      <xsl:choose>
                        <xsl:when test="First_Name!=''">
                          <xsl:value-of select="First_Name"/>
                          <xsl:text> </xsl:text>
                          <xsl:value-of select="Last_Name"/>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:value-of select="FirstName"/>
                          <xsl:text> </xsl:text>
                          <xsl:value-of select="LastName"/>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:variable>

                    
                    <xsl:variable name="Company">

                      <xsl:choose>
                        <xsl:when test="Company!=''">
                          <xsl:value-of select="Company"/>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:value-of select="$Name"/>
                        </xsl:otherwise>
                      </xsl:choose>

                    </xsl:variable>
                    
                    
                    <a href="/wp-admin/default.aspx?sc=WF_VIEW_LEAD&amp;id={leadid}" title="Click to View Lead"><xsl:value-of select="$Company"/></a>
                    <br/>
                    <small>
                      <xsl:value-of select="$Name"/>
                    
                    </small>
                    <xsl:if test="Customer_ID!='00000000-0000-0000-0000-000000000000'">
                    <small>(<a href="/wp-admin/default.aspx?sc=WF_EDITCUSTOMER&amp;id={Customer_ID}&amp;c=1">Edit Customer</a>)</small>
                    </xsl:if>
                   
                  </td>
                  <td rowspan="2">
                  
                    
                  <xsl:if test="Url!=''">
                    <a href="https://www.waiverfile.com/b/{Url}" target="_blank" >
                      <small>
                        waiverfile.com/b/
                        <xsl:value-of select="Url"/>
                      </small>
                    </a>

                    <br/>
                    <small>
                      <xsl:text>Logged in </xsl:text>
                         <xsl:call-template name="timeSince">
                          <xsl:with-param name="date">
                            <xsl:value-of select="Last_Login"/>
                          </xsl:with-param>
                          <xsl:with-param name="now">
                            <xsl:value-of select="$Now"/>
                          </xsl:with-param>
                        </xsl:call-template>
                      </small>
                    
                 </xsl:if>
                    
                    
                    
                    
                    
                    <xsl:if test="AdminNotes!=''">
                      <br/>
                      <small>
                        <strong>
                          <xsl:value-of select="AdminNotes"/>
                        </strong>
                      </small>

                    </xsl:if>
                    
                  </td>

                  
                  <td>
                    <!-- trial set up -->
                    <small class="badge" rel="tooltip" title="Trial Setup">
                      <xsl:choose>
                        <xsl:when test="Url!=''">
                          <xsl:attribute name="class">badge bg-green</xsl:attribute>
                          <i class="fa fa-check"></i>
                        </xsl:when>
                        <xsl:otherwise>
                          <i class="fa fa-times"></i>
                        </xsl:otherwise>
                      </xsl:choose>
                    </small>
                  </td>
                  <td>
                    <!-- number of waiver forms -->
                    <span class="badge" rel="tooltip" title="Waiver Forms Setup">
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
                  
                  <td>
                    <!-- number of events -->
                    <span class="badge" rel="tooltip" title="Events">
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
                  <td>
                    <!-- number of signed waivers -->
                    <span class="badge" rel="tooltip" title="Signed Waivers">
                      <xsl:choose>
                        <xsl:when test="numSignedWaivers&gt;0">
                          <xsl:attribute name="class">badge bg-green</xsl:attribute>
                          <xsl:value-of select="numSignedWaivers"/>
                        </xsl:when>
                        <xsl:otherwise>0</xsl:otherwise>
                      </xsl:choose>
                    </span>
                  </td>
                  <td>
                    <!-- is a plan selected -->
                    <span class="badge" rel="tooltip" title="Plan Selected">
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
                  <td>
                    <span class="badge" rel="tooltip" title="Credit Card Added">
                      <xsl:choose>
                        <xsl:when test="Last4!=''">
                          <xsl:attribute name="class">badge bg-green</xsl:attribute>
                          <xsl:value-of select="CardType"/>
                        </xsl:when>
                        <xsl:otherwise>No</xsl:otherwise>
                      </xsl:choose>

                    </span>
                  </td>
                  <td>
                    <span class="badge" rel="tooltip" title="Total Payments">
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


                  <td rowspan="2">
                    <xsl:variable name="wrapclass">
                      <!-- if expired, render text red-->
                      <xsl:if test="substring(dt:difference($Now, ExpirationDate),1,1)='-'">
                        text-danger
                      </xsl:if>
                    </xsl:variable>

                  
                      
                        <xsl:if test="ExpirationDate!=''">
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
                        <small>
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
                        </small>
                          </xsl:if>
                     

                  </td>
                  <td rowspan="2">
                    
                    <asp:DropDownList runat="server" CssClass="form-control input-sm" AutoPostBack="True" ID="cboAction_{position()}" data-leadid="{leadid}"></asp:DropDownList>
                    
                  </td>
                </tr>
                <tr>
                  <td colspan="7">
                 
                    <xsl:choose>

                     
                      <xsl:when test="substring(NextFollowup,0,11)!='1753-01-01' ">
                        <!-- never followed up, but next date set-->
                        <xsl:choose>
                          <xsl:when test="daysUntilFollowupDue&lt;-7">
                            <div class="alert alert-danger small">
                              Followup over 1 week past due!
                            </div>
                          </xsl:when>
                          <xsl:when test="daysUntilFollowupDue&lt;-3">
                            <div class="alert alert-danger small">
                              Followup over 3 days past due!
                            </div>
                          </xsl:when>
                          <xsl:when test="daysUntilFollowupDue&lt;=0">
                            <div class="alert alert-warning small">
                              Followup due!
                            </div>
                          </xsl:when>
                          <xsl:when test="daysUntilFollowupDue&lt;=1">
                            <div class="alert alert-warning small">
                              Followup due tomorrow!
                            </div>
                          </xsl:when>
                          <xsl:when test="substring(NextFollowup,0,11)='9999-12-31'">
                            <small class="text-muted">Followup not set</small>
                          </xsl:when>
                          <xsl:otherwise>
                            
                              Followup due in <xsl:value-of select="daysUntilFollowupDue"/> days
                            
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:when>
                      <xsl:when test="substring(LastFollowup,0,11)!='1753-01-01'">
                        Last followup was <xsl:value-of select="daysSinceLastFollowup"/> days ago
                      </xsl:when>
                      <xsl:otherwise>
                        <!-- neither date set -->
                      </xsl:otherwise>
                      
                    </xsl:choose>
                    
           
                  </td>
                </tr>


               

              </xsl:for-each>

              <tr>
                <td colspan="7">
                      <xsl:variable name="topNum">
                        <xsl:choose>
                          <xsl:when test="($PageIdx * $PageSize) + $PageSize &lt; $TotalResults">
                            <xsl:value-of select="($PageIdx * $PageSize) + $PageSize"/>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:value-of select="$TotalResults"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:variable>

                  Showing <xsl:value-of select="($PageIdx * $PageSize) + 1"/> - <xsl:value-of select="$topNum"/> of <xsl:value-of select="$TotalResults"/> record<xsl:if test="$TotalResults!=1">s</xsl:if>

                </td>
              </tr>
              <tr>
                <td colspan="7">
                  <xsl:apply-templates mode="PAGING"/>
                </td>
              </tr>
              
            </tbody>
          </table>

          <!-- /.box-body -->
        </div>
    

  </xsl:template>


  <xsl:template mode="PAGING" match="*">
      
   
  
    <!--  INNER PAGING HERE <br/>
    PageIdx: <xsl:value-of select="$PageIdx"/><br/>
    PageSize: <xsl:value-of select="$PageSize"/><br/>
    NumPages: <xsl:value-of select="$NumPages"/><br/>
    TotalResults: <xsl:value-of select="$TotalResults"/><br/>-->


    <ul class="pagination">
      <xsl:choose>
        <xsl:when test="$PageIdx &gt; 0">
          <li>
            <a href="?pg={$PageIdx - 1}">
              <xsl:text disable-output-escaping="yes">&amp;laquo;</xsl:text>
            </a>
          </li>
        </xsl:when>
        <xsl:otherwise>
          <li class="disabled">
            <a href="javascript:void(0);">
              <xsl:text disable-output-escaping="yes">&amp;laquo;</xsl:text>
            </a>
          </li>
        </xsl:otherwise>
      </xsl:choose>


      <xsl:for-each select="/Main/pages/page">
        <li>
          <xsl:choose>
            <xsl:when test="@idx=$PageIdx">
              <xsl:attribute name="class">disabled</xsl:attribute>
              <a href="javascript:void();">
                <xsl:value-of select="@num"/>
              </a>
            </xsl:when>
            <xsl:otherwise>
              <a href="?pg={@idx}">
                <xsl:value-of select="@num"/>
              </a>
            </xsl:otherwise>
          </xsl:choose>
        </li>
      </xsl:for-each>


      <li>
        <xsl:choose>
          <xsl:when test="$PageIdx &lt; $NumPages - 1">
            <li>
              <a href="?pg={$PageIdx + 1}">
                <xsl:text disable-output-escaping="yes">&amp;raquo;</xsl:text>
              </a>
            </li>
          </xsl:when>
          <xsl:otherwise>
            <li class="disabled">
              <a href="javascript:void(0);">
                <xsl:text disable-output-escaping="yes">&amp;raquo;</xsl:text>
              </a>
            </li>
          </xsl:otherwise>
        </xsl:choose>


      </li>
    </ul>




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
