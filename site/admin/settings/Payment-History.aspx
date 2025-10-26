
<%@ Page Title="Payment History" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="PaymentHistory.aspx.cs" Inherits="WaiverFile.site.admin.settings.PaymentHistory" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 
<%@ register src="~/Controls/ListOrdersForCurrentSite.ascx" tagprefix="uc1" tagname="ListOrdersForCurrentSite" %> 
<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 
<h1>Payment History</h1>
<uc1:ListOrdersForCurrentSite runat ="server" id="ListOrdersForCurrentSite1" /> 
</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
</asp:Content> 