
<%@ Page Title="Event Manager" Language="C#" MasterPageFile="~/MasterPages/Public.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WaiverFile.site.Manager.Default" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 
<%@ register src="~/Controls/EventManagerList.ascx" tagprefix="uc1" tagname="EventManagerList" %> 

<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
<uc1:EventManagerList runat ="server" id="EventManagerList1" /> 
</asp:Content> 