<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="ZapierSetup.aspx.cs" Inherits="WaiverFile.site.admin.settings.ZapierSetup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="module" src="https://cdn.zapier.com/packages/partner-sdk/v0/zapier-elements/zapier-elements.esm.js"></script>
<link rel="stylesheet" href="https://cdn.zapier.com/packages/partner-sdk/v0/zapier-elements/zapier-elements.css"/>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

    <zapier-full-experience
  client-id="L3Py9yMnaM3bEC0smb3Qm5Ls32lRiUBws8BcmOS9"
  theme="light"
  app-search-bar-display="show"
  app-limit="10"
  app-exclusions=""
  app-categories=""
></zapier-full-experience>

</asp:Content>
