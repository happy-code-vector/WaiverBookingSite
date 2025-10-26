<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EditWaiver.aspx.cs" Inherits="WaiverFile.site.admin.EditWaiver" %>
<%@ register src="~/Controls/EditWaiverValues.ascx" tagprefix="uc1" tagname="EditWaiverValues" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

    <uc1:EditWaiverValues runat ="server" id="EditWaiverValues1" /> 

</asp:Content>
