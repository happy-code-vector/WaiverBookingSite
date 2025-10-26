
<%@ Page Title="Thank You" Language="C#" MasterPageFile="~/MasterPages/Splash.Master" AutoEventWireup="true" CodeBehind="ThankYou.aspx.cs" Inherits="WaiverFile.site.Page_ThankYou" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 
<%@ register src="~/Controls/ThankYou.ascx" tagprefix="uc1" tagname="ThankYou" %>
<%@ Register Src="~/Controls/ThankYouDisplayWaiver.ascx" TagPrefix="uc1" TagName="ThankYouDisplayWaiver" %>

<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 
<uc1:ThankYou runat ="server" id="ThankYou1" /> 
</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
    <uc1:ThankYouDisplayWaiver runat="server" id="ThankYouDisplayWaiver" />
</asp:Content> 