<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="SMS.aspx.cs" Inherits="WaiverFile.site.admin.SMS_old_page" %>

<%@ Register Src="~/Controls/WFSMSControls/Conversation.ascx" TagPrefix="uc1" TagName="Conversation" %>
<%@ Register Src="~/Controls/WFSMSControls/Inbox.ascx" TagPrefix="uc1" TagName="Inbox" %>
<%@ Register Src="~/Controls/WFSMSControls/ListWFSMSScheduledMessages.ascx" TagPrefix="uc1" TagName="ListWFSMSScheduledMessages" %>
<%@ Register Src="~/Controls/WFSMSControls/Queue.ascx" TagPrefix="uc1" TagName="Queue" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <!-- todo: bring back the inbox once we have 2 way going? -->
   
    <uc1:ListWFSMSScheduledMessages runat="server" ID="ListWFSMSScheduledMessages" />
    <hr />
    <uc1:Queue runat="server" id="Queue" />
    
</asp:Content>
