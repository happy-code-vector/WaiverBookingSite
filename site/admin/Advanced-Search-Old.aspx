<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Advanced-Search-Old.aspx.cs" Inherits="WaiverFile.site.admin.Advanced_Search_Old" %>
<%@ register src="~/Controls/SearchAdvanced.ascx" tagprefix="uc1" tagname="SearchAdvanced" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <uc1:SearchAdvanced runat ="server" id="SearchAdvanced1" /> 
</asp:Content>
