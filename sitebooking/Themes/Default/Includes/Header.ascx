<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="WaiverFile.sitebooking.Themes.Default.Includes.Header" %>

<%@ Register Src="~/sitebooking/Controls/NavbarBooking.ascx" TagPrefix="uc1" TagName="NavbarBooking" %>

    <!-- Navigation bar (Page header) -->
    <header class="navbar navbar-expand-lg navbar-sticky z-fixed px-0" data-sticky-navbar='{"offset": 800}'>
      <div class="container flex-nowrap">

        <!-- Mobile offcanvas menu toggler (Hamburger) -->
        <button type="button" class="navbar-toggler me-4 me-lg-0" data-bs-toggle="offcanvas" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Navbar brand (Logo) -->
        <a class="navbar-brand py-1 py-md-2 py-xl-1" href="<%= WaiverSiteRef.BasePathRelativeBooking %>">
          <span class="d-none d-sm-flex flex-shrink-0 text-primary me-2">
              <asp:PlaceHolder runat="server" ID="phHeader"></asp:PlaceHolder>
          </span>
        </a>
       
        <!-- Main navigation that turns into offcanvas on screens < 992px wide (lg breakpoint) -->
    <uc1:NavbarBooking runat="server" id="NavbarBooking" />
             <asp:PlaceHolder runat="server" ID="ph0"></asp:PlaceHolder>
        <!-- Button group -->
        <div class="d-flex align-items-center">


      <% if (AuthenticatedCustomer != null) { %>
  <!-- Logged in: Show dropdown -->
  <div class="dropdown d-none d-md-inline-flex">
    <a class="btn btn-icon btn-lg fs-lg btn-outline-secondary border-0 rounded-circle dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
      <i class="ci-user"></i>
      <span class="visually-hidden">Account</span>
    </a>
    <ul class="dropdown-menu dropdown-menu-end">
        <li><a class="dropdown-item" href="<%= WaiverSiteRef.BasePathRelativeBooking %>/CustomerBookings.aspx">My Bookings</a></li>
      <li><a class="dropdown-item" href="<%= WaiverSiteRef.BasePathRelativeBooking %>/CustomerOrders.aspx">Payment History</a></li>
      
      <li><hr class="dropdown-divider"></li>
      <li><a class="dropdown-item text-danger" href="<%= WaiverSiteRef.BasePathRelativeBooking %>/CustomerLogout.aspx">Log Out</a></li>
    </ul>
  </div>

<% } else { %>
  <!-- Not logged in: Show login link -->
  <a class="btn btn-icon btn-lg fs-lg btn-outline-secondary border-0 rounded-circle d-none d-md-inline-flex" href="<%= WaiverSiteRef.BasePathRelativeBooking %>/CustomerLogin.aspx">
    <i class="ci-user"></i>
    <span class="visually-hidden">Log in</span>
  </a>
<% } %>

       
           <!-- Cart button -->
       <asp:LinkButton runat="server" ID="btnCartIcon" OnClick="btnCartIcon_Click" CssClass="btn btn-icon btn-lg fs-xl btn-outline-secondary position-relative border-0 rounded-circle animate-scale" data-bs-target="#shoppingCart" aria-controls="shoppingCart" aria-label="Shopping cart">
           <span class="position-absolute top-0 start-100 badge fs-xs text-bg-primary rounded-pill mt-1 ms-n4 z-2" style="--cz-badge-padding-y: .25em; --cz-badge-padding-x: .42em">
               <asp:Label runat="server" ID="lblCartItemCount">0</asp:Label>
           </span>
             <i class="ci-shopping-bag animate-target me-1"></i>

       </asp:LinkButton>
        </div>
      </div>
    </header>
