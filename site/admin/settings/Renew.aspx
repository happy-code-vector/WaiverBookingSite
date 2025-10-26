<%@ Page Title="Renew" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Renew.aspx.cs" Inherits="WaiverFile.site.admin.settings.Renew" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 
<%@ register src="~/Controls/RenewChangePlan4.ascx" tagprefix="uc1" tagname="RenewChangePlan4" %> 
<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 
<uc1:RenewChangePlan4 runat ="server" id="RenewChangePlan21" ThankYouPage="Receipt.aspx"  /> 
</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
</asp:Content> 