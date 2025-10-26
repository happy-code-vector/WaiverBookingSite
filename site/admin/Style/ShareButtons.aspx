
<%@ Page Title="Share Buttons" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="ShareButtons.aspx.cs" Inherits="WaiverFile.site.admin.Style.ShareButtons" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 

<%@ register src="~/Controls/ListShareButtons.ascx" tagprefix="uc1" tagname="ListShareButtons" %> 
<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 

<h1>Share Buttons</h1>
<p>Adding links from your website to your WaiverFile site is easy! Select the style of button you'd like to use below and get code that you add to your website. Need help? <a href="../Help.aspx">Contact us! </a></p>

<uc1:ListShareButtons runat ="server" id="ListShareButtons1" /> 
</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
</asp:Content> 