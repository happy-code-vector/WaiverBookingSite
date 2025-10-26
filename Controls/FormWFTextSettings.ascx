<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormWFTextSettings.ascx.cs" Inherits="WaiverFile.Controls.FormWFTextSettings" %>
 <div class="widget">
    <h3>WaiverFile Text Settings</h3>
    <div class="widgetcontent">
    
    <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

        <p><label>Party Selection Heading</label><asp:TextBox ID="txtPartySelectionHeading" runat="server"></asp:TextBox></p>
        <p><label>Show More Events Button</label><asp:TextBox ID="txtShowMoreEventsButton" runat="server"></asp:TextBox></p>
        <p><label>Go Back Button</label><asp:TextBox ID="txtGoBackButton" runat="server"></asp:TextBox></p>
        <p><label>Waiver Form Heading</label><asp:TextBox ID="txtWaiverFormHeading" runat="server"></asp:TextBox></p>
        <p><label>Change Event Button</label><asp:TextBox ID="txtChangeEventButton" runat="server"></asp:TextBox></p>
        <p><label>Participant Label</label><asp:TextBox ID="txtParticipantLabel" runat="server"></asp:TextBox></p>
        <p><label>Multiple Participants Label</label><asp:TextBox ID="txtSigningForMultipleButton" runat="server"></asp:TextBox></p>
        <p><label>Multiple Participants Heading</label><asp:TextBox ID="txtMultipleParticipantsHeading" runat="server"></asp:TextBox></p>
        <p><label>General Admission</label><asp:TextBox ID="txtGeneralAdmissionName" runat="server"></asp:TextBox></p>


   <p><asp:Button ID="btnSave" runat="server" CssClass="btn" Text="Save" OnClick="btnSave_Click" /></p>

</div></div>
