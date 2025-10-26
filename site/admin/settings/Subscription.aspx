
<%@ Page Title="Subscription" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Subscription.aspx.cs" Inherits="WaiverFile.site.admin.settings.Subscription" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 

<%@ register src="~/Controls/ListMyWaiverFileSitesv2.ascx" tagprefix="uc1" tagname="ListMyWaiverFileSites" %> 

<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 

<h1>Manage Your Subscription</h1>
<p>Below are the details of your subscription. <a href="Payment-History.aspx">View your payment history</a></p>
<p></p>

<uc1:ListMyWaiverFileSites runat="server" id="ListMyWaiverFileSites" TemplateValue="/wp-content/Plugins/WaiverFile/Docs/ListMyWaiverFileSitesv2.xslt" />


<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
</asp:Content> 