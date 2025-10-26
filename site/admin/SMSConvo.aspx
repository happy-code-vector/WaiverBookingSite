<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="SMSConvo.aspx.cs" Inherits="WaiverFile.site.admin.SMSConvo" %>

<%@ Register Src="~/Controls/WFSMSControls/Conversation.ascx" TagPrefix="uc1" TagName="Conversation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <uc1:Conversation runat="server" id="Conversation" />
</asp:Content>
