
<%@ Page Title="Add User" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="WaiverFile.site.admin.AddUser" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 
<%@ register src="~/Controls/AddSiteUser.ascx" tagprefix="uc1" tagname="AddSiteUser" %> 

<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 
<uc1:AddSiteUser runat ="server" id="AddSiteUser1" /> 
<p>&nbsp;</p>
<p><a href="Settings/Admin-Roles.aspx">What are the Access Levels?</a></p></asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
</asp:Content> 