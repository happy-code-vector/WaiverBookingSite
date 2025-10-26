<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="SMSScheduledMessages.aspx.cs" Inherits="WaiverFile.site.admin.SMS.SMSScheduledMessages" %>

<%@ Register Src="~/Controls/WFSMSControls/ListWFSMSScheduledMessages.ascx" TagPrefix="uc1" TagName="ListWFSMSScheduledMessages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

<uc1:ListWFSMSScheduledMessages runat="server" ID="ListWFSMSScheduledMessages" />
</asp:Content>