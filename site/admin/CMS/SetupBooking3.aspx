<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="SetupBooking3.aspx.cs" Inherits="WaiverFile.site.admin.CMS.SetupBooking3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

    <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>
    <asp:Panel runat="server" id="pnlMain">

        <h3>Next Steps to Complete Your Setup</h3>
        <p>We’ve completed the initial setup of your account. Follow the steps below to finish getting everything ready.</p>
        <hr />
        
        <asp:PlaceHolder runat="server" id="phItems"></asp:PlaceHolder>

    </asp:Panel>
</asp:Content>
