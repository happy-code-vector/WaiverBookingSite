
<%@ Page Title="Receipt" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Receipt.aspx.cs" Inherits="WaiverFile.site.admin.settings.ReceiptPage1" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 
<%@ register src="/wp-content/Plugins/WPCommerce/Controls/Receipt.ascx" tagprefix="uc1" tagname="Receipt" %> 
<%@ Register Src="~/Controls/GTMPixel.ascx" TagPrefix="uc1" TagName="GTMPixel" %>
<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 
<uc1:Receipt runat ="server" id="Receipt1" TemplateValue="/wp-content/Templates/WPCommerce/Receipt/Receipt.xslt" /> 


    <uc1:GTMPixel runat="server" id="GTMPixel1" />

</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
</asp:Content> 