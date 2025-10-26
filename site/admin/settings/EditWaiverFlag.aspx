<%@ Page Title="Waiver Flag" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EditWaiverFlag.aspx.cs" Inherits="WaiverFile.site.admin.settings.EditWaiverFlag" %>

<%@ Register Src="~/Controls/FormWaiverFlag.ascx" TagPrefix="uc1" TagName="FormWaiverFlag" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <uc1:FormWaiverFlag runat="server" ID="FormWaiverFlag" />
</asp:Content>
