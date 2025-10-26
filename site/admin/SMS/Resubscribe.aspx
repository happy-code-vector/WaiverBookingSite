<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Resubscribe.aspx.cs" Inherits="WaiverFile.site.admin.SMS.Resubscribe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <h3>Resubscribe</h3>
    <p>The subscriber you are trying to add has been unsubscribed. Only re-add this number if you have permission to do so.</p>
    <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>
    
    <asp:Panel runat="server" ID="pnlMain">
    <table class="table table-condensed">
        <tr>
            <td><strong>Name</strong></td><td><asp:Label ID="lblName" runat="server"></asp:Label></td></tr><tr>
            <td><strong>Mobile Number</strong></td><td><asp:Label ID="lblNumber" runat="server"></asp:Label></td></tr><tr>
            <td><strong>Unsubscribe Date</strong></td><td><asp:Label ID="lblUnsubDate" runat="server"></asp:Label></td>
        </tr>
    </table>

    <p class="help-block"><asp:CheckBox runat="server" ID="chkSMSOptIn" /> I have permission to send SMS text messages to this number. (<a href="https://www.waiverfile.com/Policies/Messaging-Policy.aspx" target="_blank">Messaging policy <i class="fa fa-external-link"></i></a>)                    </p>
    <asp:Button runat="server" ID="btnResub" CssClass="btn btn-primary" Text="Resubscribe" OnClick="btnResub_Click" />
    <asp:Button runat="server" ID="btnCancel" CssClass="btn btn-muted" Text="Cancel" OnClick="btnCancel_Click" />
</asp:Panel>

</asp:Content>
