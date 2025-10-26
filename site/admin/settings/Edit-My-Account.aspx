
<%@ Page Title="Edit My Account" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EditMyAccount.aspx.cs" Inherits="WaiverFile.site.admin.settings.EditMyAccount" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 

<%@ Register Src="~/Controls/EditAccount.ascx" TagPrefix="uc1" TagName="EditAccount" %>

<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 
 <uc1:EditAccount runat="server" id="EditAccount" />
</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
</asp:Content> 