
<%@ Page Title="View Event" Language="C#" MasterPageFile="~/MasterPages/Public.Master" AutoEventWireup="true" CodeBehind="ViewEvent.aspx.cs" Inherits="WaiverFile.site.Manager.ViewEvent" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 
<%@ register src="~/Controls/EventManagerViewV2.ascx" tagprefix="uc1" tagname="EventManagerView" %> 

<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
<uc1:EventManagerView runat ="server" id="EventManagerView1" /> 
</asp:Content> 