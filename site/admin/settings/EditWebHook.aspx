<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EditWebHook.aspx.cs" Inherits="WaiverFile.site.admin.settings.EditWebHook" %>


<%@ Register Src="~/Controls/FormWebHook.ascx" TagPrefix="uc1" TagName="FormWebHook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <uc1:FormWebHook runat="server" />
</asp:Content>
