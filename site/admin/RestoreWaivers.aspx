<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="RestoreWaivers.aspx.cs" Inherits="WaiverFile.site.admin.RestoreWaivers" %>

<%@ Register Src="~/Controls/ListWaiversDeleted.ascx" TagPrefix="uc1" TagName="ListWaiversDeleted" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
   
    <uc1:ListWaiversDeleted runat="server" id="ListWaiversDeleted" />

</asp:Content>
