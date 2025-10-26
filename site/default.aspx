<%@ Page Title="WaiverFile | Online Waiver Form Entry" Language="C#" MasterPageFile="~/MasterPages/Splash.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="WaiverFile.site._default" %>

<%@ register src="~/Controls/IPAAutoLogOut.ascx" tagprefix="uc1" tagname="IPAAutoLogOut" %>
<%@ register src="~/Controls/WelcomeScreen.ascx" tagprefix="uc1" tagname="WelcomeScreen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph0" runat="server">
    
    <uc1:ipaautologout runat="server" id="IPAAutoLogOut" />
    <uc1:WelcomeScreen runat="server" id="WelcomeScreen" />
    
</asp:Content>
