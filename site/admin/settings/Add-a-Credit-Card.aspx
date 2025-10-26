
<%@ Page Title="Add a Credit Card" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="AddaCreditCard.aspx.cs" Inherits="WaiverFile.site.admin.settings.AddaCreditCard" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 

<%@ register src="/wp-content/Plugins/WPCommerce/Controls/PaymentModules/AddCCProfile.ascx" tagprefix="uc1" tagname="AddCCProfile" %> 
<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 
<h1>Add a New Credit Card</h1>
<uc1:AddCCProfile runat ="server" id="AddCCProfile1" /> 
</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
</asp:Content> 