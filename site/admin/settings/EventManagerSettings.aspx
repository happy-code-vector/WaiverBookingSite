<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EventManagerSettings.aspx.cs" Inherits="WaiverFile.site.admin.settings.EventManagerSettingsPage" %>

<%@ register src="~/Controls/EventManagerSettings.ascx" tagprefix="uc1" tagname="EventManagerSettingsForm" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <uc1:EventManagerSettingsForm runat ="server" id="EventManagerSettingsForm1" /> 
</asp:Content>
