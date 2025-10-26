
<%@ Page Title="General Settings" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="GeneralSettings.aspx.cs" Inherits="WaiverFile.site.admin.settings.GeneralSettings" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 
<%@ register src="~/Controls/FormWaiverSiteEndUser.ascx" tagprefix="uc1" tagname="FormWaiverSiteEndUser" %> 
<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 
<uc1:FormWaiverSiteEndUser runat ="server" id="FormWaiverSiteEndUser1" /> 
</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
</asp:Content> 