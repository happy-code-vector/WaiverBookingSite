
<%@ Page Title="User Search" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="UserSearch.aspx.cs" Inherits="WaiverFile.site.admin.UserSearch" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 
<%@ register src="~/Controls/UserSearchResults.ascx" tagprefix="uc1" tagname="UserSearchResults" %> 
<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 
<uc1:UserSearchResults runat ="server" id="UserSearchResults1" /> 
</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
</asp:Content> 