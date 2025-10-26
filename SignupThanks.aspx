<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SignupWide.Master" AutoEventWireup="true" CodeBehind="SignupThanks.aspx.cs" Inherits="WaiverFile.SignupThanks" %>

<%@ Register Src="/Controls/EasySignupWelcome.ascx" TagPrefix="uc1" TagName="EasySignupWelcome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentFullWidth" runat="server">
    <uc1:easysignupwelcome runat="server" id="EasySignupWelcome" />
</asp:Content>
