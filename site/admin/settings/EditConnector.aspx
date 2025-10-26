
<%@ Page Title="Edit Connector" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EditConnector.aspx.cs" Inherits="WaiverFile.site.admin.settings.EditConnector" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 

<%@ register src="~/Connectors/Controls/EditWFConnectorLoader.ascx" tagprefix="uc1" tagname="EditWFConnectorLoader" %> 
<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 
<div class="pull-right"><a href="Connectors.aspx" class="btn btn-default"><em class="fa fa-arrow-left"></em> Back to Connectors</a></div>

<uc1:EditWFConnectorLoader runat ="server" id="EditWFConnectorLoader1" /> 
</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
</asp:Content> 