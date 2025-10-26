
<%@ Page Title="Edit User Access" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EditUserAccess.aspx.cs" Inherits="WaiverFile.site.admin.settings.EditUserAccess" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 
<%@ register src="~/Controls/EditSiteUser.ascx" tagprefix="uc1" tagname="EditSiteUser" %> 
<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 
<uc1:EditSiteUser runat ="server" id="EditSiteUser1" /> 
<p>&nbsp;</p>
<p>&nbsp;</p>
<p><a href="Admin-Roles.aspx">What are the Access Levels?</a></p>
</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
</asp:Content> 