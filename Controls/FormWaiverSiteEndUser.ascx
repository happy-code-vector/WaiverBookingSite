<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormWaiverSiteEndUser.ascx.cs" Inherits="WaiverFile.Controls.FormWaiverSiteEndUser" %>
<%@ Register Assembly="Waypoint" Namespace="Waypoint.Forms" TagPrefix="cc1" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<script type="text/javascript">

    function showHideRefIDSettings() {
        //divRefIDSettings
        if ($('#<%=chkEnableReferenceIDs.ClientID%>').is(':checked')) {
            $('#divRefIDSettings').show();
        } else {
            $('#divRefIDSettings').hide();
        }
    }
    $(function () {
        $('.btnAdvancedOptions').click(function () {
            $('#rowAdvancedOptions').show();
            $('.btnAdvancedOptions').hide();
        });
        showHideRefIDSettings();
        $('#<%=chkEnableReferenceIDs.ClientID%>').change(function () {
            showHideRefIDSettings();
        });
    
    });
</script>
            <div class="form" role="form">
                <h3>General Settings</h3>
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
               
               
                 <div class="form-group">
                      <label class="control-label" for="<%=txtName.ClientID %>">Site Name <cc1:WPHelpIcon runat="server" HelpText="This is displayed on the top of your WaiverFile site and in emails that are sent out."></cc1:WPHelpIcon></label><asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                      <label class="control-label" for="<%=cboTimeZone.ClientID %>">Time Zone</label><asp:DropDownList ID="cboTimeZone" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>

                <div class="form-group">
                      <label class="control-label" for="<%=cboDateFormat.ClientID %>">Date Format</label><asp:DropDownList ID="cboDateFormat" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>

                <div class="form-group">
                      <label class="control-label" for="<%=cboDateEntry.ClientID %>">Date Entry Mode</label><asp:DropDownList ID="cboDateEntry" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>



                <div class="form-group">
                      <label class="control-label" for="<%=cboDayEnds.ClientID %>">What time does your day end? <cc1:WPHelpIcon runat="server" HelpText="If your business is open past midnight, you can specify a later time to be the end of 'today'. This affects how events are loaded on the upcoming event screen."></cc1:WPHelpIcon></label><asp:DropDownList ID="cboDayEnds" CssClass="form-control" runat="server">
                          <asp:ListItem Value="0">12 AM (midnight)</asp:ListItem>
                          <asp:ListItem Value="1">1 AM</asp:ListItem>
                          <asp:ListItem Value="2">2 AM</asp:ListItem>
                          <asp:ListItem Value="3">3 AM</asp:ListItem>
                          <asp:ListItem Value="4">4 AM</asp:ListItem>
                          <asp:ListItem Value="5">5 AM</asp:ListItem>
                          <asp:ListItem Value="6">6 AM</asp:ListItem>
                      </asp:DropDownList>
                        <small>This will determine when 'Today' becomes 'Tomorrow' for upcoming events.</small>
                </div>

                         <div class="form-group">
                      <label class="control-label" for="<%=cboCheckinResetMode.ClientID %>">Repeat Check-In Mode</label><asp:DropDownList ID="cboCheckinResetMode" CssClass="form-control" runat="server"></asp:DropDownList>
                
                         </div>
                 
               

                
                  <div class="form-group">
                    <label>Separate name fields info First and Last <cc1:WPHelpIcon runat="server" HelpText="When checked, first and last names will be collected separately. If not checked, a single textbox will appear for each name."></cc1:WPHelpIcon></label>
                    <asp:CheckBox ID="chkSeparateFirstName" runat="server" />
                </div> 

               
                   
                 <div class="form-group">
                    <label>Disable Signature &amp; Initial Adopt Feature <cc1:WPHelpIcon runat="server" HelpText="Disables signature and initial adoption feature. Signees will have to sign and initial each specified location one at a time."></cc1:WPHelpIcon></label>
                    <asp:CheckBox ID="chkDisableSigAdopt" runat="server" />
                </div> 

               <div class="form-group">
                    <label>Enable QR-Code Scanning Check-in Features  <cc1:WPHelpIcon runat="server" HelpText="Customers will receive a QR code ticket after signing. Use the WaiverScan app on iOS or Android to scan tickets for entry. "></cc1:WPHelpIcon></label>
                    <asp:CheckBox ID="chkEnableQRCodeScanning" runat="server" />
                </div> 
                  <div class="form-group">
                    <label>Enable Reference IDs  <cc1:WPHelpIcon runat="server" HelpText="For integrating with booking and other systems. Pass a reference ID to each waiver signed to link it back."></cc1:WPHelpIcon></label>
                    <asp:CheckBox ID="chkEnableReferenceIDs" runat="server" />
                </div> 

                <div id="divRefIDSettings">
                    <h4>Reference ID Default Field Settings</h4>
                    <p>This will determine if the reference ID input field is shown and if it is required. These default settings can be overridden for specific waiver forms under their Advanced Settings screen.</p>
                     <div class="form-group">
                      <label class="control-label" for="<%=cboRefIDsShowHide.ClientID %>">Input Field</label><asp:DropDownList ID="cboRefIDsShowHide" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>
                     <div class="form-group">
                      <label class="control-label" for="<%=cboRefIDsRequired.ClientID %>">Required</label><asp:DropDownList ID="cboRefIDsRequired" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                      <label class="control-label" for="<%=cboRefIDsCount.ClientID %>">How Many Reference ID Fields?</label><asp:DropDownList ID="cboRefIDsCount" CssClass="form-control" runat="server">
                          <asp:ListItem Value="1">1</asp:ListItem>
                          <asp:ListItem Value="2">2</asp:ListItem>
                          <asp:ListItem Value="3">3</asp:ListItem>
                                                                                                                               </asp:DropDownList>
                    </div>
                    <hr />
                </div>

                 <div class="form-group">
                      <label class="control-label" for="<%=txtReplyTo.ClientID %>">Reply-to Email Address <cc1:WPHelpIcon runat="server" HelpText="When customers reply to emails sent from our system, they will be directed to this email address."></cc1:WPHelpIcon></label><asp:TextBox ID="txtReplyTo" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                      <label class="control-label" for="<%=txtExpirationDays.ClientID %>">Waiver Expiration Age (days) <cc1:WPHelpIcon runat="server" HelpText="When waivers are older than this many days, they will be displayed as expired in the admin dashboard. Waivers are never deleted, they are just highlighted as expired. Leave blank to disable this feature."></cc1:WPHelpIcon></label><asp:TextBox ID="txtExpirationDays" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                 
                <hr />


                <div class="row">
                    <div class="col-sm-6">
                          <h4>Public Signature Area</h4>
                        <small class="help-block">Your public signature area is located at <a href="<%=site.BaseUrlAbsolute %>" target="_blank"><%=site.BaseUrlAbsolute %></a></small>
                 
                     

                     



                        <div class="form-group">
                            <label><asp:CheckBox ID="chkDateAttendingPublic" runat="server" /> Include Date Attending Field</label>
                        </div> 
                          <div class="form-group">
                           <asp:DropDownList runat="server" ID="cboDateAttendingWarningModePublic">
                               <asp:ListItem Value="WARN">Warn</asp:ListItem>
                               <asp:ListItem Value="PREVENT">Prevent submission</asp:ListItem>
                               <asp:ListItem Value="NOTHING">Do nothing</asp:ListItem>
                           </asp:DropDownList>  if date is more than <asp:TextBox runat="server" ID="txtDateAttendingWarningDaysPublic" Width="55px"></asp:TextBox> days away.
                        </div> 
                        <div class="form-group">
                            <label><asp:CheckBox ID="chkCaptchaPublic" runat="server" /> Require Captcha Code Verification <cc1:WPHelpIcon runat="server" HelpText="Prevents robot or spam entries. We don't recommend enabling this unless you are receiving these kinds of entries."></cc1:WPHelpIcon></label>
                           
                        </div> 
                        <div class="form-group">
                            <label><asp:CheckBox ID="chkOfferPrintButton" runat="server" /> Offer Print Button <cc1:WPHelpIcon runat="server" HelpText="When checked, customers will see a button offering to print their waiver upon completion."></cc1:WPHelpIcon></label>
                            
                        </div>
                        
                    </div>
                   
                    <div class="col-sm-6">
                        <h4>Device Signature Area</h4>
                         <small class="help-block">Device settings are used when signing on a kiosk with the <a href="https://www.waiverfile.com/WaiverFile-App-Store.aspx" target="_blank">WaiverFile app</a> or when signing on the "device" URL: <a href="<%=site.BaseUrlAbsoluteDevice %>" target="_blank"><%=site.BaseUrlAbsoluteDevice %></a></small>
                 
                         <div class="form-group">
                            <label><asp:CheckBox ID="chkDateAttendingDevice" runat="server" /> Include Date Attending Field</label>
                        </div> 
                        <div class="form-group">
                           <asp:DropDownList runat="server" ID="cboDateAttendingWarningModeDevice">
                               <asp:ListItem Value="WARN">Warn</asp:ListItem>
                               <asp:ListItem Value="PREVENT">Prevent submission</asp:ListItem>
                               <asp:ListItem Value="NOTHING">Do nothing</asp:ListItem>
                           </asp:DropDownList>  if date is more than <asp:TextBox runat="server" ID="txtDateAttendingWarningDaysDevice" Width="55px"></asp:TextBox> days away.
                        </div> 

                        <div class="form-group">
                            <label><asp:CheckBox ID="chkCaptchaDevice" runat="server" />Require Captcha Code Verification <cc1:WPHelpIcon runat="server" HelpText="Prevents robot or spam entries. We don't recommend enabling this unless you are receiving these kinds of entries."></cc1:WPHelpIcon></label>
                            
                        </div> 
                        <div class="form-group">
                            <label> <asp:CheckBox ID="chkAutoCheckInOnDevice" runat="server" /> Automatically check in people who sign on the device address.   <cc1:WPHelpIcon runat="server" HelpText="When enabled, customers signing on your device address will be automatically marked as checked in."></cc1:WPHelpIcon></label>
                        </div> 
                         <div class="form-group">
                            <label><asp:CheckBox ID="chkAutoPrintDeviceVersion" runat="server" /> Auto Print Receipt <cc1:WPHelpIcon runat="server" HelpText="When checked, the receipt will automatically print. Recommended to work with kiosk mode."></cc1:WPHelpIcon></label>
                            
                        </div>
                    </div>

                       
                        
                      
                          </div>
                    
                </div>
                
                <hr />
                 
    <div class="row">
        <div class="col-sm-6">
            <div class="form-group">
                <label>Permitted redirect domains</label>
                <asp:TextBox runat="server" ID="txtPermitedRedirectDomains" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
            </div>
            </div>
             <div class="col-sm-6">
            <p class="help-block">When setting up special links that will redirect to another location after signing is complete, you will need to 
                enter the permitted domains here. Only the domains entered here will be allowed. Enter one domain per line or separated by commas.
                Enter domains or URL's - links to redirect must <strong>START WITH</strong> one of your entries in order to be permitted. 
                <br />
                
                Example:<br />
                https://mydomain.com<br />
                http://www.mydomain.com
                <br /><br />
                If you are not sure what to enter here, please <a href="/Contact.aspx" target="_blank">contact support</a> and we can assist. 

            </p>
        </div>
    </div>

               
                 <hr />


                <div class="row">
                    <div class="col-xs-12">
                        <p>
                        <a href="javascript:void(0);" class="btnAdvancedOptions">Advanced Options</a>
                            </p>
                        <p> </p>
                    </div>
                </div>
                <div style="display:none;" id="rowAdvancedOptions">
                    <hr />
                     
                       <div class="row">
       <div class="col-xs-12"><!-- no workflows yet, it's not ready -->

                 <div class="form-group">
                    <label>Allow Customers to Create Logins <cc1:WPHelpIcon runat="server" HelpText="When checked, customers will be able to create a password that will allow them to log in and pre-fill their waiver on repeat visits. "></cc1:WPHelpIcon></label>
                    <asp:CheckBox ID="chkEnableLogin" runat="server" />
                     <p class="help-block">NOT RECOMMENDED for most accounts. This creates a password box on waiver forms which we have found confuses end users. If you have very complex forms with lots of questions that users must complete repeatedly, then offering the option to create a password can make sense, however outside of this scenario, we do not recommend enabling this feature.</p>
                </div> 

                 
                    </div>
                  
                 
                </div>
               
               <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" onclick="btnSave_Click" />
            </div>

            