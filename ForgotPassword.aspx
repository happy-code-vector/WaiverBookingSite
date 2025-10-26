<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SignupNarrow.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="WaiverFile.ForgotPassword" %>
<%@ Register Src="/Controls/Core/ForgotPassword.ascx" TagPrefix="uc1" TagName="ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <uc1:ForgotPassword runat="server"></uc1:ForgotPassword>
</asp:Content>
