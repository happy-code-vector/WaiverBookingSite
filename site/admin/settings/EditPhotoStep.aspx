<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EditPhotoStep.aspx.cs" Inherits="WaiverFile.site.admin.settings.EditPhotoStep" %>

<%@ Register Src="~/Controls/FormPhotoStep.ascx" TagPrefix="uc1" TagName="FormPhotoStep" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <uc1:FormPhotoStep runat="server" id="FormPhotoStep" />
</asp:Content>
