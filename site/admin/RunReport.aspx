<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="RunReport.aspx.cs" Inherits="WaiverFile.site.admin.RunReport" %>

<%@ register src="~/Controls/WaiverReportsV3Run.ascx" tagprefix="uc1" tagname="WaiverReportsV3Run" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <uc1:WaiverReportsV3Run runat ="server" id="WaiverReportsV3Run1" /> 

</asp:Content>
