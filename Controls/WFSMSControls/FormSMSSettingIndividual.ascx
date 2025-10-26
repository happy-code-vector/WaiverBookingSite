<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormSMSSettingIndividual.ascx.cs" Inherits="WaiverFile.Controls.WFSMSControls.FormSMSSettingIndividual" %>
<%@ Register Assembly="Waypoint" Namespace="Waypoint.Forms" TagPrefix="cc1" %>

<hr />
<h3><asp:Label ID="lblTitle" runat="server"></asp:Label></h3>



 <div class="form-group">
            <label><asp:CheckBox runat="server" ID="chkEnabled" /> Include Mobile Number Field</label>
        </div>

<div class="form-group">
            <label>Field Location</label>
            <asp:DropDownList runat="server" ID="cboLocation" CssClass="form-control">
                <asp:ListItem Value="WaiverEntry_phAfterCustomQuestions">After Custom Questions</asp:ListItem>
                <asp:ListItem Value="WaiverEntry_phAfterStandardFields">After standard fields</asp:ListItem>
                <asp:ListItem Value="WaiverEntry_phAfterParticipantFields">After participant fields</asp:ListItem>
                <asp:ListItem Value="WaiverEntry_phAfterCreatePassword">After create password</asp:ListItem>
                <asp:ListItem Value="WaiverEntry_phAfterJoinMailingList">After join the mailing list</asp:ListItem>
                <asp:ListItem Value="WaiverEntry_phJustBeforeSubmit">Just before submit button</asp:ListItem>
            </asp:DropDownList>
        </div>

<div class="form-group">
            <label><asp:CheckBox runat="server" ID="chkRequire" /> Make Field Required</label>
        </div>


        <div class="form-group">
            <label>Field Name</label>
            <asp:TextBox ID="txtFieldName" runat="server" CssClass="form-control" placeholder="Label for the mobile number field"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Field Help Text <cc1:WPHelpIcon runat="server" HelpText="HTML code is permitted in the help text."></cc1:WPHelpIcon></label>
        </div>
<div class="form-group">
<asp:TextBox ID="txtHelpText" runat="server" CssClass="form-control htmlenabled" TextMode="MultiLine"></asp:TextBox>
    </div>


