<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EventCategories.aspx.cs" Inherits="WaiverFile.site.admin.EventCategories" %>

<%@ register src="~/Controls/ListWaiverEventCategories.ascx" tagprefix="uc1" tagname="ListWaiverEventCategories" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <uc1:ListWaiverEventCategories runat ="server" id="ListWaiverEventCategories1" /> 
</asp:Content>
