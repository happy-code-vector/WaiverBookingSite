
<%@ Page Title="View Waiver" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="ViewWaiver.aspx.cs" Inherits="WaiverFile.site.admin.Page_ViewWaiver" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 
<%@ register src="~/Controls/ViewWaiver.ascx" tagprefix="uc1" tagname="ViewWaiver" %>
<%@ Register Src="~/Connectors/Controls/BarcodeCheckInStatus.ascx" TagPrefix="uc1" TagName="BarcodeCheckInStatus" %>


<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server">
    <uc1:BarcodeCheckInStatus runat="server" id="BarcodeCheckInStatus" />
<uc1:ViewWaiver runat ="server" id="ViewWaiver1" /> 
<p>&nbsp;</p>
<p>&nbsp;</p>
<p></p>
</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
</asp:Content> 