<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Public.Master" AutoEventWireup="true" CodeBehind="VerifyEmail.aspx.cs" Inherits="WaiverFile.site.VerifyEmail" %>

<%@ Register Src="~/Controls/VerifyWaiver.ascx" TagPrefix="uc1" TagName="VerifyWaiver" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
    <uc1:VerifyWaiver runat="server" id="VerifyWaiver" />
</asp:Content>
