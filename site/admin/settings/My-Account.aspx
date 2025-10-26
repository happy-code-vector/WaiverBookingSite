
<%@ Page Title="My Account" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="MyAccount.aspx.cs" Inherits="WaiverFile.site.admin.settings.MyAccount" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 
<%@ Register Src="~/Controls/AccountDetails.ascx" TagPrefix="uc1" TagName="AccountDetails" %>
<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 
  <uc1:AccountDetails runat="server" id="AccountDetails" />
</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
</asp:Content> 