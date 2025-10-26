<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EditEmailTemplate.aspx.cs" Inherits="WaiverFile.site.admin.settings.EditEmailTemplate" %>

<%@ Register Src="~/Controls/WorkflowUI/FormEmailTemplate.ascx" TagPrefix="uc1" TagName="FormEmailTemplate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <uc1:FormEmailTemplate runat="server" id="FormEmailTemplate" />
</asp:Content>
