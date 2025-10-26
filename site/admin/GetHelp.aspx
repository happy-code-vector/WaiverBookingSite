<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="GetHelp.aspx.cs" Inherits="WaiverFile.site.admin.GetHelp" %>

<%@ Register Src="~/Controls/GetHelpForm.ascx" TagPrefix="uc1" TagName="GetHelpForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server"> <uc1:GetHelpForm runat="server" id="GetHelpForm" />
</asp:Content>
