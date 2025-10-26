<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="DownloadArchive.aspx.cs" Inherits="WaiverFile.site.admin.DownloadArchivePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:PlaceHolder ID="phHead" runat="server"></asp:PlaceHolder>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <asp:PlaceHolder id="phMain" runat="server"></asp:PlaceHolder>

    <asp:Panel runat="server" ID="pnlMain">

        <h1>Archive Download</h1>
        <p>Your downloadload will begin in a few seconds. If it does not, <a href="#" runat="server" id="aMain">Click here</a> to begin the download.</p>

    </asp:Panel>
</asp:Content>
