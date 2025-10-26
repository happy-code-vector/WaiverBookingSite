<%@ Page Title="WaiverFile Admin" Language="C#" MasterPageFile="~/MasterPages/AdminNoPadding.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="WaiverFile.site.admin._admin_default" %>

<%@ register src="~/Controls/SubscriptionAndUsageCheck.ascx" tagprefix="uc1" tagname="SubscriptionAndUsageCheck" %>
<%@ register src="~/Controls/SecuritySelect.ascx" tagprefix="uc1" tagname="SecuritySelect" %>
<%@ register src="~/Controls/DashboardV5.ascx" tagprefix="uc1" tagname="DashboardV5" %>
<%@ register src="~/Controls/DashboardV4Sidebar.ascx" tagprefix="uc1" tagname="DashboardV4Sidebar" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph1" runat="server">
 <uc1:dashboardv4sidebar runat="server" id="DashboardV4Sidebar" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph0" runat="server">
  
    <uc1:subscriptionandusagecheck runat="server" id="SubscriptionAndUsageCheck" />
    <uc1:SecuritySelect runat="server" id="SecuritySelect1" />
    <uc1:DashboardV5 runat="server" id="Dashboard1" />

</asp:Content>
