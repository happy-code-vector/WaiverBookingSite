
<%@ Page Title="Edit Waiver - Form Fields" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EditWaiverFormFields.aspx.cs" Inherits="WaiverFile.site.admin.settings.WaiverForms.EditWaiverFormFields" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 
<%@ register src="~/Controls/FormDesigner.ascx" tagprefix="uc1" tagname="FormDesigner" %> 
<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 
<uc1:FormDesigner runat ="server" id="FormDesigner1" /> 
</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
</asp:Content> 