<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Workflows.aspx.cs" Inherits="WaiverFile.site.admin.workflows.Workflows" %>

<%@ Register Src="~/Controls/WorkflowUI/ListWorkflows.ascx" TagPrefix="uc1" TagName="ListWorkflows" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <uc1:ListWorkflows runat="server" ID="ListWorkflows" />
</asp:Content>
