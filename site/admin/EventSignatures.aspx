
<%@ Page Title="Event Signatures" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EventSignatures.aspx.cs" Inherits="WaiverFile.site.admin.EventSignatures" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 
<%@ register src="~/Controls/ListWaivers.ascx" tagprefix="uc1" tagname="ListWaivers" %> 

<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 
<uc1:ListWaivers runat ="server" id="ListWaivers1" /> 
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
</asp:Content> 