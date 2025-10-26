<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormWaiverFormGeneral.ascx.cs" Inherits="WaiverFile.Controls.FormWaiverFormGeneral" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register assembly="Waypoint" namespace="Waypoint.Forms" tagprefix="cc1" %>

            
<h3 runat="server" id="h3Main">Advanced Waiver Settings</h3>
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
               
               
    <div class="form-group">
        <label for="<%=txtName.ClientID %>">Waiver Form Name</label><asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
</div>
<asp:Panel ID="pnlLeadInText" runat="server">
<div class="form-group">
        <label for="<%=txtLeadInText.ClientID %>">Lead-in Text <cc1:WPHelpIcon ID="WPHelpIcon1" runat="server" HelpText="This text appears as a paragraph at the top of the waiver form just under the title.">
        </cc1:WPHelpIcon></label>
    <asp:TextBox ID="txtLeadInText" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
    <p class="help-block text-danger">The lead-in text feature is being phased out. Please move any text in this box to your agreement text box. <a href="../../Help.aspx">Contact us</a> if you have questions or need assistance. Thank you!</p>
</div>
    </asp:Panel>


   
          
<!-- disable this for now. not including dash colors right now -->
    <div class="form-group" style="display:none;">
        <label for="<%=txtName.ClientID %>">Dashboard Icon Color</label><telerik:RadColorPicker ID="rcpDashIconColor" runat="server" ShowIcon="true"></telerik:RadColorPicker>
</div>

    <div class="form-group">
        <label for="<%=txtMinAgeSignee.ClientID %>">Minimum Signee Age</label><asp:TextBox ID="txtMinAgeSignee" CssClass="form-control" runat="server"></asp:TextBox>
    </div>



    <div class="form-group">
        <label for="<%=txtMinAge.ClientID %>">Minimum Participant Age</label><asp:TextBox ID="txtMinAge" CssClass="form-control" runat="server"></asp:TextBox>
    </div>
<div class="form-group">
        <label for="<%=txtMaxAge.ClientID %>">Maximum Participant Age (when signing for someone else)</label><asp:TextBox ID="txtMaxAge" CssClass="form-control" runat="server"></asp:TextBox>
    <p class="note">Use this setting to prevent adults from signing for other adults. Error messages will indicate that adults must sign their own waiver.</p>
    </div>

    <div class="form-group">
        <label for="<%=txtMaxParticipants.ClientID %>">Maximum Participants Per Form</label><asp:TextBox ID="txtMaxParticipants" CssClass="form-control" runat="server"></asp:TextBox>
</div>

<div class="form-group">
    <label>Allow Adults to Sign For Children</label>
    <asp:CheckBox ID="chkAllowSigningForSomeoneElse" runat="server" /> 
</div> 

    <div class="form-group">
                    <label>Join the Mailing List Label</label><asp:TextBox ID="txtOptInLabel" runat="server" Checked="true" CssClass="form-control" Text="Join our mailing list"></asp:TextBox>
                        </div>
                    <div class="form-group">
                    <label>Join the Mailing List Additional Details</label><asp:TextBox ID="txtOptInDesc" runat="server" Checked="true" CssClass="form-control" Text=""></asp:TextBox>
                         <p class="help-block">This text will be displayed under the question.</p>
                        </div>

<div class="form-group">
    <label>Where to use this Waiver</label>
    <asp:DropDownList runat="server" CssClass="form-control" ID="cboWhereToUse">
        <asp:ListItem Value="BOTH">General Admission and Events</asp:ListItem>
        <asp:ListItem Value="EVENTS">Only Events</asp:ListItem>
        <asp:ListItem Value="GENADM">Only General Admission</asp:ListItem>
    </asp:DropDownList>
</div>

<asp:Panel runat="server" ID="pnlRefIDSettings">

  <h4>Reference ID Field Settings</h4>
                    <p>This will determine if the reference ID input field is shown and if it is required.</p>
                     <div class="form-group">
                      <label class="control-label" for="<%=cboRefIDsShowHide.ClientID %>">Input Field</label><asp:DropDownList ID="cboRefIDsShowHide" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>
                     <div class="form-group">
                      <label class="control-label" for="<%=cboRefIDsRequired.ClientID %>">Required</label><asp:DropDownList ID="cboRefIDsRequired" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>

       <div class="form-group">
                      <label class="control-label" for="<%=cboRefIDsCount.ClientID %>">How Many Reference ID Fields?</label><asp:DropDownList ID="cboRefIDsCount" CssClass="form-control" runat="server">
                          <asp:ListItem Value="Default">Default</asp:ListItem>
                          <asp:ListItem Value="1">1</asp:ListItem>
                          <asp:ListItem Value="2">2</asp:ListItem>
                          <asp:ListItem Value="3">3</asp:ListItem>
                                                                                                                               </asp:DropDownList>
                    </div>
    <hr />


</asp:Panel>
             
               

<div class="form-group">
    <label>Signing Options:</label>
    &nbsp;&nbsp;  <asp:CheckBox ID="chkSignOption_Adult" runat="server" Checked="true" /> <asp:Label id="lblLabelAdult" runat="server"/>
    &nbsp;&nbsp;&nbsp; <asp:CheckBox ID="chkSignOption_AdultChildren" runat="server" Checked="true" /> <asp:Label id="lblLabelAdultChildren" runat="server"/>
    &nbsp;&nbsp;&nbsp; <asp:CheckBox ID="chkSignOption_Children" runat="server" Checked="true" /> <asp:Label id="lblLabelChildren" runat="server"/>
</div> 
      <div class="form-group">
    <label>Disable Auto-Print <cc1:WPHelpIcon ID="WPHelpIcon2" runat="server" HelpText="Disables the auto-print feature (device mode only) for this form only. Check Settings, General Settings, to see if this feature is turned on. ">
        </cc1:WPHelpIcon></label>
    <asp:CheckBox ID="chkDisableAutoPrint" runat="server" />
         
</div> 


<div class="form-group">
    <label>Web Signature Mode</label>
    <asp:RadioButtonList runat="server" ID="rblSignatureBox">
        <asp:ListItem Value="SIGNATURE_BOX_ONLY">Real Signature - Uses an on-screen signature box to draw a real signature</asp:ListItem>
       
        <asp:ListItem Value="TYPE_ONLY">Type name - Enter your name and a cursive signature will be used</asp:ListItem>
         <asp:ListItem Value="SIGNATURE_OR_TYPE">Real Signature or type name - offer both options</asp:ListItem>
        <asp:ListItem Value="NO_SIGNATURE">Don't collect a signature</asp:ListItem>
    </asp:RadioButtonList>
         <p class="help-block">
             Signatures on the mobile app are always done using on-screen signatures. Since technologies on web-based signatures vary, choose which options are accepted. <br />
             Including the typed name option will ensure that the visually impaired can sign.
         </p>
</div> 
          

<asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" onclick="btnSave_Click" />

            


            