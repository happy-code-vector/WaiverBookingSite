<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="BarcodeReport.aspx.cs" Inherits="WaiverFile.site.admin.BarcodeReport" %>
<%@ register src="~/Connectors/Controls/BarcodeCheckInReport.ascx" tagprefix="uc1" tagname="BarcodeCheckInReport" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <uc1:BarcodeCheckInReport ID="BarcodeCheckInReport1" runat="server"></uc1:BarcodeCheckInReport>
</asp:Content>
