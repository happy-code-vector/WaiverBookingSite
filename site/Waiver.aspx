
<%@ Page Title="WaiverFile | Online Waiver Form Entry" Language="C#" MasterPageFile="~/MasterPages/PublicNoFooterLogo.Master"  AutoEventWireup="true" CodeBehind="Waiver.aspx.cs" Inherits="WaiverFile.site.WaiverPage" %> 
<%@ MasterType 
    virtualpath="~/MasterPages/PublicNoFooterLogo.Master" 
%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
    <% Master.AcceptsPrePopulateParams = true;
    %>
</asp:Content> 
<%@ register src="~/Controls/WaiverFormEntry2.ascx" tagprefix="uc1" tagname="WaiverFormEntry" %> 

<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
<uc1:WaiverFormEntry runat="server" id="WaiverFormEntry1" /> 
</asp:Content> 