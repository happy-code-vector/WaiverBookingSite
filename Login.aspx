<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SignupWide.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WaiverFile.Login" %>

<%@ Register Src="/Controls/LoginFormWFV2.ascx" TagPrefix="uc1" TagName="LoginFormWFV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentFullWidth" runat="server">
    <uc1:loginformwfv2 runat="server" id="LoginFormWFV2" RedirectUrl="/MyAccount" ForgotPasswordUrl="/ForgotPassword.aspx" />
</asp:Content>
