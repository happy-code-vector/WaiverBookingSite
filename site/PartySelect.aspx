
<%@ Page Title="Select Your Event" Language="C#" MasterPageFile="~/MasterPages/Public.Master" AutoEventWireup="true" CodeBehind="PartySelect.aspx.cs" Inherits="WaiverFile.site.PartySelect" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 
<%@ register src="~/Controls/IPAAutoLogOut.ascx" tagprefix="uc1" tagname="IPAAutoLogOut" %> 
<%@ register src="~/Controls/EventSelect.ascx" tagprefix="uc1" tagname="EventSelect" %> 

<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
<uc1:IPAAutoLogOut runat ="server" id="IPAAutoLogOut1" /> 
<uc1:EventSelect runat ="server" id="EventSelect1" /> 
</asp:Content> 