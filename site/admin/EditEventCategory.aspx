<%@ Page Title="Event Category" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EditEventCategory.aspx.cs" Inherits="WaiverFile.site.admin.EditEventCategory" %>

<%@ register src="~/Controls/FormWaiverEventCategory.ascx" tagprefix="uc1" tagname="FormWaiverEventCategory" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <uc1:FormWaiverEventCategory runat ="server" id="FormWaiverEventCategory1" /> 
</asp:Content>
