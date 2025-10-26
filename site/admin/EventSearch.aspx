<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EventSearch.aspx.cs" Inherits="WaiverFile.site.admin.EventSearch" %>
<%@ register src="~/Controls/EventSearchForm.ascx" tagprefix="uc1" tagname="EventSearchForm" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    
     <uc1:EventSearchForm runat ="server" id="EventSearchForm1" /> 
</asp:Content>
