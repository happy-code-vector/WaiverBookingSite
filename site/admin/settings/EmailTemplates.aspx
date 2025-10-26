<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EmailTemplates.aspx.cs" Inherits="WaiverFile.site.admin.settings.EmailTemplates" %>

<%@ Register Src="~/Controls/WorkflowUI/ListEmailTemplates.ascx" TagPrefix="uc1" TagName="ListEmailTemplates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <uc1:ListEmailTemplates runat="server" id="ListEmailTemplates" />
</asp:Content>
