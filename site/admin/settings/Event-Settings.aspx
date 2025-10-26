<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Event-Settings.aspx.cs" Inherits="WaiverFile.site.admin.settings.Event_Settings" %>

<%@ Register Src="~/Controls/FormWaiverSiteEventSettings.ascx" TagPrefix="uc1" TagName="FormWaiverSiteEventSettings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <uc1:FormWaiverSiteEventSettings runat="server" id="FormWaiverSiteEventSettings" />
</asp:Content>
