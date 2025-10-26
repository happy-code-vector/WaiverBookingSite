<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="AttachmentSettings.aspx.cs" Inherits="WaiverFile.site.admin.settings.AttachmentSettings" %>
<%@ Register Src="~/Controls/ManageAttachmentSteps.ascx" TagPrefix="uc1" TagName="ManageAttachmentSteps" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <uc1:ManageAttachmentSteps runat="server" ID="ManageAttachmentSteps1"></uc1:ManageAttachmentSteps>
</asp:Content>
