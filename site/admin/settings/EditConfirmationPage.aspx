<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EditConfirmationPage.aspx.cs" Inherits="WaiverFile.site.admin.settings.EditConfirmationPage" %>

<%@ Register Src="~/Controls/WorkflowUI/FormConfirmationPage.ascx" TagPrefix="uc1" TagName="FormConfirmationPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <uc1:FormConfirmationPage runat="server" id="FormConfirmationPage" />
</asp:Content>
