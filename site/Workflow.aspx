<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Public.Master" AutoEventWireup="true" CodeBehind="Workflow.aspx.cs" Inherits="WaiverFile.site.Workflow_Page" %>

<%@ Register Src="~/Controls/WorkflowUI/WorkflowNavigator.ascx" TagPrefix="uc1" TagName="WorkflowNavigator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph2" runat="server">
    <uc1:WorkflowNavigator runat="server" ID="WorkflowNavigator1" />
</asp:Content>
