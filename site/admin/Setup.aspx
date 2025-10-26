<%@ Page Title="Setup" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Setup.aspx.cs" Inherits="WaiverFile.site.admin.Setup" %> 
<%@ register src="~/Controls/FormWaiverFormV2.ascx" tagprefix="uc1" tagname="FormWaiverFormV2" %> 
<%@ register src="~/Controls/SetupWizard.ascx" tagprefix="uc1" tagname="SetupWizard" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 

<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 
<uc1:FormWaiverFormV2 runat ="server" id="FormWaiverFormV2" /> 
</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
</asp:Content> 



