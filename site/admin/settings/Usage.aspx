
<%@ Page Title="Usage" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Usage.aspx.cs" Inherits="WaiverFile.site.admin.settings.Page_Usage" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 
<%@ register src="~/Controls/ViewWaiverSiteHistoricUsage.ascx" tagprefix="uc1" tagname="ViewWaiverSiteHistoricUsage" %> 
<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 
<uc1:ViewWaiverSiteHistoricUsage runat ="server" id="ViewWaiverSiteHistoricUsage1" /> 
</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
</asp:Content> 