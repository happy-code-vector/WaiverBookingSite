<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="WorkflowNavFieldSelect.aspx.cs" Inherits="WaiverFile.Controls.WorkflowUI.WorkflowNavFieldSelect" %>

<%@ register src="~/Controls/FieldSelector.ascx" tagprefix="uc1" tagname="FieldSelector" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

        <uc1:fieldselector runat="server" id="FieldSelector1" />

</asp:Content>
