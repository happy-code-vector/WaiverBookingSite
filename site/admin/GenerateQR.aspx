
<%@ Page Title="Generate QR Codes" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="GenerateQR.aspx.cs" Inherits="WaiverFile.site.admin.Page_GenerateQR" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 
<%@ register src="~/Controls/GenerateQRDialog.ascx" tagprefix="uc1" tagname="GenerateQRDialog" %> 
<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 
<uc1:GenerateQRDialog runat ="server" id="GenerateQRDialog1" /> 
</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
</asp:Content> 