
<%@ Page Title="Advanced Search" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="AdvancedSearch.aspx.cs" Inherits="WaiverFile.site.admin.AdvancedSearch" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 
<%@ register src="~/Controls/SearchAdvancedv2.ascx" tagprefix="uc1" tagname="SearchAdvanced" %> 
<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 
<uc1:SearchAdvanced runat ="server" id="SearchAdvanced1" /> 
</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
</asp:Content> 