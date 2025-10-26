
<%@ Page Title="Waiver Forms" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="WaiverForms.aspx.cs" Inherits="WaiverFile.site.admin.settings.WaiverFormsPage" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 
<%@ register src="~/Controls/ListWaiverForms2.ascx" tagprefix="uc1" tagname="ListWaiverForms2" %> 
<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 
<uc1:ListWaiverForms2 runat ="server" id="ListWaiverForms21" /> 
<p>&nbsp;</p>
<p>
<a href="../../" class="btn btn-primary"><em class="fa fa-file-text"></em> Signature Area</a>
<a href="../GenerateQR.aspx" class="btn btn-primary"><em class="fa fa-qrcode"></em> QR Code</a>
</p>
</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
</asp:Content> 