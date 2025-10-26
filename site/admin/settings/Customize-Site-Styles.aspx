
<%@ Page Title="Customize Site Styles" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="CustomizeSiteStyles.aspx.cs" Inherits="WaiverFile.site.admin.settings.CustomizeSiteStyles" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 
<%@ register src="~/Controls/FormSiteCSS.ascx" tagprefix="uc1" tagname="FormSiteCSS" %> 
<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 
<uc1:FormSiteCSS runat ="server" id="FormSiteCSS1" /> 
</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
</asp:Content> 