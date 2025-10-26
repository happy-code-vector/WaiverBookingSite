<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListWaiverReports.ascx.cs" Inherits="WaiverFile.Controls.ListWaiverReports" %>
<asp:PlaceHolder ID="phMain" runat="server"></asp:PlaceHolder>

<asp:Panel runat="server" ID="pnlNoReports" Visible="false">
    <p>You have no reports. Use the button below to restore the default reports.</p>
    <asp:Button runat="server" ID="btnGenerate" OnClick="btnGenerate_Click" Text="Restore Default Reports" CssClass="btn btn-primary" />
</asp:Panel>
