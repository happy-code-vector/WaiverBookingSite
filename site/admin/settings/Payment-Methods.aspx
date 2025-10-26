
<%@ Page Title="Payment Methods" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="PaymentMethods.aspx.cs" Inherits="WaiverFile.site.admin.settings.PaymentMethods" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 
<%@ register src="/wp-content/Plugins/WPCommerce/Controls/PaymentModules/ListMyCCProfiles.ascx" tagprefix="uc1" tagname="ListMyCCProfiles" %> 
<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 
<uc1:ListMyCCProfiles runat ="server" id="ListMyCCProfiles1" TemplateValue="/wp-content/Templates/WPCommerce/ListMyCCProfiles/Default List CC Profiles.xsl" /> 
<p>&nbsp;</p>
<p><a href="<%=_addCCHref %>" class="btn btn-primary">Add a Credit Card</a></p>
</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
</asp:Content> 