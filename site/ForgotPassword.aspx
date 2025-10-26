<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Public.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="WaiverFile.site.ForgotPassword" %>


<%@ Register Src="~/Controls/ForgotPasswordWF.ascx" TagPrefix="uc1" TagName="ForgotPasswordWF" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
    <uc1:forgotpasswordwf runat="server" id="ForgotPasswordWF" />

</asp:Content>
