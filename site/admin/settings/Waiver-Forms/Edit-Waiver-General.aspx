
<%@ Page Title="Edit Waiver - General" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EditWaiverGeneral.aspx.cs" Inherits="WaiverFile.site.admin.settings.WaiverForms.EditWaiverGeneral" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 
<%@ register src="~/Controls/FormWaiverFormGeneral.ascx" tagprefix="uc1" tagname="FormWaiverFormGeneral" %> 
<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 
<uc1:FormWaiverFormGeneral runat ="server" id="FormWaiverFormGeneral1" /> 
</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
</asp:Content> 