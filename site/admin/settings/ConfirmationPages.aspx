<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="ConfirmationPages.aspx.cs" Inherits="WaiverFile.site.admin.settings.ConfirmationPages" %>

<%@ Register Src="~/Controls/WorkflowUI/ListConfirmationPages.ascx" TagPrefix="uc1" TagName="ListConfirmationPages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <uc1:ListConfirmationPages runat="server" id="ListConfirmationPages" />
</asp:Content>
