<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="SMSInbox.aspx.cs" Inherits="WaiverFile.site.admin.SMS.SMSInbox" %>

<%@ Register Src="~/Controls/WFSMSControls/Inbox.ascx" TagPrefix="uc1" TagName="Inbox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <uc1:Inbox runat="server" ID="Inbox" />
</asp:Content>
