<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Viewer.aspx.cs" Inherits="WaiverFile.site.admin.workflows.Viewer" %>

<%@ register src="~/Controls/WorkflowUI/WFViewer2.ascx" tagprefix="uc1" tagname="WFViewer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <uc1:wfviewer runat="server" id="WFViewer" />
</asp:Content>
