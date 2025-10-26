<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="PhotoSettings.aspx.cs" Inherits="WaiverFile.site.admin.settings.PhotoSettings" %>

<%@ Register Src="~/Controls/ManagePhotoSteps.ascx" TagPrefix="uc1" TagName="ManagePhotoSteps" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <uc1:ManagePhotoSteps runat="server" ID="ManagePhotoSteps" />
</asp:Content>
