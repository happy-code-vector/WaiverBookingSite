<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Edit-Waiver-Labels.aspx.cs" Inherits="WaiverFile.site.admin.settings.Waiver_Forms.Edit_Waiver_Labels" %>

<%@ Register Src="~/Controls/ManageLabelsForForm.ascx" TagPrefix="uc1" TagName="ManageLabelsForForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <uc1:ManageLabelsForForm runat="server" id="ManageLabelsForForm" />
</asp:Content>
