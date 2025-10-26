
<%@ Page Title="Waiver Search" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="WaiverSearch.aspx.cs" Inherits="WaiverFile.site.admin.WaiverSearch" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 
<%@ register src="~/Controls/WaiverSearchResults4.ascx" tagprefix="uc1" tagname="WaiverSearchResults4" %> 
<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 
<uc1:WaiverSearchResults4 runat ="server" id="WaiverSearchResults21" /> 
</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
</asp:Content> 