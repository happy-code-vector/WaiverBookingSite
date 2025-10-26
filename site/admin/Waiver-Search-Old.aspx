<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Waiver-Search-Old.aspx.cs" Inherits="WaiverFile.site.admin.Waiver_Search_Old" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 
<%@ register src="~/Controls/WaiverSearchResults3.ascx" tagprefix="uc1" tagname="WaiverSearchResults3" %> 
<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 
<uc1:WaiverSearchResults3 runat ="server" id="WaiverSearchResults21" /> 
</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
</asp:Content> 