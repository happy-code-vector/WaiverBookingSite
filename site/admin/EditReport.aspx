<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EditReport.aspx.cs" Inherits="WaiverFile.site.admin.EditReport" %>
<%@ register src="~/Controls/WaiverReportsV4.ascx" tagprefix="uc1" tagname="WaiverReportsV4" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
        <uc1:WaiverReportsV4 runat ="server" id="WaiverReports1" /> 
</asp:Content>
