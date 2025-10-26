
<%@ Page Title="Waiver Event" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EditWaiverEvent.aspx.cs" Inherits="WaiverFile.site.admin.EditWaiverEvent" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 
<%@ register src="~/Controls/FormWaiverEvent.ascx" tagprefix="uc1" tagname="FormWaiverEvent" %> 
<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 
<uc1:FormWaiverEvent runat ="server" id="FormWaiverEvent1" /> 
</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
</asp:Content> 