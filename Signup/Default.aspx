<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SignupNarrow.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WaiverFile.Signup.Default" %>

<%@ Register Src="~/Controls/EasySignupV3.ascx" TagPrefix="uc1" TagName="EasySignupV3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <uc1:EasySignupV3 runat="server" id="EasySignupV31" />
</asp:Content>
