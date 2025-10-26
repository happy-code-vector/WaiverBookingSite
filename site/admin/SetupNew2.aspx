<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="SetupNew2.aspx.cs" Inherits="WaiverFile.site.admin.SetupNew2" %>
<%@ register src="~/Controls/SetupWizard.ascx" tagprefix="uc1" tagname="SetupWizard" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
     <uc1:SetupWizard runat ="server" id="SetupWizard1" OmitContainer="true" /> 


</asp:Content>
