<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Splash.Master" AutoEventWireup="true" CodeBehind="EventCatSelect.aspx.cs" Inherits="WaiverFile.site.EventCatSelect" %>
<%@ register src="~/Controls/IPAAutoLogOut.ascx" tagprefix="uc1" tagname="IPAAutoLogOut" %> 
<%@ register src="~/Controls/EventCatSelect.ascx" tagprefix="uc1" tagname="EventCatSelect" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph0" runat="server">

    <uc1:IPAAutoLogOut runat ="server" id="IPAAutoLogOut1" /> 
<uc1:EventCatSelect runat ="server" id="EventCatSelect1" /> 

</asp:Content>
