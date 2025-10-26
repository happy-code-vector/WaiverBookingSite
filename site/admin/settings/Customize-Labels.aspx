
<%@ Page Title="Customize Labels" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="CustomizeLabels.aspx.cs" Inherits="WaiverFile.site.admin.settings.CustomizeLabels" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 
<%@ register src="~/Controls/ManageLabels.ascx" tagprefix="uc1" tagname="ManageLabels" %> 
<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 
<uc1:ManageLabels runat ="server" id="ManageLabels1" /> 
</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
</asp:Content> 