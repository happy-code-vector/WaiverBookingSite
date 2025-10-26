
<%@ Page Title="WaiverFile Event" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="PrintEvent.aspx.cs" Inherits="WaiverFile.site.admin.Page_PrintEvent" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 
<%@ register src="~/Controls/PrintEvent.ascx" tagprefix="uc1" tagname="PrintEvent" %> 
<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 
<uc1:PrintEvent runat ="server" id="PrintEvent1" /> 
</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
</asp:Content> 