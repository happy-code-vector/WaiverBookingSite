
<%@ Page Title="Choose a Waiver" Language="C#" MasterPageFile="~/MasterPages/PublicNoFooterLogo.Master" AutoEventWireup="true" CodeBehind="ChooseWaiver.aspx.cs" Inherits="WaiverFile.site.PageChooseWaiver" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 
<%@ register src="~/Controls/ChooseWaiver.ascx" tagprefix="uc1" tagname="ChooseWaiver" %> 

<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
<uc1:ChooseWaiver runat ="server" id="ChooseWaiver1" /> 
</asp:Content> 