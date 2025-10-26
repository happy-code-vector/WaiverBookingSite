
<%@ Page Title="Edit Waiver - Agreement Text" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EditWaiverAgreementText.aspx.cs" Inherits="WaiverFile.site.admin.settings.WaiverForms.EditWaiverAgreementText" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 
<%@ register src="~/Controls/SetWaiverText.ascx" tagprefix="uc1" tagname="SetWaiverText" %> 
<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 
<uc1:SetWaiverText runat ="server" id="SetWaiverText1" /> 
</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
</asp:Content> 