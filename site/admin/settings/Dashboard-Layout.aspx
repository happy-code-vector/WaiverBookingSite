
<%@ Page Title="Dashboard Layout" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="DashboardLayout.aspx.cs" Inherits="WaiverFile.site.admin.settings.DashboardLayout" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 
<%@ register src="~/Controls/FormDashboardLayoutV3.ascx" tagprefix="uc1" tagname="FormDashboardLayoutV3" %> 
<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 
<uc1:FormDashboardLayoutV3 runat ="server" id="FormDashboardLayoutV31" /> 
</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
</asp:Content> 