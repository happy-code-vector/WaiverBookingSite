<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EventParticipants.aspx.cs" Inherits="WaiverFile.site.admin.EventParticipants" %>

<%@ Register Src="~/Controls/ListParticipants.ascx" TagPrefix="uc1" TagName="ListParticipants" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <uc1:ListParticipants runat="server" id="ListParticipants" />
</asp:Content>
