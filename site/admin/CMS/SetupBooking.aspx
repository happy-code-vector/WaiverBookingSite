<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="SetupBooking.aspx.cs" Inherits="WaiverFile.site.admin.CMS.SetupBooking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

    <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>
    <asp:Panel runat="server" ID="pnlAlreadyStarted" Visible="false">
        <h3>Booking Features Activated</h3>
        <p>Your online booking features have been turned on. Use the new navigation items on the left to customize your store and start accepting online bookings! </p>
    </asp:Panel>

    <asp:Panel runat="server" ID="pnlMain">
    <div class="container-fluid">
  <div class="row">
    <div class="col-lg-10 col-lg-offset-1">

      <h3 class="page-header text-center"><i class="fa fa-calendar-check-o"></i> Upgrade to Online Booking</h3>

      <div class="panel panel-primary">
        <div class="panel-heading">
          <h3 class="panel-title"><i class="fa fa-shopping-cart"></i> Add an Online Store to Your Waiver Account</h3>
        </div>
        <div class="panel-body">
          <p>You can now expand your waiver account with powerful online booking. Set up a complete website or connect to your existing one — and start taking reservations with ease.</p>

          
          <ul class="fa-ul">
            <li><i class="fa fa-li fa-globe"></i> Built-in website or connect your own</li>
            <li><i class="fa fa-li fa-ticket"></i> Sell <strong>Sell activities</strong> online</li>
            <li><i class="fa fa-li fa-calendar"></i> Set <strong>seasons, schedules, and ticket limits</strong></li>
            <li><i class="fa fa-li fa-users"></i> Define <strong>pricing levels</strong> for adults, children, etc</li>
            <li><i class="fa fa-li fa-credit-card"></i> Collect payments easily — <strong>no monthly fees</strong></li>
            <li><i class="fa fa-li fa-percent"></i> Only a simple <strong>booking fee</strong> per order, shown clearly to your customers</li>
          </ul>

          <hr>

          <div class="text-center">
              <asp:LinkButton runat="server" ID="btnEnableBooking" CssClass="btn btn-primary btn-lg" OnClick="btnEnableBooking_Click">
                  <i class="fa fa-toggle-on"></i> Turn On Online Booking
              </asp:LinkButton>
              <asp:Label runat="server" ID="lblAdmin" CssClass="text-danger" Visible ="false" Text="You must be an administrator to configure online booking. Please ask an administrator or owner of your account to get started." />
            <p class="help-block">You can try it out — no risk, no charges. You’ll configure payments as part of setup.</p>
          </div>

        </div>
      </div>

    </div>
  </div>
</div>

<style>
 

  .fa-ul {
    margin-top: 10px;
  }

  .btn-lg {
    padding: 14px 28px;
    font-size: 18px;
  }
</style>



        </asp:Panel>

</asp:Content>
