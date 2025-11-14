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
            phHeader.Controls.Add(new LiteralControl(string.Format("<img src=\"{1}\" alt=\"{0} Logo\" style=\"max-height: 40px;\"/>", WaiverSiteRef.Name, img.GetImageUrlDirectToSource())));
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

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand js-scroll-trigger" href="<%= WaiverSiteRef.BasePathRelativeBooking %>">
            <asp:PlaceHolder runat="server" ID="phHeader"></asp:PlaceHolder>
        </a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            Menu
            <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <uc1:NavbarBooking runat="server" id="NavbarBooking" />
            <asp:PlaceHolder runat="server" ID="ph0"></asp:PlaceHolder>
            
            <ul class="navbar-nav ms-auto">
                <% if (AuthenticatedCustomer != null) { %>
                <!-- Logged in: Show dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-user"></i> Account
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="<%= WaiverSiteRef.BasePathRelativeBooking %>/CustomerBookings.aspx">My Bookings</a></li>
                        <li><a class="dropdown-item" href="<%= WaiverSiteRef.BasePathRelativeBooking %>/CustomerOrders.aspx">Payment History</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item text-danger" href="<%= WaiverSiteRef.BasePathRelativeBooking %>/CustomerLogout.aspx">Log Out</a></li>
                    </ul>
                </li>
                <% } else { %>
                <!-- Not logged in: Show login link -->
                <li class="nav-item">
                    <a class="nav-link" href="<%= WaiverSiteRef.BasePathRelativeBooking %>/CustomerLogin.aspx">
                        <i class="fas fa-user"></i> Login
                    </a>
                </li>
                <% } %>
                
                <!-- Cart button -->
                <li class="nav-item">
                    <asp:LinkButton runat="server" ID="btnCartIcon" OnClick="btnCartIcon_Click" CssClass="nav-link position-relative">
                        <i class="fas fa-shopping-cart"></i>
                        <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-primary">
                            <asp:Label runat="server" ID="lblCartItemCount">0</asp:Label>
                        </span>
                    </asp:LinkButton>
                </li>
            </ul>
        </div>
    </div>
</nav>
