<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="BarcodeSearch.aspx.cs" Inherits="WaiverFile.site.admin.BarcodeSearch" %>
<%@ register src="~/Connectors/Controls/BarcodeCheckInSearch.ascx" tagprefix="uc1" tagname="BarcodeCheckInSearch" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
        <uc1:BarcodeCheckInSearch runat ="server" id="BarcodeCheckInSearch1" />
</asp:Content>



