<%@ Page Title="Manage Waiver Flags" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="ManageWaiverFlags.aspx.cs" Inherits="WaiverFile.site.admin.settings.ManageWaiverFlags" %>

<%@ Register Src="~/Controls/ListWaiverFlags.ascx" TagPrefix="uc1" TagName="ListWaiverFlags" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <uc1:ListWaiverFlags runat="server" ID="ListWaiverFlags" />

</asp:Content>
