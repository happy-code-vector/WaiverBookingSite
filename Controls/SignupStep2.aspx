<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/PublicOnePager.Master" AutoEventWireup="true" CodeBehind="SignupStep2.aspx.cs" Inherits="WaiverFile.Controls.SignupStep2" %>
<%@ register src="~/Controls/EasySignupV3Step2.ascx" tagprefix="uc1" tagname="EasySignupV3Step2" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph0" runat="server">
    <uc1:EasySignupV3Step2 runat="server" ID="Signup1" ></uc1:EasySignupV3Step2>
</asp:Content>
<asp:Content ContentPlaceHolderID="phFooter" runat="server"></asp:Content>
