<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:str="http://exslt.org/strings" xmlns:diffgr="urn:schemas-microsoft-com:xml-diffgram-v1" xmlns:set="http://exslt.org/sets"
                xmlns:dt="http://exslt.org/dates-and-times" xmlns:asp="remove" xmlns:telerik="remove" exclude-result-prefixes="str dt set">

  <xsl:output method="html" omit-xml-declaration="yes"/>

  <xsl:param name="Now"></xsl:param>
  <xsl:param name="UtcNow"></xsl:param>
  <xsl:param name="SchemeAndDomain"></xsl:param>

  <xsl:template match="/">

    
    <xsl:text disable-output-escaping="yes">
      
	    &lt;%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %&gt;
    </xsl:text>
   
    <script type="text/javascript">


      function handleSetFollowup(){
      if($('.cboSetFollowup').val()=='CUSTOM'){
      $('#divDatePickerNextFollowup').show();
      }else{
      $('#divDatePickerNextFollowup').hide();
      }
      }

      $(document).ready(function(){

      $('#btnShowHistory').click(function(){
      $('.historyrow').each(function(){ $(this).show(); });
      $(this).hide();
      });
      $('.cboSetFollowup').change(function(){ handleSetFollowup(); });

      $('#btnShowSetFollowup').click(function(){
      $(this).hide();
      $('#divSetFollowup').show();
      handleSetFollowup();

      });

      $('#btnShowChangeStatus').click(function(){
      $(this).hide();
      $('#divChangeStatus').show();
      });

      $('#btnShowStatusHistory').click(function(){
      $(this).hide();
      $('#btnHideStatusHistory').show();
      $('#rowStatusHistory').show();
      });

      $('#btnHideStatusHistory').click(function(){
      $(this).hide();
      $('#btnShowStatusHistory').show();
      $('#rowStatusHistory').hide();
      });

      $('#btnAssign').click(function(){
      $(this).hide();
      $('#divAssign').show();
      });

      });
    </script>
    
    <xsl:variable name="quote">'</xsl:variable>
    <xsl:variable name="quoteESC">\'</xsl:variable>

    


    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">
          <xsl:value-of select="/Main/Lead/Company"/>
          <xsl:if test="/Main/Lead/Company=''">
            <xsl:value-of select="/Main/Lead/FirstName"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="/Main/Lead/LastName"/>
          </xsl:if>
        <!--  
          <xsl:value-of select="/Main/Customer/Company"/>
          <xsl:if test="/Main/Customer/Company=''">
            <xsl:value-of select="/Main/Customer/FirstName"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="/Main/Customer/LastName"/>
          </xsl:if>-->
          <span class="addbuttons">
            <a href="?sc=WF_EDIT_LEAD&amp;c=1&amp;ID={/Main/Lead/ID}" class="ico_e">Edit Lead</a>

            <xsl:if test="/Main/Lead/CustomerID!='' and /Main/Lead/CustomerID!='00000000-0000-0000-0000-000000000000'">
              <a href="/wp-admin/default.aspx?sc=EDITCUSTOMERDETAILS&amp;id={/Main/Lead/CustomerID}&amp;c=1" class="ico_e">Edit Customer Details</a>
            </xsl:if>
            
          </span>
        </h3>
      </div>
      <!-- /.box-header -->
      <div class="box-body no-padding">
        <xsl:apply-templates mode="RenderProgress" select="/"></xsl:apply-templates>
      </div>
      <div class="box-body">

        <div class="row">
          <div class="col-sm-6">

            <xsl:variable name="Name">
              <xsl:choose>
                <xsl:when test="/Main/Customer/First_Name!=''">
                  <xsl:value-of select="/Main/Customer/First_Name"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="/Main/Customer/Last_Name"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="/Main/Lead/FirstName"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="/Main/Lead/LastName"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:variable>
            <xsl:variable name="Email">

              <xsl:choose>
                <xsl:when test="/Main/Customer/Email!=''">
                  <xsl:value-of select="/Main/Customer/Email"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="/Main/Lead/Email"/>
                </xsl:otherwise>
              </xsl:choose>

            </xsl:variable>


            <xsl:variable name="Company">

              <xsl:choose>
                <xsl:when test="/Main/Customer/Company!=''">
                  <xsl:value-of select="/Main/Customer/Company"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="/Main/Lead/Company"/>
                </xsl:otherwise>
              </xsl:choose>

            </xsl:variable>


            <strong>
              <xsl:value-of select="$Company"/>
            </strong>
            <br/>
            <xsl:text>Customer #: </xsl:text>
            <xsl:value-of select="/Main/Customer/CustomerNumber"/>
            <br/>
            <xsl:value-of select="$Name"/>
            
        
            
            <br/>
            <a href="mailto:{$Email}">
              <xsl:value-of select="$Email"/>
            </a>
            <xsl:text> (</xsl:text>
            <asp:LinkButton runat="server" id="btnCheckSEndGridBlocks" CommandArgument="{$Email}">Check for Block</asp:LinkButton>
            )
            <asp:Label runat="server" id="lblSendGridBlockStatus"></asp:Label>
            <asp:Button runat="server" id="btnUnblockEmail" Visible="false" CssClass="btn btn-sm btn-primary" Text="Unblock Email"></asp:Button>
            <br/>
            <xsl:if test="/Main/Lead/DataXml/Settings/setting[@key='Phone']/@value!=''">
              <label>Phone: </label>
              <xsl:text> </xsl:text>
              <xsl:value-of select="/Main/Lead/DataXml/Settings/setting[@key='Phone']/@value"></xsl:value-of>
            </xsl:if>
            <xsl:if test="count(/Main/Customer/Addresses/Address[IsDefaultBillingAddress='true'])!=0">
              <xsl:value-of select="/Main/Customer/Addresses/Address[IsDefaultBillingAddress='true']/Address1"/>
              <xsl:if test="/Main/Customer/Addresses/Address[IsDefaultBillingAddress='true']/Address2!=''">
                <br/>
                <xsl:value-of select="/Main/Customer/Addresses/Address[IsDefaultBillingAddress='true']/Address2"/>
              </xsl:if>
              <xsl:if test="/Main/Customer/Addresses/Address[IsDefaultBillingAddress='true']/Address3!=''">
                <br/>
                <xsl:value-of select="/Main/Customer/Addresses/Address[IsDefaultBillingAddress='true']/Address3"/>
              </xsl:if>
              <br/>
              <xsl:value-of select="/Main/Customer/Addresses/Address[IsDefaultBillingAddress='true']/City"/>
              <xsl:text>, </xsl:text>
              <xsl:value-of select="/Main/Customer/Addresses/Address[IsDefaultBillingAddress='true']/StateCode"/>
              <xsl:text> </xsl:text>
              <xsl:value-of select="/Main/Customer/Addresses/Address[IsDefaultBillingAddress='true']/ZipCode"/>
              <xsl:text> </xsl:text>
              <xsl:value-of select="/Main/Customer/Addresses/Address[IsDefaultBillingAddress='true']/CountryCode"/>
            </xsl:if>

            <xsl:if test="/Main/DataSet/diffgr:diffgram/NewDataSet/Table/Url!=''">
              <br/>
              <a href="{$SchemeAndDomain}/b/{/Main/DataSet/diffgr:diffgram/NewDataSet/Table/Url}" target="_blank">
                <xsl:value-of select="$SchemeAndDomain"/>
                <xsl:text>/b/</xsl:text>
                <xsl:value-of select="/Main/DataSet/diffgr:diffgram/NewDataSet/Table/Url"/>
              </a>
            </xsl:if>

          </div>
          <div class="col-sm-6">
            <!-- lead info -->
            <p>

              <xsl:choose>
                <xsl:when test="/Main/DataSet/diffgr:diffgram/NewDataSet/Table/AssignedTo='00000000-0000-0000-0000-000000000000'">
                  <label>Unassigned</label>
                </xsl:when>
                <xsl:otherwise>
                  <label>Assigned To</label>
                  <xsl:text> </xsl:text>
                  <xsl:variable name="assignedto">
                    <xsl:value-of select="/Main/DataSet/diffgr:diffgram/NewDataSet/Table/AssignedTo"/>
                  </xsl:variable>
                  <xsl:value-of select="/Main/ArrayOfWPUser/WPUser[ID=$assignedto]/First_Name"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="/Main/ArrayOfWPUser/WPUser[ID=$assignedto]/Last_Name"/>
                </xsl:otherwise>
              </xsl:choose>
              <xsl:text> </xsl:text>
              <small>
                <a href="javascript:void(0);" id="btnAssign">(Change)</a>
              </small>
            </p>
            <div class="form-group" id="divAssign" style="display:none;">
              
              <asp:DropDownList runat="server" ID="cboAssignTo" CssClass="form-control"></asp:DropDownList>
              <asp:Button runat="server" ID="btnAssignLead" CssClass="btn btn-primary" Text="Save"></asp:Button>
            </div>

            <p>
              <label>
                Last Followup:
              </label>
              <xsl:text> </xsl:text>
              <xsl:choose>
                <xsl:when test="/Main/Lead/LastFollowup='1753-01-01T00:00:00'">Never</xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="dt:format-date(/Main/Lead/LastFollowup,'MMM d, yyyy')"/>
                </xsl:otherwise>
              </xsl:choose>
            </p>
            <p>
              <label>
                Next Followup:
              </label>
              <xsl:text> </xsl:text>
              <xsl:choose>
                <xsl:when test="substring(/Main/Lead/NextFollowup,1,5)='1753' or substring(/Main/Lead/NextFollowup,1,5)='9999'">Not Set</xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="dt:format-date(/Main/Lead/NextFollowup,'MMM d, yyyy')"/>
                </xsl:otherwise>
              </xsl:choose>
              <small>
                <a href="javascript:void(0);" id="btnShowSetFollowup">(Change)</a>
              </small>

              <div id="divSetFollowup" style="display:none">
                <div class="form-group">
                <asp:DropDownList ID="cboSetFollowup" runat="server" CssClass="form-control cboSetFollowup">
                  <asp:ListItem Text="Tomorrow" Value="1DAY"></asp:ListItem>
                  <asp:ListItem Text="2 Days" Value="2DAYS"></asp:ListItem>
                  <asp:ListItem Text="3 Days" Value="3DAYS"></asp:ListItem>
                  <asp:ListItem Text="1 Week" Value="1WEEK"></asp:ListItem>
                  <asp:ListItem Text="2 Weeks" Value="2WEEKS"></asp:ListItem>
                  <asp:ListItem Text="Custom Date" Value="CUSTOM"></asp:ListItem>
                  <asp:ListItem Text="Never (no need to follow up)" Value="NEVER"></asp:ListItem>
                </asp:DropDownList>
                </div>
                <div class="form-group" id="divDatePickerNextFollowup">
                  <telerik:RadDatePicker runat="server" ID="dtNextFollowup">
                    <xsl:if test="substring(/Main/Lead/NextFollowup,1,4)!='1753' and substring(/Main/Lead/NextFollowup,1,4)!='9999'">
                    <xsl:attribute name="SelectedDate">
                      <xsl:value-of select="/Main/Lead/NextFollowup"></xsl:value-of>
                    </xsl:attribute>
                    </xsl:if>
                  </telerik:RadDatePicker>
                </div>
                <div class="form-group">
                  <asp:Button runat="server" ID="btnSetFollowup" CssClass="btn btn-primary" Text="Save"></asp:Button>
                </div>
              </div>
              
              
            </p>

            <xsl:if test="/Main/CustomerData/Source/Name!=''">
              <p>
                <label>Source: </label>
                <xsl:value-of select="/Main/CustomerData/Source/Name"/>
              </p>
            </xsl:if>


            <xsl:if test="/Main/CustomerData/AffiliateID!='00000000-0000-0000-0000-000000000000'">
              <p>
                <label>Affiliate: </label>
                <xsl:value-of select="/Main/CustomerData/Affiliate/Customer/Name"/>
                <xsl:if test="/Main/CustomerData/Affiliate/Customer/Name=''">
                  <xsl:value-of select="/Main/CustomerData/Affiliate/Customer/FirstName"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="/Main/CustomerData/Affiliate/Customer/LastName"/>
                  <xsl:text>, </xsl:text>
                  <xsl:value-of select="/Main/CustomerData/Affiliate/Customer/Company"/>
                </xsl:if>
              </p>
            </xsl:if>
            <xsl:if test="CRMStatusID!='00000000-0000-0000-0000-000000000000'">
              <p>
                <strong>CRM Status:</strong>
                <xsl:text> </xsl:text>
                <xsl:value-of select="Status/Name"/>
              </p>
            </xsl:if>


            <p>
              <label>
                Last Login:
              </label>
              <xsl:text> </xsl:text>
              <xsl:choose>
                <xsl:when test="/Main/DataSet/diffgr:diffgram/NewDataSet/Table/Last_Login='1753-01-01T00:00:00'">Never</xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="dt:format-date(Main/DataSet/diffgr:diffgram/NewDataSet/Table/Last_Login,'MMM d, yyyy hh:mm a')"/>
                </xsl:otherwise>
              </xsl:choose>
            </p>

          </div>
        </div>

        <xsl:if test="count(/Main/CustomerData/Details/CustomSettings/KeysAndValues/Key)!=0">
          <div class="row">
            <div class="col-xs-12">
              <h4>Additional Details</h4>
            </div>
          </div>
          <xsl:for-each select="/Main/CustomerData/Details/CustomSettings/KeysAndValues/Key">
            <xsl:variable name="key">
              <xsl:value-of select="."/>
            </xsl:variable>
            <div class="row">
              <div class="col-xs-12">
                
                <label>
                  <xsl:value-of select="$key"/>
                  <xsl:text>: </xsl:text>
                </label>
                <xsl:value-of select="/Main/CustomerData/Details/CustomSettings/KeysAndValues[Key=$key]/Value"/>
              </div>
            </div>
            
            
          </xsl:for-each>
          <div class="row">
          
            
            
          </div>
        </xsl:if>




        <!--        <xsl:if test="/Main/Lead/CurrentLeadLeadStatus/Status/Name!=''">-->
          <div class="row">
            <div class="col-xs-12">

              <!--<h4>Status</h4>
              <p>
                <xsl:text> </xsl:text>
                <span style="color:{/Main/Lead/CurrentLeadLeadStatus/Status/Color};">
                  <i class="fa fa-flag">
                    <xsl:text> </xsl:text>
                  </i>
                </span>
                <xsl:text> </xsl:text>
                <xsl:value-of select="/Main/Lead/CurrentLeadLeadStatus/Status/Name"/>
                <xsl:text> </xsl:text>

                <xsl:if test="/Main/Lead/CurrentLeadLeadStatus/Notes!=''">
                  <p class="help-block">
                    <xsl:value-of select="/Main/Lead/CurrentLeadLeadStatus/Notes"/>
                  </p>

                </xsl:if>
              </p>-->
          <div id="divChangeStatus" style="display:none;">
            <p>
              <label>New Status:</label>
              <asp:DropDownList runat="server" ID="cboStatus" CssClass="form-control"></asp:DropDownList>
            </p>
            <p>
              <label>Notes:</label>
              <asp:TextBox runat="server" ID="txtStatusNotes" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
            </p>
            <p>
              <asp:CheckBox ID="chkMarkAsFollowedUp" runat="server" Text="Mark as Followed Up" Checked="true"></asp:CheckBox>
            </p>
            <p>
              <asp:Button runat="server" ID="btnSaveStatus" CssClass="btn btn-primary" Text="Save Status"></asp:Button>
            </p>
          </div>

            </div>
          </div>
          
        <!--</xsl:if>-->
       

        <div class="row" id="rowShowStatusHistory">
          <div class="col-xs-12">
            <small>
              <a href="javascript:void(0);" id="btnShowStatusHistory" style="display:none;">Show Status History</a>
              
            </small>
          </div>
        </div>

        <div class="row" id="rowStatusHistory">
          <div class="col-xs-12">
            <h4>
              Lead Status
              <xsl:text> </xsl:text>
              <div class="pull-right">
                <a href="javascript:void(0);" id="btnShowChangeStatus" class="btn btn-primary btn-sm">Set Status</a>
              </div>
            <!--<small>
              <a href="javascript:void(0);" id="btnHideStatusHistory">Hide Status History</a>
            </small>-->
            </h4>
            <table class="table table-condensed">
              <thead>
                <tr>
                  <th>
                    <xsl:text> </xsl:text>
                  </th>
                  <th>Status</th>
                  <th>Date</th>
                  <th>Saved By</th>
                  <th>Notes</th>
                </tr>
              </thead>
              <tbody>
                <xsl:for-each select="/Main/ArrayOfLeadLeadStatus/LeadLeadStatus">
                  <tr>
                    <xsl:if test="position()=1">
                      <xsl:attribute name="class">active</xsl:attribute>
                      <xsl:attribute name="style">font-weight:bold;</xsl:attribute>
                    </xsl:if>
                    <td>
                      <span style="color:{Status/Color};">
                        <i class="fa fa-flag">
                          <xsl:text> </xsl:text>
                        </i>
                      </span>
                    </td>
                    <td>
                      <xsl:value-of select="Status/Name"/>
                    </td>
                    <td>
                      <xsl:value-of select="dt:format-date(DateSet,'MMM d, yyyy h:mm a')"/>
                    </td>
                    <td>
                      <xsl:value-of select="SetByUser/First_Name"/>
                      <xsl:text> </xsl:text>
                      <xsl:value-of select="SetByUser/Last_Name"/>
                    </td>
                    <td>
                      <xsl:value-of select="Notes"/>
                    </td>

                  </tr>

                </xsl:for-each>
              </tbody>
            </table>


            <xsl:if test="count(/Main/ArrayOfWFSubscriptionChangeLog/WFSubscriptionChangeLog)!=0">

            <h4>
              Recent Account Changes
              <xsl:text> </xsl:text>
              <div class="pull-right">
                <a href="{$SchemeAndDomain}/wp-admin/default.aspx?sc=WFCRM_VIEW_CUSTOMER_CHANGE_LOG&amp;id={/Main/Lead/CustomerID}&amp;c=1" class="btn btn-default btn-sm">View Complete History</a>
              </div>
              <!--<small>
              <a href="javascript:void(0);" id="btnHideStatusHistory">Hide Status History</a>
            </small>-->
            </h4>
            <table class="table table-condensed">
              <thead>
                <tr>
                  <th>Date</th>
                  <th>Change</th>
                  <th>Changed By</th>
                  <th>Details</th>
                </tr>
              </thead>
              <tbody>
                <xsl:for-each select="/Main/ArrayOfWFSubscriptionChangeLog/WFSubscriptionChangeLog">
                  <tr>
                    <xsl:if test="position() &gt; 3">
                      <xsl:attribute name="style">display:none;</xsl:attribute>
                      <xsl:attribute name="class">historyrow</xsl:attribute>
                    </xsl:if>
                    <td>
                      <xsl:value-of select="dt:format-date(DateSaved,'MMM d, yyyy h:mm a')"/>
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

              <xsl:if test="count(/Main/ArrayOfWFSubscriptionChangeLog/WFSubscriptionChangeLog) &gt;3 ">
                <p class="text-center">
                <a href="javascript:void(0);" id="btnShowHistory">Show More</a>
                </p>
              </xsl:if>
            </xsl:if>
          </div>
        </div>
        
        

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
