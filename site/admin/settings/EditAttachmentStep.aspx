<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EditAttachmentStep.aspx.cs" Inherits="WaiverFile.site.admin.settings.EditAttachmentStep" %>

<%@ Register Src="~/Controls/FormAttachmentStep.ascx" TagPrefix="uc1" TagName="FormAttachmentStep" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <uc1:FormAttachmentStep runat="server" ID="FormAttachmentStep1"></uc1:FormAttachmentStep>
</asp:Content>
