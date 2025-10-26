<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="WaiverNoteHistory.aspx.cs" Inherits="WaiverFile.site.admin.WaiverNoteHistory" %>

<%@ Register Src="~/Controls/ListWaiverNoteHistory.ascx" TagPrefix="uc1" TagName="ListWaiverNoteHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <uc1:ListWaiverNoteHistory runat="server" id="ListWaiverNoteHistory" />
</asp:Content>
