
<%@ Page Title="Events" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="WaiverFile.site.admin.PageEvents" %> 

<%@ register src="~/Controls/ListWaiverEvents.ascx" tagprefix="uc1" tagname="ListWaiverEvents" %> 


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 
<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 
<uc1:ListWaiverEvents runat ="server" id="ListWaiverEvents1" /> 

</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
</asp:Content> 