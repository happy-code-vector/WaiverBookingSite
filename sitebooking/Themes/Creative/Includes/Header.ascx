<%@ Control Language="C#" AutoEventWireup="true"  Inherits="WaiverFile.Core.Booking.WFSubControl" %>
<%@ Import Namespace="Waypoint.Core" %>
<%@ Import Namespace="WaiverFile.Core.Booking" %>
<%@ Import Namespace="WaiverFile.Core" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<%@ Register Src="~/sitebooking/Controls/NavbarBooking.ascx" TagPrefix="uc1" TagName="NavbarBooking" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        ((WPPageLite)Page).EnsureManagedConnection("WaiverFileDB");
        SqlConnection conn = (SqlConnection)((WPPageLite)Page).ManagedConnections["WaiverFileDB"];

        WFImage img = WFImage.GetWFImage(conn, WaiverSiteRef.ID, "PUBLIC_HEADER");
        if (img != null)
        {
            phHeader.Controls.Add(new LiteralControl(string.Format("<img src=\"{1}\" alt=\"{0} Logo\"/>", WaiverSiteRef.Name, img.GetImageUrlDirectToSource())));
        }
        else
        {
            phHeader.Controls.Add(new LiteralControl(WaiverSiteRef.Name));
        }

        BookingCart cart = BookingCart.GetCart(Page, WaiverSiteRef);
        if (cart != null && cart.ItemsCombined != null)
        {
            int num = 0;
            foreach (var curr in cart.ItemsCombined)
            {
                if (curr.ItemType != BookingUtils.ItemTypeEnum.Tax && 
                    curr.ItemType != BookingUtils.ItemTypeEnum.Fee && 
                    curr.ItemType != BookingUtils.ItemTypeEnum.Shipping && 
                    curr.ItemType != BookingUtils.ItemTypeEnum.Handling && 
                    curr.ItemType != BookingUtils.ItemTypeEnum.Shipping_and_Handling)
                {
                    num += curr.Quantity;
                }
            }
            lblCartItemCount.Text = num.ToString();
        }
    }
    
    protected void btnCartIcon_Click(object sender, EventArgs e)
    {
        Response.Redirect(WaiverSiteRef.BasePathRelativeBooking + "/ViewCart.aspx");
    }
</script>


    <!-- Navigation bar (Page header) - Starts transparent -->
    <header class="navbar navbar-expand-lg navbar-transparent z-fixed px-0" id="mainNavbar"  data-sticky-navbar='{"offset": 800}'>
      <div class="container flex-nowrap">

        <!-- Mobile offcanvas menu toggler (Hamburger) -->
        <button type="button" class="navbar-toggler me-4 me-lg-0" data-bs-toggle="offcanvas" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Navbar brand (Logo) -->
        <a class="navbar-brand py-1 py-md-2 py-xl-1" href="<%= WaiverSiteRef.BasePathRelativeBooking %>">
          <span class="d-none d-sm-flex flex-shrink-0 me-2">
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
