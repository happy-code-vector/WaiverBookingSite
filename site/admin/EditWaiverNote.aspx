<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EditWaiverNote.aspx.cs" Inherits="WaiverFile.site.admin.EditWaiverNote" %>

<%@ Register Src="~/Controls/FormWaiverNote.ascx" TagPrefix="uc1" TagName="FormWaiverNote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <uc1:FormWaiverNote runat="server" id="FormWaiverNote" />
</asp:Content>
