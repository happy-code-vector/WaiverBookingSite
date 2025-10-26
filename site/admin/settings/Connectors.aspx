<%@ Page Title="Integrations" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Connectors.aspx.cs" Inherits="WaiverFile.site.admin.settings.ConnectorsPage" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 
<%@ register src="~/Connectors/Controls/ListWFConnectors.ascx" tagprefix="uc1" tagname="ListWFConnectors" %> 
<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 
<uc1:ListWFConnectors runat ="server" id="ListWFConnectors1" /> 
</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
</asp:Content> 