<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/BookingStandardPage.Master" AutoEventWireup="true" CodeBehind="ThankYou.aspx.cs" Inherits="WaiverFile.sitebooking.ThankYou" %>

<%@ register src="~/Controls/ThankYou.ascx" tagprefix="uc1" tagname="ThankYou" %>
<%@ Register Src="~/Controls/ThankYouDisplayWaiver.ascx" TagPrefix="uc1" TagName="ThankYouDisplayWaiver" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ThankYou runat ="server" id="ThankYou1" /> 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <uc1:ThankYouDisplayWaiver runat="server" id="ThankYouDisplayWaiver" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
