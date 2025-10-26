<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EditWorkflow.aspx.cs" Inherits="WaiverFile.site.admin.workflows.EditWorkflow" %>

<%@ Register Src="~/Controls/WorkflowUI/WorkflowEditor.ascx" TagPrefix="uc1" TagName="WorkflowEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <uc1:WorkflowEditor runat="server" ID="WorkflowEditor" />
</asp:Content>
