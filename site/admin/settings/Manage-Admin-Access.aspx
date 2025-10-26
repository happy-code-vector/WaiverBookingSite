
<%@ Page Title="Manage Admin Access" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="ManageAdminAccess.aspx.cs" Inherits="WaiverFile.site.admin.settings.ManageAdminAccess" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 
<%@ register src="~/Controls/ListSiteUsers.ascx" tagprefix="uc1" tagname="ListSiteUsers" %> 
<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 
<uc1:ListSiteUsers runat ="server" id="ListSiteUsers1" /> 
</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
</asp:Content> 