
<%@ Page Title="default" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="WaiverFile.site.admin.UpdateInfo._defaultUpdateInfo" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 
<%@ register src="~/Controls/ListMyWaiverFileSites.ascx" tagprefix="uc1" tagname="ListMyWaiverFileSites" %> 
<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 
<h1>Payment Processor Change</h1>
<p>Due to a change in our payment processor, we need to ask you to re-enter your payment information. This is a one-time change so you won't have to enter your info again until your payment method expires or if you want to change something. We're sorry for the inconvenience. Please feel free to <a href="http://www.waiverfile.com/Contact.aspx">contact us</a> with any questions you may have.&nbsp;</p>
<uc1:ListMyWaiverFileSites runat ="server" id="ListMyWaiverFileSites1" /> 
</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
</asp:Content> 