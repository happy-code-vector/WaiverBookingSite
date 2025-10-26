<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Change-Email.aspx.cs" Inherits="WaiverFile.site.admin.settings.Change_Email" %>

<%@ Register Src="/wp-content/Controls/Security/ChangeEmail.ascx" TagPrefix="uc1" TagName="ChangeEmail" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <uc1:ChangeEmail runat="server"></uc1:ChangeEmail>
</asp:Content>
