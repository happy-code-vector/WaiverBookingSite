<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="SMSEditScheduled.aspx.cs" Inherits="WaiverFile.site.admin.SMSEditScheduled" %>

<%@ Register Src="~/Controls/WFSMSControls/FormWFSMSScheuledMessageV2.ascx" TagPrefix="uc1" TagName="FormWFSMSScheduledMessage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <uc1:FormWFSMSScheduledMessage runat="server" id="FormWFSMSScheduledMessage" />
</asp:Content>
