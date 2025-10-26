<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="WaiverFile.site.admin.ChangePassword" %>
<%@ register src="/wp-content/Controls/Security/ResetPassword.ascx" tagprefix="uc1" tagname="ResetPassword" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

    <uc1:ResetPassword runat="server" id="ResetPassword1" /> 

  
</asp:Content>
