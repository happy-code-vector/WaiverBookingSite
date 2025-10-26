<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminNoPadding.Master" AutoEventWireup="true" CodeBehind="Dashv3.aspx.cs" Inherits="WaiverFile.site.admin.Dashv3" %>
<%@ register src="~/Controls/SubscriptionAndUsageCheck.ascx" tagprefix="uc1" tagname="SubscriptionAndUsageCheck" %>
<%@ register src="~/Controls/DashboardV3.ascx" tagprefix="uc1" tagname="DashboardV3" %>
<%@ register src="~/Controls/DashboardV3Sidebar.ascx" tagprefix="uc1" tagname="DashboardV3Sidebar" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
     <uc1:dashboardv3sidebar runat="server" id="DashboardV3Sidebar" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

        <uc1:subscriptionandusagecheck runat="server" id="SubscriptionAndUsageCheck" />
    <uc1:dashboardv3 runat="server" id="DashboardV3" />

</asp:Content>
