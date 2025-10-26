
<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="WaiverFile.site.admin.settings.ChangePassword" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 
<%@ register src="/wp-content/Controls/Security/ResetPassword.ascx" tagprefix="uc1" tagname="ResetPassword" %> 
<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 
<uc1:ResetPassword runat ="server" id="ResetPassword1" /> 
</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
</asp:Content> 