<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="ViewWaiverOriginal.aspx.cs" Inherits="WaiverFile.site.admin.ViewWaiverOriginal" %>
<%@ register src="~/Controls/ViewWaiver.ascx" tagprefix="uc1" tagname="ViewWaiver" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <uc1:ViewWaiver runat ="server" id="ViewWaiver1" LoadOriginalVersion="true" /> 
</asp:Content>
