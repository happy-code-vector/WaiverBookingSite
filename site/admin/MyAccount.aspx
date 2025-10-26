<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="MyAccount.aspx.cs" Inherits="WaiverFile.site.admin.MyAccount" %>
<%@ Register Src="~/Controls/AccountDetails.ascx" TagPrefix="uc1" TagName="AccountDetails" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

    <h3>My Account</h3>


    <uc1:AccountDetails runat="server" id="AccountDetails" />
       

       

</asp:Content>
