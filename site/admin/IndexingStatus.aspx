<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="IndexingStatus.aspx.cs" Inherits="WaiverFile.site.admin.IndexingStatus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <h3>Search Indexing Status</h3>
    <p>After changing search settings, the system may need to rebuild the search indexes for finding waivers. While processing, search results may be incomplete. </p>
    <asp:PlaceHolder ID="phMain" runat="server"></asp:PlaceHolder>
    <p><a href="IndexingStatus.aspx" class="btn btn-default"><i class="fa fa-refresh"></i> Refresh</a></p>
</asp:Content>
