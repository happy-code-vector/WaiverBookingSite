<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="ConfigurePayments.aspx.cs" Inherits="WaiverFile.site.admin.settings.ConfigurePayments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

    <asp:PlaceHolder runat="server" id="phErr"></asp:PlaceHolder>
    
  <asp:Panel runat="server" ID="pnlActiveAccount" CssClass="panel panel-success text-center" Style="padding: 30px;">
    <i class="fa fa-check-circle fa-4x text-success" aria-hidden="true"></i>
    <h3 class="mt-3">Your Payment Account is Active</h3>
    <p>You can now accept payments and manage your account securely.</p>
    <a href="#" id="btnStripeLogin" runat="server" class="btn btn-success btn-lg" target="_blank">
        <i class="fa fa-external-link"></i> Open Payment Portal
    </a>
</asp:Panel>

<asp:Panel runat="server" ID="pnlPending" CssClass="panel panel-warning text-center" Style="padding: 30px;">
    <i class="fa fa-clock-o fa-4x text-warning" aria-hidden="true"></i>
    <h3 class="mt-3">Your Payment Account is Pending</h3>
    <p>Your account information is still under review. Check this page for status updates.</p>
   
</asp:Panel>

<asp:Panel runat="server" ID="pnlOnboarding" CssClass="panel panel-default text-center payment-setup-panel" Style="padding: 30px;">
    <i class="fa fa-credit-card fa-4x text-primary" aria-hidden="true"></i>
    <h3 class="mt-3">Set Up Payment Processing</h3>
    <p>To start accepting payments, you’ll need to complete a quick and secure account setup.</p>
    <p>Once done, you’ll be able to manage payouts, track earnings, and update your banking info.</p>
    <a href="#" id="btnOnboarding" runat="server" class="btn btn-primary btn-lg">
        <i class="fa fa-play-circle"></i> Begin Setup
    </a>
</asp:Panel>



</asp:Content>
