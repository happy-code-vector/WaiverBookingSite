<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminBlank.Master" AutoEventWireup="true" CodeBehind="SetupNew.aspx.cs" Inherits="WaiverFile.site.admin.SetupNew" %>
<%@ register src="~/Controls/SetupWizard.ascx" tagprefix="uc1" tagname="SetupWizard" %>
<%@ Register Src="~/Controls/GTMPixel.ascx" TagPrefix="uc1" TagName="GTMPixel" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
    <uc1:SetupWizard runat ="server" id="SetupWizard1" /> 
    <uc1:GTMPixel runat="server" ID="GTMPixel" />
    <asp:PlaceHolder runat="server" id="phConversionTrackingScripts"></asp:PlaceHolder>

</asp:Content>
