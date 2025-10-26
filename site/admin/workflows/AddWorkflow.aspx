<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="AddWorkflow.aspx.cs" Inherits="WaiverFile.site.admin.workflows.AddWorkflow" %>

<%@ Register Src="~/Controls/WorkflowUI/FormAddWorkflow.ascx" TagPrefix="uc1" TagName="FormAddWorkflow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <uc1:FormAddWorkflow runat="server" id="FormAddWorkflow1" />
</asp:Content>
