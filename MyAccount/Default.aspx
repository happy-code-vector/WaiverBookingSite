<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyAccountArea.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WaiverFile.MyAccount.Default" %>

<%@ Register Src="/Controls/ListMyWaiverFileSites.ascx" TagPrefix="uc1" TagName="ListMyWaiverFileSites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
    <h1>My Account</h1>
    <uc1:listmywaiverfilesites runat="server" id="ListMyWaiverFileSites" TemplateValue="/wp-content/Templates/List Waiver Sites.xslt"/>

</asp:Content>
